<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.userDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>


<%

    User u = (User) session.getAttribute("currentUser");

    if (u == null) {
        response.sendRedirect("login.jsp");
    }

%>

<%

int postId = Integer.parseInt(request.getParameter("post_id"));

postDao d = new postDao(ConnectionProvider.getConnection());
post p = d.getPostByPostId(postId);


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> || Tech Blog</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>

            .banner_backgroung{
                clip-path: polygon(0 0, 100% 0, 100% 100%, 71% 92%, 27% 93%, 0 100%);
            }

            .post-title{
                font-weight: 100;
                font-size: 30px;
                
            }
            
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            
            .post-date{
                font-style: italic;
              
                
            }
            .post-user-info{
                font-size: 20px;
                
            }


        </style>
        
        
    </head>
    <body class="light-background">
        
        <!--Navbar-->
    
        
             <nav class="navbar navbar-expand-lg navbar-dark primary-background">
           <a class="navbar-brand" href="index.jsp"><span class="fa fa-cogs mr-2">  </span>TechTREND</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                 
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#post-modal"><span class="fa fa-send-o mr-1"></span>Post</a>
                    </li>


                </ul>
                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a class="nav-link" href="#!"  data-toggle="modal" data-target="#profile-model"> <span class="fa fa-user mr-1"> </span> <%= u.getName()%> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="logOut"><span class="fa fa-sign-out mr-1"></span>Log Out</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        
        
        
        <!--End of Navbar-->
        
        
        <!--Main Content of body-->
        
        <div class="container ">
            
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    
                    <div class="card">
                        
                        <div class="card-header  primary-background">
                            
                            <h4 class="post-title text-center text-white"><%= p.getpTitle()   %></h4>
                            
                            
                        </div>
                            <div class="card-body">
                                <!--<img class="card-img-top my-2" src="post_pics/<%= p.getpPic()%> alt=Card image cap ">-->
                               
                                
                                <img class="card-img-top center" src="post_pics/<%= p.getpPic()%>" alt="Card image cap" >
                                
                                <div class="row my-3">
                                    
                                    <div class="col-md-8">
                                        <%
                                        userDao ud = new userDao(ConnectionProvider.getConnection());
                                        

                                        %>
                                        <p class="post-user-info"> <a href="#" > <%= ud.getUserByUserId(p.getUserId()).getName() %> </a> </p>
                                    </div>
                                    <div class="col-md-4">
                                        <p class="post-date" > <%= DateFormat.getDateInstance().format(p.getpDate()) %> </p>
                                        
                                    </div>
                                </div>
                                
                                <p class="post-content"><%= p.getpContent() %></p>
                                <br>
                                <br>
                                
                                <div class="post-code">
                                <pre> <%= p.getpCode() %> </pre>
                                </div>
 
                            </div>
                                
                                  <div class="card-footer primary-background">
                                      
                                      <%
                                      LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                                      %>
                                      
                                      <a href="#" onclick="doLike(<%= p.getPid() %>, <%= u.getId() %>)" class="btn primary-background btn-sm text-white "><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span> </a>

                   
                    <a href="#" class="btn primary-background btn-sm text-white"><i class="fa fa-commenting-o "></i> <span>20</span> </a>
                </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
        <!--End of main content-->
        
              <!--Profile Modal-->



        <!-- Modal -->
        <div class="modal fade" id="profile-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white  ">
                        <h5 class="modal-title" id="exampleModalLabel"><%= u.getName()%> </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">

                            <!--Space ke karan image show nhi ho rhi thi-->
                            <img src="pics/<%= u.getProfile()%>" class="img-fluid" style=" max-width:100px;">  




                            <div id="profile-details">

                                <table class="table mt-3">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> Email </th>
                                            <td> <%= u.getEmail()%> </td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td> <%= u.getGender()%> </td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About</th>
                                            <td> <%= u.getAbout()%> </td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered On</th>
                                            <td> <%= u.getDateTime()%> </td>

                                        </tr>
                                    </tbody>
                                </table>

                            </div>

                            <!--Edit The Profile-->

                            <div id="profile-edit" style="display:none;">
                                <h3>Edit Your Profile</h3>




                                <form action ="EditServlet" method="POST" enctype = "multipart/form-data">

                                    <table class="container">

                                        <tr>
                                            <td> Name </td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= u.getName()%>"> </td>
                                        </tr>

                                        <tr>
                                            <td> Email: </td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= u.getEmail()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td> Password </td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= u.getPassword()%>"> </td>
                                        </tr>

                                        <tr>
                                            <td> About </td>
                                            <td>
                                                <textarea row="3" class="form-control" name="user_about">
                       
                                                    <%= u.getAbout()%>   
                       
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> Profile </td>
                                            <td> <input type="file" class="form-control" name="image" value="<%= u.getProfile()%>"> </td>
                                        </tr>

                                    </table>

                                    <div class="container">

                                        <button type="submit" class="btn primary-background text-white">Save</button>

                                    </div>
                                </form>

                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button id="edit-profile-button" type="button" class="btn primary-background text-white">Edit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--End of profile modal-->





        <!--Add Post Modal-->
        <div class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Modal body text goes here.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">Save changes</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--End Of Post Modal-->



        <!-- Modal -->
        <div class="modal fade" id="post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddServletPost" method="POST">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---select category---</option>

                                    <%
                                        postDao postd = new postDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();

                                        for (Category c : list) {

                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>


                            <div class="form-group">
                                <input name="pTitle"  type="text" placeholder="title of the post" class="form-control"/> 
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="enter the content" style="height:200px" ></textarea>


                            </div>

                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="enter the Code(if any)" style="height:100px" ></textarea>                  
                            </div>


                            <div class="form-group">

                                <label>Add Image</label> 
                                <input type="file" name ="pic">

                            </div>


                            <div>


                                <div class="container text-center">
                                    <button type="submit" class="btn primary-background text-white">Post</button>

                                </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>









        <!--Profile Edit-->







        <!-- JavaScript -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>

            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-button').click(function () {
//                

                    if (!editStatus) {

                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");

                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                    }




                })


            });



        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!--Add post JS-->

        <script>

            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted...
                    event.preventDefault();

                    console.log("Submitted!!!");

                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddServletPost",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jpXHR) {
                            //success
                            if (data.trim() === 'Done')
                                swal({icon: "success", });
                            else
                                swal({icon: "error", });


                        },
                        error: function (jpXHR, textStatus, errorThrown) {
                            //error
                            swal({icon: "error", });
                        },
                        processData: false,
                        contentType: false
                    })
                });
            });


        </script>
        
        
        
        
        
        
    </body>
</html>
