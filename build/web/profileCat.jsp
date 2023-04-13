<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<div class="row">

    <%
         
        User u = (User)session.getAttribute("currentUser");
        
        postDao d = new postDao(ConnectionProvider.getConnection());
       
        int cid = Integer.parseInt(request.getParameter("cid"));
       
        List<post> posts  = null;
        
        if(cid == 0){
        posts = d.getAllPost();
        }
        else{
        posts = d.getPostByCatId(cid);
        }
       
         
        for (post p : posts) {
    %>

    <div class="col-md-4 mt-2">

        <div class="card" >
            <div class="card-body">
                <img class="card-img-top" src="post_pics/<%= p.getpPic()%>" alt="Card image cap">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>
                <pre><%= p.getpCode()%></pre>

            </div>
                
                <div class="card-footer text-center">
                            
                   
                     <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn primary-background btn-sm text-white ">Read more</a>
                   
                  
                </div>

        </div>


    </div>

    <%
        }

    %>


</div>