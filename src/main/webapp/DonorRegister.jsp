<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="asserts/css/bootstrap.min.css">
    <title>Donor Register</title>
</head>
<body class="bg-light">
     <jsp:include page="header.jsp"></jsp:include>
    <div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
        <div class="col-md-6 col-lg-3 text-center">
            <h5 class="text-secondary" style="padding: 10px 0">Donor Register</h5>
            
            <!-- <form onsubmit="donorRegister()"> -->
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    Name
                                </div>
                            </div>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Name"/>
                        </div>
                    </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Email
                            </div>
                        </div>
                        <input type="email" name="email" id="email" class="form-control" placeholder="Email" required/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Password
                            </div>
                        </div>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                    </div>
                </div>
                <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    Age
                                </div>
                            </div>
                            <input type="number" name="Age" id="Age" class="form-control"/>
                        </div>
                    </div>
                <button onclick="donorRegister()" type="submit" class="btn btn-outline-secondary">Login</button>
                <p>Already have an account <a href="donorLogin.jsp">Click here</a>.</p>
            <!-- </form> -->
        </div>
    </div>
    
    <script src="asserts/js/jquery-3.4.1.min.js"></script>
  	<script src="asserts/js/bootstrap.min.js"></script>
<script>
    $(function(){
        console.log('this is jquery!');
    });
function donorRegister()
{
	event.preventDefault();
    let name = $('#name').val();
    let email = $('#email').val();
    let password = $('#password').val();
    let Age = $('#Age').val();
    var formData = "name="+name+"&email="+email+"&password="+password+"&Age="+Age;
    var url = "http://localhost:8080/charity/DonorRegister?" + formData;
    console.log(url);
    $.get(url,function(response){
      // alert('register success!'); 
       window.location.replace('Donorlogin.jsp');
    });
} 
</script>
</body>
</html>