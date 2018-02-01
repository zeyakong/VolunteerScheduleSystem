<!doctype html>
<html lang="en">
<head>
    <title>Hello, world!</title>
    <%@include file="common/head.jsp"%>
    <style>
        body{
            padding-top: 50px;
            padding-bottom: 50px;
        }
        .carousel{
            height:450px;
            background-color: #000000;
            margin-bottom:60px;
        }
        .carousel .carousel-item{
            height:450px;
            background-color: #000000;
        }

        .carousel img{
            width:100%;
        }

        .carousel-caption {
            top: 140px;
            bottom: auto;
        }

        #summary-container .col-md-4{
            text-align: center;
        }

        .divider{
            margin-top:40px;
            margin-bottom: 40px;
        }

        .feature{
            padding:30px;
        }

        .feature-heading{
            font-size: 50px;
            color: #2a6496;
            margin-top: 20px;
        }
        .feature .img{
            text-align: center;
            padding-top: 7%;
        }
    </style>
</head>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark" >

    <div class="container">
    <a class="navbar-brand" href="#">Volunteer Schedule System</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#bottom">Introduce</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Account
                </a>
                <div class="dropdown-menu"  aria-labelledby="navbarDropdown" id="tab-list">
                    <a class="dropdown-item" id="1"data-target="#carouselExampleIndicators" data-slide-to="0">Volunteer</a>
                    <a class="dropdown-item" id="2" data-target="#carouselExampleIndicators" data-slide-to="1">Program Manager</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" id="3" data-target="#carouselExampleIndicators" data-slide-to="2">Admin</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#aboutModal">About</a>
            </li>
        </ul>
    </div>
    </div>
</nav>

<!-- Modal about-->
<div class="modal fade" id="aboutModal" tabindex="-1" role="dialog" aria-labelledby="aboutModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="aboutModalLabel">About</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p> This system was developed by Zeya Kong. It is a CS741 course project. All of these are used for study.</p>
                <br>
                <p>Developer email: kong.zeya@uwlax.edu</p>
                <p>Student of University of Wisconsin-La Crosse</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>





<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" >
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="carousel-caption d-none d-md-block">
                <h1>Volunteer</h1>
                <h6>Add us to be a volunteer! You can apply any request services and enjoy it!</h6>
                <br>
                <br>
                <br>
                <button type="button" class="btn btn-light" data-toggle="modal" data-target="#loginModal1">Log In</button>
                <h> or </h>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#registerModal1">Sign Up</button>
            </div>
            <img class="d-block w-100" src="/img/1.jpg" alt="First slide">
        </div>
        <div class="carousel-item">
            <div class="carousel-caption d-none d-md-block">
                <h1>Program Manager</h1>
                <h6>Join us to be a program manager! You can post any request services and find the volunteers</h6>
                <br>
                <br>
                <br>
                <button type="button" class="btn btn-light" data-toggle="modal" data-target="#loginModal2">Log In</button>
                <h> or </h>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#registerModal2">Sign Up</button>
            </div>
            <img class="d-block w-100" src="/img/2.jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
            <div class="carousel-caption d-none d-md-block">
                <h1>Administrator</h1>
                <h6>View all of the account information and match the applications from different volunteers</h6>
                <br>
                <br>
                <br>
                <button type="button" class="btn btn-light" data-toggle="modal" data-target="#loginModal3">Log In</button>
            </div>
            <img class="d-block w-100" src="/img/3.jpg" alt="Third slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!-- Modal login-->
<div class="modal fade" id="loginModal1" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel1">Volunteer Log In</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="loginun1">Username</label>
                        <input type="text" class="form-control" id="loginun1" placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <label for="loginpw1">Password</label>
                        <input type="password" class="form-control" id="loginpw1" placeholder="Password">
                    </div>
                    <%--<div class="form-check">--%>
                        <%--<label class="form-check-label">--%>
                            <%--<input type="checkbox" class="form-check-input">--%>
                            <%--Check me out--%>
                        <%--</label>--%>
                    <%--</div>--%>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<!-- Modal login-->
<div class="modal fade" id="loginModal2" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel2">Program Manager Log In</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="loginun2">Username</label>
                        <input type="text" class="form-control" id="loginun2" placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <label for="loginpw2">Password</label>
                        <input type="password" class="form-control" id="loginpw2" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<!-- Modal login-->
<div class="modal fade" id="loginModal3" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel3" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel3">Admin Log In</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="loginun3">Username</label>
                        <input type="text" class="form-control" id="loginun3" placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <label for="loginpw3">Password</label>
                        <input type="password" class="form-control" id="loginpw3" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>


