<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

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
    <body  class="light-background">

        <!-- navbar -->
        <%@include file="normal_navbar.jsp" %>

        <main class="d-flex align-items-center pt-5 " style="height:60vh">

            <div class="container">

                <div class="row">

                    <div class="col-md-4 offset-md-4">

                        <div class="card">

                            <div class="card-header primary-background text-white text-center">
                                <p>Login Here</p>
                            </div>

                            <%
                                Message m = (Message) session.getAttribute("message");

                                if (m != null) {

                            %>
                            <div class="alert  <%= m.getCssClass()%> text-center" role="alert">
                                <%= m.getContent()%>
                            </div>

                            <%

                                    session.removeAttribute("message");

                                }

                            %>


                            <div class="card-body">

                                <form action="LoginServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name ="user_email" required="" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required="" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>

                                    <div class="container text-center text-white">
                                        <button type="submit" class="btn btn primary-background text-white">Submit</button></div>
                                </form>

                            </div>
                        </div>


                    </div>



                </div>


            </div>



        </main>
                            
                            
                       

        <!-- JavaScript -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--        <script>
                    
                    $(document).ready(function(){
                        alert("Document Loaded");
                    });
                    
                </script>-->

        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
