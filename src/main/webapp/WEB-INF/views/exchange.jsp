<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>WELCOME ${sessionScope.InvestorObject.fName}</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
   <script>
 $(document).ready(function(){
		$(".butts1").click(function(){
			$("#ctm").slideToggle("slow");
			$("#broker").css("display","none");
			$("#investors").css("display","none");
		});
	});
 
 $(document).ready(function(){
		$(".butts3").click(function(){
			$("#investors").slideToggle("slow");
			$("#ctm").css("display","none");
			$("#broker").css("display","none");
		});
	});
 $(document).ready(function(){
		$(".butts2").click(function(){
			$("#broker").slideToggle("slow");
			$("#ctm").css("display","none");
			$("#investors").css("display","none");
		});
	});
 
 function popOrders()
 {
	 

		var table = document.getElementById("myWatchTable");
		for(var i = table.rows.length - 1; i > 0; i--)
		{
		    table.deleteRow(i);
		}
		var xhtp;
		xhtp=new XMLHttpRequest();
		 if (xhtp == null)
	     {
	         alert("Your browser does not support AJAX!");
	         return;
	     }
		 else
		 {
			 xhtp.onreadystatechange = function stateChanged()
			  {
				  if(xhtp.readyState == 4 && xhtp.status == 200)
					  {
					    var t;
					    var json=JSON.parse(xhtp.responseText);
					 
					    var count=json.myOrders.length;
					    var counter=1;
					    for(var i=0;i<count;i++,counter++)
				    	{
				    	var tablename=document.getElementById("myWatchTable");
				    	var y1=document.createElement("TR");
				    	y1.setAttribute("id", "row"+counter);
				    	tablename.tBodies[0].appendChild(y1);
				    	
				    	var z1=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].clientName);
				    	z1.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z1);
				    	
				    	var z2=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].brokerName);
				    	z2.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z2);
				    	
				    	var z11=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].secSymbol);
				    	z11.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z11);
				    	
				    	var z12=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].securityName);
				    	z12.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z12);
				    	
				    	var z3=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].bidPrice);
				    	z3.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z3);
				    	
				    	var z4=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].currentPrice);
				    	z4.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z4);
				    	
				    	var z5=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].orderType);
				    	z5.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z5);
				    	
				    	var z6=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].tradeQuantity);
				    	z6.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z6);

				    	var z7=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].totalAmount);
				    	z7.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z7);
				    	
				    	var z8=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].orderTimestamp);
				    	z8.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z8);
				    	
				    	}
					  }
				  
			  };	
			 xhtp.open("POST","popTradeOrders.htm",true);
			 xhtp.send();
			 return null;
		 }
	 
 }
 
 function updateDetails()
	{
		
		 var xmlHttp=new XMLHttpRequest();
		 if (xmlHttp == null)
	     {
	         alert("Your browser does not support AJAX!");
	         return;
	     }
		 else
		 {
			 xmlHttp.onreadystatechange = function stateChanged()
			  {
				  if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
					  {
					  var json=JSON.parse(xmlHttp.responseText);
					  document.getElementById("firstnameAdmin").value=json.details.fName;
  				  	  document.getElementById("lastnameAdmin").value=json.details.lName;
					  document.getElementById("emailAdmin").value=json.details.email;
					  document.getElementById("usernameAdmin").value=json.details.username;
					  document.getElementById("passwordAdmin").value=json.details.pass;
					  document.getElementById("contactAdministrator").value=json.details.contact;
					  document.getElementById("address1").value=json.details.address;
					  
					  }
			  }
			 xmlHttp.open("POST","updateDetailsUserTM.htm",true);
			 xmlHttp.send();
			 return null; 	 
		 }
		
	}
	
 
 function updating()
	{
		  var emid=document.getElementById("emailAdmin").value;
		  var pass=document.getElementById("passwordAdmin").value;
		  var contact=document.getElementById("contactAdministrator").value;
		  var add=document.getElementById("address1").value;
		  var xmlHttp=new XMLHttpRequest();
			 if (xmlHttp == null)
		     {
		         alert("Your browser does not support AJAX!");
		         return;
		     }
			 else
			 {
				 xmlHttp.onreadystatechange = function stateChanged()
				  {
					  if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
						  {

						  	var res= xmlHttp.responseText;
						    if(res.trim()=="false")
							  {
							   alert("not update");				 
							  }
						  	else
							  {
							  alert("Details updated");
							  }
						  }
				  }
				 var query="eMailID="+ emid +"&password="+ pass +"&contact="+ contact +"&address="+ add;
				 xmlHttp.open("POST","updatingUserTM.htm",true);
				 xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				 xmlHttp.send(query);
				 return null; 	 
			 }
		  
		
	}
 
 
 
 function MatchOrders()
 {
	 var table = document.getElementById("myWatchTableMatch");
		for(var i = table.rows.length - 1; i > 0; i--)
		{
		    table.deleteRow(i);
		}
	 var xmlHttp=new XMLHttpRequest();
	 if (xmlHttp == null)
     {
         alert("Your browser does not support AJAX!");
         return;
     }
	 else
	 {
		 xmlHttp.onreadystatechange = function stateChanged()
		  {
			  if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
				  {
				  var t;
				    var json=JSON.parse(xmlHttp.responseText);
				    var count=json.tradeOrdersList.length;
				    var counter=1;
				    for(var i=0;i<count;i++,counter++)
			    	{
			    	var tablename=document.getElementById("myWatchTableMatch");
			    	var y1=document.createElement("TR");
			    	y1.setAttribute("id", "rowMatch"+counter);
			    	tablename.tBodies[0].appendChild(y1);
			    	
			    	var z1=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].clientName);
			    	z1.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z1);
			    	
			    	var z2=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].brokerName);
			    	z2.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z2);
			    	
			    	var z11=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].secSymbol);
			    	z11.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z11);
			    	
			    	var z12=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].securityName);
			    	z12.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z12);
			    	
			    	var z3=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].bidPrice);
			    	z3.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z3);
			    	
			    	var z5=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].orderType);
			    	z5.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z5);
			    	
			    	var z6=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].tradeQuantity);
			    	z6.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z6);

			    	var z7=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].totalAmount);
			    	z7.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z7);
			    	
			    	var z8=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].orderTimestamp);
			    	z8.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z8);
			    	
			    	var z9=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].tradeTime);
			    	z9.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z9);
			    	
			    	var z4=document.createElement("TD");
			    	t=document.createTextNode(json.tradeOrdersList[i].counterParty);
			    	z4.appendChild(t);
			    	document.getElementById("rowMatch"+counter).appendChild(z4);
			    	chkorder(z4.parentNode.id,counter);
			    	}
				  }
		  }
		 xmlHttp.open("POST","matchOrders.htm",true);
		 xmlHttp.send();
		 return null; 
	}
	 
 }
 
 function chkorder(a,counter)
 {
 	var chk;
    var cn=document.getElementById(a).cells[0].innerHTML;
    var ss=document.getElementById(a).cells[2].innerHTML;
    var tt=document.getElementById(a).cells[8].innerHTML;
    var c=document.getElementById(a).cells[10].innerHTML;
 	var xhttp;
 	xhttp=new XMLHttpRequest();
 	 if (xhttp == null)
      {
          alert("Your browser does not support AJAX!");
          return;
      }
 	  else
 	 {
 		  xhttp.onreadystatechange = function stateChanged()
 		  {
 			  if(xhttp.readyState == 4 && xhttp.status == 200)
 				  {
 				    var res= xhttp.responseText;
 				    if(res.trim()=="true")
 					  {
 				    	var z20=document.createElement("TD");
 				    	t=document.createElement("button");
 				    	t.setAttribute("id","dynbut"+counter);
 				    	t.setAttribute("type","button");
 				    	t.setAttribute("class","btn btn-warning");
 				    	t.setAttribute("onClick","settleOrders(this.parentNode.parentNode.id,this.id)");
 				    	var r=document.createTextNode("Settle This Trade!");
 				    	t.appendChild(r);
 				    	z20.appendChild(t);
 				    	document.getElementById("rowMatch"+counter).appendChild(z20);
 					  }
 				    	
 				    else
 					  {

 				    	
 				    	var z20=document.createElement("TD");
 				    	t=document.createElement("button");
 				    	t.setAttribute("id","dynbut"+counter);
 				    	t.setAttribute("type","button");
 				    	t.setAttribute("class","btn btn-default");
 				    	t.setAttribute("disabled","disabled");
 				    	var r=document.createTextNode("Trade settled!!");
 				    	t.appendChild(r);
 				    	z20.appendChild(t);
 				    	document.getElementById("rowMatch"+counter).appendChild(z20);
 				    	
 					  }
 				  	
 				  }
 		  };
 		  var query="clientName="+ cn +"&secSymbol="+ ss+"&Tradetimestamp="+ tt+"&counters="+ c; 
 		  xhttp.open("POST","chkSett.htm",true);
 		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xhttp.send(query);
 		  
 	 }
     
 }
 function settleOrders(a,b)
 {
	 alert(b);
	 var cn=document.getElementById(a).cells[0].innerHTML;
	 var bn=document.getElementById(a).cells[1].innerHTML;
	 var ss=document.getElementById(a).cells[2].innerHTML;
	 var sn=document.getElementById(a).cells[3].innerHTML;
	 var bp=document.getElementById(a).cells[4].innerHTML;
	 var ot=document.getElementById(a).cells[5].innerHTML;
	 var num=document.getElementById(a).cells[6].innerHTML;
	 var ta=document.getElementById(a).cells[7].innerHTML;
	 var ort=document.getElementById(a).cells[8].innerHTML;
	 var tt=document.getElementById(a).cells[9].innerHTML;
	 var counter=document.getElementById(a).cells[10].innerHTML;
	 var xhttp;
		xhttp=new XMLHttpRequest();
		 if (xhttp == null)
	     {
	         alert("Your browser does not support AJAX!");
	         return;
	     }
		  else
		 {
			  xhttp.onreadystatechange = function stateChanged()
			  {
				  if(xhttp.readyState == 4 && xhttp.status == 200)
					  {
					    var res= xhttp.responseText;
					    if(res.trim()=="false")
						  {
						   alert("Trade not settled");				 
						  }
					  	else
						  {
						  alert("Trade settled");
						  document.getElementById(b).setAttribute("disabled", "disabled");
						  }
					    
					  }
			  };
			  var query= "ClientName=" + cn + "&brokerName="+ bn +"&orderTimestamp=" + ort + "&secsymbol=" + ss + "&secname=" + sn + "&bidPrice=" + bp + "&orderType=" + ot+ "&NumOfShares=" + num+ "&amountS=" + ta+ "&tradetime=" + tt+ "&counter=" + counter;
			  xhttp.open("POST","addToSettlement.htm",true);
			  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xhttp.send(query);
			  
		 }
	 
 }
 </script>
 </head>
 <body onload="popOrders()"> 
 <style>
 thead
		{
		font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
		background-color:#666666 ;
		font-size:22px;
		color:#FFB732;
		font-weight:lighter;
		
		}
