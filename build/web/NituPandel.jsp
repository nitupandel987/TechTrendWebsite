<%-- 
    Document   : NituPandel
    Created on : 09-Apr-2023, 5:55:25 pm
    Author     : NITU PANDEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    
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
        <body class="light-background">
        
        <%@include file="normal_navbar.jsp" %>
        
<section class="h-100 gradient-custom-2">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-lg-9 col-xl-7">
        <div class="card">
          <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
            <div class="ms-4 mt-5 d-flex flex-column" style="width: 400px; ">
              <img src="img/nitu.jpg"
                alt="Generic placeholder image" class="img-fluid img-thumbnail mt-4 mb-2"
                style="width: 350px; height: 350px; z-index: 1">
             
            </div>
            <div class="ms-3" style="margin-top: 130px;">
              <h5>NITU PANDEL</h5>
              <p>SOFTWARE ENGINEER</p>
            </div>
          </div>
          <div class="p-4 text-black" style="background-color: #f8f9fa;">
            <div class="d-flex justify-content-end text-center py-1">
              <div>
                  <p class="mb-1 h5"><a href="https://www.linkedin.com/in/nitu-pandel-ab14a1204/">LinkedIn</a></p>
              </div>
                
              <div class="px-3">
                  <p class="mb-1 h5"><a href="https://twitter.com/pandel_nitu">Twitter</a></p>
                
              </div>
              <div>
                  <p class="mb-1 h5"><a href="mailto:2020pcecsnitu137@poornima.org">Email</a></p>
                
              </div>
            </div>
          </div>
          <div class="card-body p-4 text-black">
            <div class="mb-5">
              <p class="lead fw-normal mb-1">About</p>
              <div class="p-4" style="background-color: #f8f9fa;">
                <p class="font-italic mb-1">"Hey there, I'm a 3rd-year computer science student with a passion 
                    for backend Java development. I'm a hardworking and energetic person who is always looking to 
                    learn and improve. Communication is key for me, and I love working with others to achieve great
                    things. If you're interested in
                    connecting or have any cool opportunities to share, feel free to reach out!"</p>
                
               
              </div>
            </div>
         
           
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


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
    </body>
</html>
