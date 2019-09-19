<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Donor Login</title>
</head>
<body class="bg-light">
         <jsp:include page="header.jsp"></jsp:include>
    <div class="row justify-content-center align-items-center" style="height: 80vh;margin:0;">
        <div class="col-md-6 col-lg-3 text-center">
            <h5 class="text-secondary" style="padding: 10px 0">Donor Login</h5>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            Name
                        </div>
                    </div>
                    <input type="Name" name=" name" id="name" class="form-control" placeholder="Name" required/>
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
            <button type="submit" class="btn btn-outline-secondary" onclick="donorLogin()">Login</button>
            <p>Already haven't an account <a href="DonorRegister.jsp">Click here</a>.</p>
            <p><a href="#">Forget password</a></p>
        </div>
    </div>
     <script src="asserts/js/jquery-3.4.1.min.js"></script>
  	<script src="asserts/js/bootstrap.min.js"></script>
    <script>
function donorLogin()
        {
            var name = $('#name').val();
            var password = $('#password').val();
            var formData = "name="+name+"&password="+password;
            var url = "http://localhost:8080/charity/DonorServlet?"+formData;
                        $.get(url,function(data){
                       	 console.log(data);
                           // alert(data);
                           // alert("donor Login success");
                                    window.location.replace('DonorHome.jsp');
                                    localStorage.setItem('Donor_Data',data);
                        });
          
        }
        </script> 
        </body>
</html>