<!-- Modal register-->
<div class="modal fade" id="registerModal1" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="registerModalLabel1">Volunteer Register</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="registerun1">Username</label>
                        <input type="text" class="form-control" id="registerun1" placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <label for="registerpw1">Password</label>
                        <input type="password" class="form-control" id="registerpw1" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label for="registercpw1">Conform Password</label>
                        <input type="password" class="form-control" id="registercpw1" placeholder="Enter Password Again">
                    </div>
                    <div class="form-group">
                        <label for="registerem1">Email(Optional)</label>
                        <input type="email" aria-describedby="emailHelp" class="form-control" id="registerem1" placeholder="Enter Email">
                        <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <%--<div class="form-check">--%>
                    <%--<label class="form-check-label">--%>
                    <%--<input type="checkbox" class="form-check-input">--%>
                    <%--Check me out--%>
                    <%--</label>--%>
                    <%--</div>--%>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<!-- Modal login-->
<div class="modal fade" id="registerModal2" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="registerModalLabel2">Program Manager Sign Up</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="registerun2">Username</label>
                        <input type="text" class="form-control" id="registerun2" placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <label for="registerpw2">Password</label>
                        <input type="password" class="form-control" id="registerpw2" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label for="registercpw2">Conform Password</label>
                        <input type="password" class="form-control" id="registercpw2" placeholder="Enter Password Again">
                    </div>
                    <div class="form-group">
                        <label for="registerem2">Email(Optional)</label>
                        <input type="email" aria-describedby="emailHelp" class="form-control" id="registerem2" placeholder="Enter Email">
                        <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>


<div class="container" id="summary-container">
   <div class = "row">
       <div class="col-md-4">
           <img src="/img/volunteer.png">
           <h2>Volunteer</h2>
           <br>
           <p>Do you want to find a flexible volunteering opportunity? Join us and you can find the suitable position.</p>
           <button type="button" id ="4" class="btn btn-primary"data-target="#carouselExampleIndicators" data-slide-to="0">Start</button>
       </div>
       <div class="col-md-4">
           <img src="/img/manager.png">
           <h2>Program Manager</h2>
           <br>
           <p>Do you want to post some request services? As a program manager, you can provide any volunteering opportunities!</p>
           <button type="button" id ="5" class="btn btn-primary" data-target="#carouselExampleIndicators" data-slide-to="1">Start</button>
       </div>
       <div class="col-md-4">
           <img src="/img/admin.png">
           <h2>Administrator</h2>
           <br>
           <p>Are you the admin of this system? Enter in and match some applications!</p>
           <br>
           <button type="button" id ="6" class="btn btn-primary" data-target="#carouselExampleIndicators" data-slide-to="2">Start</button>
       </div>
   </div>
<hr class="divider">

<nav class="nav nav-tabs" id="myTab" role="tablist">
    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Volunteer</a>
    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Program Manager</a>
    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Administrator</a>
</nav>

<div class="tab-content" id="nav-tabContent">
    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
        <div class = "row feature">
        <div class="col-md-9">

            <h2 class="feature-heading">Volunteer</h2>
            <p class="lead">Volunteer can view all of the information about request services. You can apply any number of request services which you want.
                Same request can not be applied twice. If your application is suitable and the admin match them successfully, you can receive an email about the details.
            Once you get the application successfully, you can not cancel it and if you can not attend, you should ask anther person to replace you position.</p>
        </div>
        <div class="col-md-3 img">
            <img src="/img/volunteer.png">
        </div>
        </div>
    </div>
    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
        <div class = "row feature">
        <div class="col-md-3 img">
            <img src="/img/manager.png">
        </div>
        <div class="col-md-9">
            <h2 class="feature-heading">Program Manager</h2>
            <p class="lead">Program manager can post any number of request services and you are responsible for the correctness of all the information you post.
            You can edit previous request services which you post before. You can also cancel it.
            If one of your request services find enough volunteers, you will receive an email about all the information about this request</p>
        </div>
        </div>
    </div>
    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
        <div class = "row feature">
        <div class="col-md-9">
            <h2 class="feature-heading">Administrator</h2>
            <p class="lead">Admin is the most important position in this system. You are responsible for managing all of the accounts. In addition, You can also create new volunteer or manager account
            What's more? You should match all of suitable applications for any post request services</p>
        </div>
        <div class="col-md-3 img">
            <img src="/img/admin.png">
        </div>
        </div>
    </div>
</div>

<hr class="divider">

<footer id = "bottom">
    <p class="float-sm-right"><a href="#top">Go To Top</a></p>
    <p>@ 2017 Zeya Kong </p>
</footer>
</div>
<%@include file="common/bottom.jsp"%>
<script type="text/javascript">
    $(document).ready(function(){
        $("#1").click(function(){
            $(window).scrollTop(0);
        });
        $("#2").click(function(){
            $(window).scrollTop(0);
        });
        $("#3").click(function(){
            $(window).scrollTop(0);
        });
        $("#4").click(function(){
            $(window).scrollTop(0);
        });
        $("#5").click(function(){
            $(window).scrollTop(0);
        });

        $("#6").click(function(){
            $(window).scrollTop(0);
        });
    });
</script>
</body>
</html>