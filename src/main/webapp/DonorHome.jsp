<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="asserts/css/bootstrap.min.css">
<title>Donor Home</title>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="row justify-content-center">
		<div class="col-md-8">
			<select id="Fund_Type" class="form-control" onchange="ListRequest()">
				<option>--SELECT--</option>
				<option value="CLOTHS">CLOTHS</option>
				<option value="FOOD">Food</option>
				<option value="MEDICAL">Medical</option>
				<option value="OTHERS">Others</option>
			</select>
			<!--  <div class="row" id="transaction" style="display:none;">
            	<div class="col">
            		
            		<button onclick=""></button>
            	</div>
            </div>-->
			<table class="table">
				<thead>
					<tr>
						<th>Fund_Type</th>
						<th>Amount</th>
						<th>Expire Date</th>
						<th>Amountfunded</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody id="requestTable">

				</tbody>
			</table>
		</div>
	</div>

	<script src="asserts/js/jquery-3.4.1.min.js"></script>
	<script src="asserts/js/bootstrap.min.js"></script>
	<script>
		function donate(Id) {
			/* Get donor details */
			var data = localStorage.getItem('Donor_Data');
			var donarObj = JSON.parse(data);
			console.log(donarObj);
			//donarObj.donor_id
			var amount = $("#amount").val();
			console.log("Id=>" + Id);
			console.log("donor_id=>" + donarObj.donor_id);
			console.log("amount=>" + amount);
			var formData = "donor_id=" + donarObj.donor_id + "&Id=" + Id
					+ "&amount=" + amount;
			var url = "http://localhost:8080/charity/TransactionServlet?"
					+ formData;
			$.get(url, function(data) {
				console.log('transaction success!');
				console.log(data);
				//alert('transaction success!');
			});

		}

		function ListRequest() {

			var Fund_Type = $('#Fund_Type').val();
			var formData = "Fund_type=" + Fund_Type;
			var url = "http://localhost:8080/charity/RequestTypeServlet?"
					+ formData;
			console.log(url);
			$
					.get(
							url,
							function(datas) {
								var requestData = JSON.parse(datas);
								var tbody = $('#requestTable');
								var content = "";
								console.log("requestData=>" + requestData);
								var data = requestData;
								console.log(data);
								// for(data of requestData)
								{
									content += '<tr><td>';
									content += data.Fund_type;
									content += '</td><td>';
									content += data.Amount
									content += '</td><td>';
									content += data.Expire_date.day + "-"
											+ data.Expire_date.month + "-"
											+ data.Expire_date.year;
									content += '</td><td>';
									content += '<input type="number" id="amount" placeholder="Amountfunded"/>';
									content += '</td><td>';
									var click = "donate('" + data.id + "')";
									content += '<button class="btn btn-outline-success" onclick=' + click + '>Donate</button>';
									content += '</td></tr>';
								}
								console.log(content);
								tbody.html(content);
							});
		}
	</script>
</body>
</html>