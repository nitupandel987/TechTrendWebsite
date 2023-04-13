 package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.post;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class postDao {

    Connection con;

    public postDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {

        ArrayList<Category> list = new ArrayList<>();
        try {

            String q = "select * from categories";
            Statement stmt = this.con.createStatement();
            ResultSet set = stmt.executeQuery(q);

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String des = set.getString("description");

                Category c = new Category(cid, name, des);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(post p) {
        boolean f = false;

        try {

            String q = "insert into posts(pTitle, pContent, pCode, pPic, catid, userId) values (?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatid());
            pstmt.setInt(6, p.getUserId());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    public ArrayList<post> getAllPost(){
        
        ArrayList<post> list = new ArrayList<>();
//        Fetch all the post

try{
    
   PreparedStatement pstmt = con.prepareStatement("select * from posts order by pid desc");
   ResultSet set = pstmt.executeQuery();
   
   while(set.next()){
       int pid = set.getInt("pid");
       String pTitle = set.getString("pTitle");
       String pContent = set.getString("pContent");
       String pCode = set.getString("pCode");
       String pPic = set.getString("pPic");
       Timestamp pDate = set.getTimestamp("pDate");
       int catId = set.getInt("catid");
       int userId = set.getInt("userId");
       
       post p = new post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
       list.add(p);
       
       
   }
    
}
catch(Exception e){
    e.printStackTrace();
}

        return list;        
    }
    
    public ArrayList<post> getPostByCatId(int catid){
         ArrayList<post> list = new ArrayList<>();
//        Fetch all the post by Id
try{
    
   PreparedStatement pstmt = con.prepareStatement("select * from posts where catid =?");
   pstmt.setInt(1, catid);
   ResultSet set = pstmt.executeQuery();
   
   while(set.next()){
       int pid = set.getInt("pid");
       String pTitle = set.getString("pTitle");
       String pContent = set.getString("pContent");
       String pCode = set.getString("pCode");
       String pPic = set.getString("pPic");
       Timestamp pDate = set.getTimestamp("pDate");
     
       int userId = set.getInt("userId");
       
       post p = new post(pid, pTitle, pContent, pCode, pPic, pDate, catid, userId);
       list.add(p);
       
       
   }
    
}
catch(Exception e){
    e.printStackTrace();
}
        return list;  
    }
    

public post getPostByPostId(int postId){
    
    String q = "select * from posts where pid = ?";
    post po = null;
    
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);
            ResultSet set = p.executeQuery();
            
            if(set.next()){
             
       int pid = set.getInt("pid");
       String pTitle = set.getString("pTitle");
       String pContent = set.getString("pContent");
       String pCode = set.getString("pCode");
       String pPic = set.getString("pPic");
       Timestamp pDate = set.getTimestamp("pDate");
       int cid = set.getInt("catid");
     
       int userId = set.getInt("userId");
       po = new post(pid, pTitle, pContent, pCode, pPic, pDate, cid, userId);
                
            }
            
            
        }
        catch (Exception e) {
            
           e.printStackTrace();
           
        }
        
        return po;
    
    
    
    
}

}
