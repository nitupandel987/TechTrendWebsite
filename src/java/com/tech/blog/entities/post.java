
package com.tech.blog.entities;
import java.sql.*;





public class post {
     private int pid;
     private String pTitle ;
     private String pContent;
     private String pCode;
     private String pPic;
     private Timestamp pDate;
     private int catid;
     private int userId;

    public post(int pid, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catid, int userId) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catid = catid;
        this.userId = userId;
    }

    public post() {
    }

    public post(String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catid, int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catid = catid;
        this.userId = userId;
    }
     
    

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }
    
    public int getUserId(){
       return userId;
    }
    
    public void setUserId(int userId){
        this.userId = userId; 
    }
     
     
     
     
     
  
}
