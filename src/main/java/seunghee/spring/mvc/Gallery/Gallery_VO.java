package seunghee.spring.mvc.Gallery;

public class Gallery_VO {

    private String gno;
    private String title;
    private String userid;
    private String regdate;
    private String views;
    private String thumbs;
    private String contents;
    private String fnames;
    private String fsizes;
    private String uuid;

    public String getGno() {
        return gno;
    }

    public void setGno(String gno) {
        this.gno = gno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getViews() {
        return views;
    }

    public void setViews(String views) {
        this.views = views;
    }

    public String getThumbs() {
        return thumbs;
    }

    public void setThumbs(String thumbs) {
        this.thumbs = thumbs;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getFnames() {
        return fnames;
    }

    public void setFnames(String fnames) {
        this.fnames = fnames;
    }

    public String getFsizes() {
        return fsizes;
    }

    public void setFsizes(String fsizes) {
        this.fsizes = fsizes;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
