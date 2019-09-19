<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="asserts/css/bootstrap.min.css">
    <title>Document</title>
</head>
<body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h5>Fund request</h5>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Fund Type
                            </div>
                        </div>
                        <select id="FundType" class="form-control">
                            <option>--Fund type--</option>
                            <option value="CLOTHS">Cloths</option>
                            <option value="FOOD">Food</option>
                            <option value="MEDICAL">Medical</option>
                            <option value="OTHERS">Others</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Amount
                            </div>
                        </div>
                        <input type="number" name="amount" id="amount" class="form-control" placeholder="Amount" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                Expire date
                            </div>
                        </div>
                        <input type="date" name="expireDate" id="expireDate" class="form-control" />
                    </div>
                </div>
                <button onclick="Request()" class="btn btn-outline-secondary">Send</button>
            </div>
        </div>
    <script src="asserts/js/jquery-3.4.1.min.js"></script>
  	<script src="asserts/js/bootstrap.min.js"></script>
    <script>
        function Request()
        {
        	var data = localStorage.getItem('admin_Data');
			var adminData = JSON.parse(data);
			var id = JSON.stringify(adminData);
            
        	var AdminId =adminData.admin_id;
            var FundType = $('#FundType').val();
            var amount = $('#amount').val();
            var date = $('#expireDate').val();
            console.log("id=>"+adminData.admin_id);
            console.log("FundType=>"+FundType);
            console.log("amount=>"+amount);
            console.log("expiredate=>"+date);
            var formData = "id="+AdminId+"&FundType="+FundType+"&amount="+amount+"&date="+date;
            var url = "http://localhost:8080/charity/RequestServlet?"+formData;
            $.get(url,function(data){
                console.log(data)
                //alert('fund request success');
                console.log('fund request success!');
            });
        }
    </script>
</body>
</html>

