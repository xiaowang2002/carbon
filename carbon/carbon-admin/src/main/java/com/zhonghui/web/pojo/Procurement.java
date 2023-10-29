package com.zhonghui.web.pojo;

import java.util.Date;
import java.io.Serializable;

/**
 * 公告法规动态(ProcurementList)实体类
 *
 * @author Wang Zhisheng
 * @since 2023-10-28 22:20:51
 */
public class Procurement implements Serializable {
    private static final long serialVersionUID = -35551448842983525L;
    /**
     * 列表id
     */
    private Integer listId;
    /**
     * 标题
     */
    private String title;
    /**
     * 发布时间
     */
    private Date releaseTime;
    /**
     * 内容
     */
    private String text;
    /**
     * 附件下载地址
     */
    private String attachment;
    /**
     * 发布者
     */
    private String publisher;
    /**
     * 类型 1公告，2法规，3动态
     */
    private Integer listType;
    /**
     * 图片
     */
    private String img;
    /**
     * 简略描述
     */
    private String sketch;


    public Integer getListId() {
        return listId;
    }

    public void setListId(Integer listId) {
        this.listId = listId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Integer getListType() {
        return listType;
    }

    public void setListType(Integer listType) {
        this.listType = listType;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getSketch() {
        return sketch;
    }

    public void setSketch(String sketch) {
        this.sketch = sketch;
    }

}

