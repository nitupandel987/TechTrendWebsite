<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

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
    <body class="light-background">
        <%@include file="normal_navbar.jsp" %>


        <main class="pt-5">

            <div class="container">

                <div class="col-md-6 offset-md-3">

                    <div class="card">

                        <div class="card-header text-center primary-background text-white">
                            Register Here
                        </div>

                        <div class="card-body">

                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>


                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender" value="male" >Male
                                    <input type="radio" id="gender" name="gender" value="female">Female

                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name ="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control"   cols="30" rows="5" placeholder="Tell me about yourself"></textarea>
                                </div>


                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Terms and Condition</label>
                                </div>
                                <br>

                                <div class="container text-center " id="loader" style="display:none"></div>
                                <div class=" text-center">
                                <button id="submit-btn" type="submit" class="btn text-white primary-background">Sign Up</b</div>
                            </form>

                        </div>
                     
                    </div>

                </div>

            </div>

        </main>
        
        <%@include  file="footer.jsp" %>


        <!-- JavaScript -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>

            $(document).ready(function () {
                console.log("Loaded!");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();
                    //send register servlet

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jpXHR) {
                            console.log(data);
                            $("#submit-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'Done') {
                                swal("Good job!", "Data Submited!", "success").then((value) => {
                                    window.location = "login.jsp";
                                });
                            } else {
                                swal(data);
                            }

                        },
                        error: function (jpXHR, textStatus, errorThrow) {

                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("Try Again!").then((value) => {
                                window.location = "login.jsp";
                            });
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });



        </script>

    </body>
</html>