.butts3 {
	background-color: #ffe2d1;
	height: 140px;
	width: 100%;
	border-style: none;
}
 .panelC {
	padding: 0px;	
	font-weight: bold;
	font-size: 23px;
	margin-left: 10px;
}
 body
{
font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
}

#broker
{
display:none;
}
 .butts1 {
	background-color: #ff9051;
	height: 140px;
	width: 100%;
	border-style: none;
	margin-bottom: 0px;
}
.butts2 {
	background-color: #ffc19e;
	height: 140px;
	width: 100%;
	border-style: none;
	float:right;
}

#oneP
{
margin-left:230px;
}

#investors
{
display:none;
}
.allorders
{
background-color: gray;
color:white;
font-size:18px;
width:100%;
margin-top: 0px;
font-weight: normal;
padding: 0px 0px 0px 0px;
margin-bottom: 0px;
}
 .welcome
		{
		color:#FFB732;
		font-size:20px;
		margin-top:11px;
		}
 </style>
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">TradeShares.com |</a>
    </div>
    <ul class="nav navbar-nav">
     <li class="welcome"><b>WELCOME ${sessionScope.tmObject.fName} ${sessionScope.tmObject.lName}</b></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/trading/logout.htm"><span class="glyphicon glyphicon-log-in"></span> Logout </a></li>
    </ul>
  </div>
