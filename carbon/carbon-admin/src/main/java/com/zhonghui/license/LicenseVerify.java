package com.zhonghui.license;

import de.schlichtherle.license.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.prefs.Preferences;

public class LicenseVerify {
    private static Logger logger = LogManager.getLogger(LicenseVerify.class);

    public LicenseVerify() {
    }

    public synchronized LicenseContent install(LicenseVerifyParam param) {
        LicenseContent result = null;
        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            LicenseManager licenseManager = LicenseManagerHolder.getInstance(this.initLicenseParam(param));
            licenseManager.uninstall();
            File licensePath = new File(param.getLicensePath());
            File[] files = licensePath.listFiles(new FRFilenameFilter());
            File licenseFile = files[0];
            result = licenseManager.install(licenseFile);
        } catch (Exception var8) {

        }

        return result;
    }

    public boolean verify() {
        LicenseManager licenseManager = LicenseManagerHolder.getInstance((LicenseParam)null);
        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return true;

    }

    private LicenseParam initLicenseParam(LicenseVerifyParam param) {
        Preferences preferences = Preferences.userNodeForPackage(LicenseVerify.class);
        CipherParam cipherParam = new DefaultCipherParam(param.getStorePass());
        KeyStoreParam publicStoreParam = new CustomKeyStoreParam(LicenseVerify.class, param.getPublicKeysStorePath(), param.getPublicAlias(), param.getStorePass(), (String)null);
        return new DefaultLicenseParam(param.getSubject(), preferences, publicStoreParam, cipherParam);
    }
}
