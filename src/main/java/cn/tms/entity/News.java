package cn.tms.entity;

import java.util.Date;

/**
 * Created by administered on 2017/11/6.
 */
public class News {
    private Integer id;
    private String title;
    private String columnname;
    private Integer clicks;
    private String status;
    private String creator;
    private Date updatetime;
    private String datetime;
    private String zhenwenn;
    private String defaulttitle;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getColumnname() {
        return columnname;
    }

    public void setColumnname(String columnname) {
        this.columnname = columnname;
    }

    public Integer getClicks() {
        return clicks;
    }

    public void setClicks(Integer clicks) {
        this.clicks = clicks;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getZhenwenn() {
        return zhenwenn;
    }

    public void setZhenwenn(String zhenwenn) {
        this.zhenwenn = zhenwenn;
    }

    public String getDefaulttitle() {
        return defaulttitle;
    }

    public void setDefaulttitle(String defaulttitle) {
        this.defaulttitle = defaulttitle;
    }
}