</nav>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 panelC" id="oneP">
				<button type="button" class="butts1">
					VIEW ALL ORDERS FOR TRADE<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-tasks">
					</span>
					<div class="allorders">
						<p class="text-center">Get the details of all the orders placed by Brokers on behalf of Clients </p>
					</div>
				</button>
				
			</div>
			<div class="col-md-3 panelC">
				<button type="button" class="butts2" onClick="MatchOrders();">
					SETTLE ALL ORDERS<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-briefcase">
					</span>
					<div class="allorders">
						<p class="text-center">This will automatically check for buy and sell order and match them for a trade to happen </p>
					</div>
				</button>
			</div>
			<div class="col-md-3 panelC">
				<button type="button" class="butts3" onClick="updateDetails()">
					MANAGE YOUR PROFILE<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-briefcase">
					</span>
					<div class="allorders">
						<p class="text-center">This will help you to update your details and save these details for future </p>
					</div>
				</button>
			</div>
			
		</div>
	</div><!-- closed container fluid -->
		<div class="container-fluid">
	<div class="row">
	 
			<div id="ctm" class="panel panel-default" >
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<div class="panel-body">
				<h1 class="heading text-center">#All Placed Orders</h1>
  			   		<div class="row">
      					<div id="myWatch1">
 						<table class="table table-hover table-bordered" id="myWatchTable">
 							 <thead>
      							<tr>
        							<th>Client's Name</th>
        							<th>Broker's Name</th>
        							<th>Security Symbol</th>
        							<th>Security Name</th>
        							<th>Bid Price</th>
        							<th>Current Price</th>
        							<th>Order Type</th>
        							<th>Traded Quantity</th>
        							<th>Total Amount</th>
        							<th>Order Timestamp</th>
      							</tr>
      						</thead>
      						<tbody>
      						</tbody>
  						</table>     
      					</div>
     		 		</div><!-- row closed -->
				</div><!-- closing panel body -->
			</div><!-- panel close -->
			</div><!-- col closed -->
		</div><!-- complete row close -->
		
		
		
		
		<div class="row">
			<div id="broker" class="panel panel-default" >
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<div class="panel-body">
				<h1 class="heading text-center">#All Matched Orders</h1>
  			   		<div class="row">
      					<div id="myWatch1">
 						<table class="table table-hover table-bordered" id="myWatchTableMatch">
 							 <thead>
      							<tr>
        							<th>Client's Name</th>
        							<th>Broker's Name</th>
        							<th>Security Symbol</th>
        							<th>Security Name</th>
        							<th>Bid Price</th>
        							<th>Order Type</th>
        							<th>Traded Quantity</th>
        							<th>Total Amount</th>
        							<th>Order Timestamp</th>
        							<th>Trade timestamp</th>
        							<th>Counterparty</th>
        							<th>Action</th>
      							</tr>
      						</thead>
      						<tbody>
      						</tbody>
  						</table>     
      					</div>
     		 		</div><!-- row closed -->
				</div><!-- closing panel body -->
			</div><!-- panel close -->
			</div><!-- col closed -->
		</div><!-- complete row close -->
		
		
		<div class="row">
			<div id="investors" class="panel panel-default" >
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<div class="panel-body">
				<h1 class="heading text-center">#Update Your Profile</h1>
  			   		<div class="row">
      				<label>First Name:</label><input type="text" class="form-control emailId" placeholder="first Name" name="firstname" disabled="disabled" id="firstnameAdmin" required/><br />
	  			 	<label>Last Name:</label><input type="text" class="form-control emailId" placeholder="Last Name" name="lName" id="lastnameAdmin" disabled="disabled"/> <br />
	  				<label>Email ID:</label><input type="email" class="form-control emailId" placeholder="Email ID" name="eMailID" id="emailAdmin" required/><br />
				    <label>UserName:</label><input type="text" class="form-control emailId" placeholder="Username" name="userName" id="usernameAdmin" disabled="disabled"/> <br />
	  				<label>Password:</label><input type="password" placeholder="password" class="pw form-control" name="password" id="passwordAdmin" required/><br />
      				<label>Contact Number:</label><input type="text" placeholder="Contact Number" class="form-control emailId" name="contact" id="contactAdministrator" required/><br />
	  				<label>Address:</label><input type="text" placeholder="Address" class="form-control emailId" name="address" id="address1" required/><br />
     				<button type="button" class="btn btn-warning updateBtn" onClick="updating()">Update Details</button>
     		 		</div><!-- row closed -->
				</div><!-- closing panel body -->
			</div><!-- panel close -->
			</div><!-- col closed -->
		</div><!-- complete row close -->
		
		
		
		
		
		</div><!-- container-fluid close -->
 </body>