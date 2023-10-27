package com.zhonghui.license;

import de.schlichtherle.license.*;
import de.schlichtherle.xml.GenericCertificate;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.YamlPropertiesFactoryBean;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.task.SimpleAsyncTaskExecutor;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.web.client.AsyncRestTemplate;

import java.beans.ExceptionListener;
import java.beans.XMLDecoder;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

public class CustomLicenseManager extends LicenseManager {
    private static Logger logger = LogManager.getLogger(CustomLicenseManager.class);
    private static final String XML_CHARSET = "UTF-8";
    private static final int DEFAULT_BUFSIZE = 8192;
    @Value("${product.url}")
    private String url;

    public CustomLicenseManager() {
    }

    public CustomLicenseManager(LicenseParam param) {
        super(param);
    }

    protected synchronized byte[] create(LicenseContent content, LicenseNotary notary) throws Exception {
        this.initialize(content);
        GenericCertificate certificate = notary.sign(content);
        return this.getPrivacyGuard().cert2key(certificate);
    }

    protected synchronized LicenseContent install(byte[] key, LicenseNotary notary) throws Exception {
        GenericCertificate certificate = this.getPrivacyGuard().key2cert(key);
        notary.verify(certificate);
        LicenseContent content = (LicenseContent)this.load(certificate.getEncoded());
        this.validate(content);
        this.setLicenseKey(key);
        this.setCertificate(certificate);
        return content;
    }

    protected synchronized LicenseContent verify(LicenseNotary notary) throws Exception {
        GenericCertificate certificate = this.getCertificate();
        byte[] key = this.getLicenseKey();

        certificate = this.getPrivacyGuard().key2cert(key);
        notary.verify(certificate);
        LicenseContent content = (LicenseContent)this.load(certificate.getEncoded());
        this.validate(content);
        this.setCertificate(certificate);
        return content;

    }



    protected synchronized void validate(LicenseContent content) throws LicenseContentException {
        super.validate(content);
        LicenseCheckModel expectedCheckModel = (LicenseCheckModel)content.getExtra();
        LicenseCheckModel serverCheckModel = this.getServerInfos();
        if (expectedCheckModel != null && serverCheckModel != null) {
            if (!this.checkIpAddress(expectedCheckModel.getIpAddress(), serverCheckModel.getIpAddress())) {
                throw new LicenseContentException("当前服务器的IP没在授权范围内");
            } else if (!this.checkIpAddress(expectedCheckModel.getMacAddress(), serverCheckModel.getMacAddress())) {
                throw new LicenseContentException("当前服务器的Mac地址没在授权范围内");
            } else if (!this.checkSerial(expectedCheckModel.getMainBoardSerial(), serverCheckModel.getMainBoardSerial())) {
                throw new LicenseContentException("当前服务器的主板序列号没在授权范围内");
            } else if (!this.checkSerial(expectedCheckModel.getCpuSerial(), serverCheckModel.getCpuSerial())) {
                throw new LicenseContentException("当前服务器的CPU序列号没在授权范围内");
            } else {
                if (StringUtils.isNotBlank(expectedCheckModel.getCpuSerial()) && StringUtils.isNotBlank(expectedCheckModel.getMainBoardSerial())) {
                    HashMap applyParam = new HashMap();
                    applyParam.put("licenseId", expectedCheckModel.getLicenseId());
                    applyParam.put("licenseCheckModel", serverCheckModel);
                    SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
                    factory.setConnectTimeout(100);
                    factory.setReadTimeout(200);
                    factory.setTaskExecutor(new SimpleAsyncTaskExecutor());
                    AsyncRestTemplate asyncRestTemplate = new AsyncRestTemplate(factory);
                    String url = getBootstrapYml("product.url") + "/license/checkLicense";
                    MultiValueMap<String, String> headers = new LinkedMultiValueMap();
                    headers.add("Content-Type", "application/json;charset=UTF-8");
                    HttpEntity<Object> httpEntity = new HttpEntity(applyParam, headers);
                    ListenableFuture<ResponseEntity<HashMap>> entity = asyncRestTemplate.postForEntity(url, httpEntity, HashMap.class, new Object[0]);
                    entity.addCallback((result) -> {
                        if (!(Boolean)((HashMap)result.getBody()).get("result")) {
                            try {
                                this.uninstall();
                            } catch (Exception var3) {
                                var3.printStackTrace();
                            }
                        }

                    }, (e) -> {
                    });
                }

            }
        } else {
            throw new LicenseContentException("不能获取服务器硬件信息");
        }
    }

    private Object load(String encoded) {
        BufferedInputStream inputStream = null;
        XMLDecoder decoder = null;

        try {
            inputStream = new BufferedInputStream(new ByteArrayInputStream(encoded.getBytes("UTF-8")));
            decoder = new XMLDecoder(new BufferedInputStream(inputStream, 8192), (Object)null, (ExceptionListener)null);
            Object var4 = decoder.readObject();
            return var4;
        } catch (UnsupportedEncodingException var14) {
            var14.printStackTrace();
        } finally {
            try {
                if (decoder != null) {
                    decoder.close();
                }

                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (Exception var13) {
                logger.error("XMLDecoder解析XML失败", var13);
            }

        }

        return null;
    }

    private LicenseCheckModel getServerInfos() {
        String osName = System.getProperty("os.name").toLowerCase();
        AbstractServerInfos abstractServerInfos = null;
        if (osName.startsWith("windows")) {
            abstractServerInfos = new WindowsServerInfos();
        } else if (osName.startsWith("linux")) {
            abstractServerInfos = new LinuxServerInfos();
        } else {
            abstractServerInfos = new LinuxServerInfos();
        }

        return ((AbstractServerInfos)abstractServerInfos).getServerInfos();
    }

    private boolean checkIpAddress(List<String> expectedList, List<String> serverList) {
        if (expectedList != null && expectedList.size() > 0) {
            if (serverList != null && serverList.size() > 0) {
                Iterator var3 = expectedList.iterator();

                while(var3.hasNext()) {
                    String expected = (String)var3.next();
                    if (serverList.contains(expected.trim())) {
                        return true;
                    }
                }
            }

            return false;
        } else {
            return true;
        }
    }

    private boolean checkSerial(String expectedSerial, String serverSerial) {
        if (StringUtils.isNotBlank(expectedSerial)) {
            return StringUtils.isNotBlank(serverSerial) && expectedSerial.equals(serverSerial);
        } else {
            return true;
        }
    }

    public static Object getBootstrapYml(Object key) {
        Resource resource = new ClassPathResource("/application.yml");
        Properties properties = null;

        try {
            YamlPropertiesFactoryBean yamlFactory = new YamlPropertiesFactoryBean();
            yamlFactory.setResources(new Resource[]{resource});
            properties = yamlFactory.getObject();
        } catch (Exception var4) {
            var4.printStackTrace();
            return null;
        }

        return properties.get(key);
    }
}
