<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Trend</title>
        <!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <style>

            .banner_backgroung{
                clip-path: polygon(0 0, 100% 0, 100% 100%, 71% 92%, 27% 93%, 0 100%);
            }

        </style>
    </head>

    <body>

        <!-- navbar -->
        <%@include file="normal_navbar.jsp" %>

        <!-- Banner -->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron text-dark light-background banner_backgroung">
                <div class="row">
                         <div class="col-md-4 text-center">

                        <img src="img/cover.png" alt="alt" style="height:60vh" />
                    </div>
                    <div class="col-md-8 text-justify">



                          <h3 class="text-center mb-3">
 Your Source for the Latest
  <large class="text-muted">Tech Insights!</large>
</h3>
                     
                        <p>
                            
                          At Tech TREND, we are dedicated to keeping you ahead in the fast-paced world of technology. 
                          Our mission is to provide you with cutting-edge content that covers the latest tech trends, 
                          innovations, and insights to help you stay informed and empowered in the ever-evolving tech landscape.  
                        </p>
                        
                        <p>
                            From artificial intelligence to blockchain, cloud computing to cybersecurity, Internet of Things to 
                            digital transformation, our team of tech enthusiasts and industry experts are passionate about exploring 
                            the latest advancements and sharing their knowledge with you. Whether you're a tech professional, a business 
                            owner, a student, or just someone curious about technology, Tech TREND has something for everyone.
                        </p>

                        <div class="text-center">
                        <a href="register_page.jsp" class="btn btn-outline-light btn-lg  primary-background "><span class="fa fa-asl-interpreting mr-2"></span>Start</a>
                   </div>
                        </div>
               
                </div>
            </div>

        </div>

        <br>
        <p class="container">
        <h3 class=" text-center display-5">BLOGS</h3>
        </p>
        <!-- Cards -->
        <main>

            <div class="container">
                <div class="container-fluid"  id="post-container"></div>

            </div>



        </div>

    </main>    
        
        <%@include  file="footer.jsp" %>




    <!<!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!--        <script>
                
                $(document).ready(function(){
                    alert("Document Loaded");
                });
                
            </script>-->

    <script src="js/myjs.js" type="text/javascript"></script>

    <script>

        function getPosts(catId) {


            $.ajax({
                url: "profileCat.jsp",
                data: {cid: catId},
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $("#loader").hide();
                    $('#post-container').html(data);
                }
            });
        }

        $(document).ready(function (e) {
            getPosts(0);

        });

    </script> 
</body>

</html>
