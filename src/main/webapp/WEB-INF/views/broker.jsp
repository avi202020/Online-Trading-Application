<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page session="true"%>
<html>
<head>
<title>WELCOME ${sessionScope.brokerObject.fName}</title>
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
		$("#admin").css("display","none");
	});
});

$(document).ready(function(){
	$(".butts4").click(function(){
		$("#admin").slideToggle("slow");
		$("#broker").css("display","none");
		$("#investors").css("display","none");
		$("#ctm").css("display","none");
	});
});

$(document).ready(function(){
	$(".butts2").click(function(){
		$("#broker").slideToggle("slow");
		$("#ctm").css("display","none");
		$("#investors").css("display","none");
		$("#admin").css("display","none");
	});
});
function popPndingOrders()
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
			    	t=document.createTextNode(json.myOrders[i].fullNameUser);
			    	z1.appendChild(t);
			    	document.getElementById("row"+counter).appendChild(z1);
			    	
			    	var z2=document.createElement("TD");
			    	t=document.createTextNode(json.myOrders[i].secSymbol);
			    	z2.appendChild(t);
			    	document.getElementById("row"+counter).appendChild(z2);
			    	
			    	var z9=document.createElement("TD");
			    	t=document.createTextNode(json.myOrders[i].secName);
			    	z9.appendChild(t);
			    	document.getElementById("row"+counter).appendChild(z9);
			    	
			    	var z3=document.createElement("TD");
			    	t=document.createTextNode(json.myOrders[i].bidPrice);
			    	z3.appendChild(t);
			    	document.getElementById("row"+counter).appendChild(z3);
			    	
			    	var z4=document.createElement("TD");
			    	t=document.createTextNode(json.myOrders[i].currPrice);
			    	z4.appendChild(t);
			    	document.getElementById("row"+counter).appendChild(z4);
			    	
			    	var z5=document.createElement("TD");
			    	t=document.createTextNode(json.myOrders[i].orderType);
			    	z5.appendChild(t);
			    	document.getElementById("row"+counter).appendChild(z5);
			    	
			    	var z6=document.createElement("TD");
			    	t=document.createTextNode(json.myOrders[i].quantity);
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
			    	
			    	var z9=document.createElement("TD");
			    	t=document.createTextNode(json.myOrders[i].validityDate);
			    	z9.appendChild(t);
			    	document.getElementById("row"+counter).appendChild(z9);
			    	
			    	}
				  }
			  
		  };	
		 xhtp.open("POST","popPendingOrders.htm",true);
		 xhtp.send();
		 return null;
	 }
	}

	
	function popdropdown()
	{
		
		var xtp=new XMLHttpRequest();
		  if (xtp == null)
        {
            alert("Your browser does not support AJAX!");
            return;
        }
		  else
		  {
			  xtp.onreadystatechange = function stateChanged()
			  {
				  if(xtp.readyState == 4 && xtp.status == 200)
					  {
					  	var t;
					  	
					    var json=JSON.parse(xtp.responseText);
					    var count=json.users.length;
					  
					    var nameArray =new Array(),i;
					    for(i=0;i<count;i++)
					    	{
					    	nameArray[i]=json.users[i];
					    	}
					  
					    var newDiv=document.createElement('div');
					    var a=document.getElementById("selection");
					    var html='<select class="form-control size" name="item" id="selectionOfUser">';
					    for(i=0;i<nameArray.length;i++)
					    	{
					    	html=html+"<option value='"+nameArray[i]+"'>"+nameArray[i]+"</option>";
					    	}
					    html += '</select>';
					
					    newDiv.innerHTML= html;
					    a.appendChild(newDiv);
					  }
			  }
			  xtp.open("POST","popDropDown.htm",true);
			  xtp.send();
			  return null;
	      }
		  
	}
	
	function chkorder(a,counter)
	{
		var chk;
	    var cn=document.getElementById(a).cells[0].innerHTML;
	    var time=document.getElementById(a).cells[8].innerHTML;
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
					    		var z10=document.createElement("TD");
					        	t=document.createElement("button");
						    	t.setAttribute("type","button");
						    	t.setAttribute("class","btn btn-default");
						    	t.setAttribute("disabled","disabled");
						    	var r=document.createTextNode("Added to tradeboard");
						    	t.appendChild(r);
						    	z10.appendChild(t);
						    	document.getElementById("row12"+counter).appendChild(z10);	
						  }
					  	else if(res.trim()=="true")
						  {
					  			var z10=document.createElement("TD");
						    	t=document.createElement("button");
						    	t.setAttribute("type","button");
						    	t.setAttribute("class","btn btn-warning");
						    	t.setAttribute("onClick","addToExchange(this.parentNode.parentNode.id)");
						    	var r=document.createTextNode("Place on Tradeboard!");
						    	t.appendChild(r);
						    	z10.appendChild(t);
						    	document.getElementById("row12"+counter).appendChild(z10);
						  }
					    
					  }
			  };
			  var query="ClientName="+ cn +"&ordertimeStamp="+ time;
			  xhttp.open("POST","chkOnExchange.htm",true);
			  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xhttp.send(query);
			  
		 }
	    
	}
	
	function getUsersPendOrders()
	{
		
		var client=document.getElementById("selectionOfUser");
		var user=client.options[client.selectedIndex].value;
		var table = document.getElementById("myWatchTable1");
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
					    var count=json.myUsersOrders.length;
					    var counter=1;
					    for(var i=0;i<count;i++,counter++)
				    	{
				    	var tablename=document.getElementById("myWatchTable1");
				    	var y1=document.createElement("TR");
				    	y1.setAttribute("id", "row12"+counter);
				    	tablename.tBodies[0].appendChild(y1);
				    	
				    	var z1=document.createElement("TD");
				    	t=document.createTextNode(json.myUsersOrders[i].fullNameUser);
				    	z1.appendChild(t);
				    	document.getElementById("row12"+counter).appendChild(z1);
				    	
				    	var z2=document.createElement("TD");
				    	t=document.createTextNode(json.myUsersOrders[i].secSymbol);
				    	z2.appendChild(t);
				    	document.getElementById("row12"+counter).appendChild(z2);
				    	
				    	var z9=document.createElement("TD");
				    	t=document.createTextNode(json.myUsersOrders[i].secName);
				    	z9.appendChild(t);
				    	document.getElementById("row12"+counter).appendChild(z9);
				    	
				    	var z3=document.createElement("TD");
				    	t=document.createTextNode(json.myUsersOrders[i].bidPrice);
				    	z3.appendChild(t);
				    	document.getElementById("row12"+counter).appendChild(z3);
				    	
				    	var z4=document.createElement("TD");
				    	t=document.createTextNode(json.myUsersOrders[i].currPrice);
				    	z4.appendChild(t);
				    	document.getElementById("row12"+counter).appendChild(z4);
				    	
				    	var z5=document.createElement("TD");
				    	t=document.createTextNode(json.myUsersOrders[i].orderType);
				    	z5.appendChild(t);
				    	document.getElementById("row12"+counter).appendChild(z5);
				    	
				    	var z6=document.createElement("TD");
				    	t=document.createTextNode(json.myUsersOrders[i].quantity);
				    	z6.appendChild(t);
				    	document.getElementById("row12"+counter).appendChild(z6);

				    	var z7=document.createElement("TD");
				    	t=document.createTextNode(json.myUsersOrders[i].totalAmount);
				    	z7.appendChild(t);
				    	document.getElementById("row12"+counter).appendChild(z7);
				    	
				    	var z8=document.createElement("TD");
				    	t=document.createTextNode(json.myUsersOrders[i].orderTimestamp);
				    	z8.appendChild(t);
				    	document.getElementById("row12"+counter).appendChild(z8);
				    	
				    	var z9=document.createElement("TD");
				    	t=document.createTextNode(json.myUsersOrders[i].validityDate);
				    	z9.appendChild(t);
				    	document.getElementById("row12"+counter).appendChild(z9);
				    	chkorder(z9.parentNode.id,counter);
				    	
				    	}
					  }
				  
			  };	
			 var query="userName=" + user;
			 xhtp.open("POST","popUsersPendingOrders.htm",true);
			 xhtp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			 xhtp.send(query);
			 return null;
		 }
		
	}
	
	function addToExchange(a)
	{
		var cn=document.getElementById(a).cells[0].innerHTML;
		var ss=document.getElementById(a).cells[1].innerHTML;
		var sn=document.getElementById(a).cells[2].innerHTML;
		var bp=document.getElementById(a).cells[3].innerHTML;
		var cp=document.getElementById(a).cells[4].innerHTML;
		var oty=document.getElementById(a).cells[5].innerHTML;
		var tq=document.getElementById(a).cells[6].innerHTML;
		var tm=document.getElementById(a).cells[7].innerHTML;
		var ot=document.getElementById(a).cells[8].innerHTML;
		var ov=document.getElementById(a).cells[9].innerHTML;
		
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
						   alert("not added");				 
						  }
					  	else
						  {
						  alert("added to tradeboard on exchange");
						  }
					    
					  }
			  };
			  var query="ClientName="+ cn +"&securitySymbol="+ ss +"&securityName="+ sn +"&bidPrice="+ bp +"&currentPrice="+ cp +"&OrderType="+ oty +"&tradedQuantity="+ tq +"&totalAmount="+ tm +"&OrderTimestamp="+ ot +"&OrderValidity"+ ov;
			  xhttp.open("POST","addToExchange.htm",true);
			  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xhttp.send(query);
			  
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
			 xmlHttp.open("POST","updateDetailsUserBroker.htm",true);
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
				 xmlHttp.open("POST","updatingUserBrokers.htm",true);
				 xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				 xmlHttp.send(query);
				 return null; 	 
			 }	
	}
</script>
</head>
<body onload="popPndingOrders(); popdropdown();">
<style>
#imagge img
{
position: absolute;
bottom:0px;
left:0px;
}
.size{
width:300px;
margin-left:450px;
}

#myWatch1
{
margin-top: 20px;
}
.welcome {
	color: #FFB732;
	font-size: 20px;
	margin-top: 11px;
}

#admin
{
display:none;
}
#broker{
display:none;
}
body
{
font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
}
thead
		{
		font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
		background-color:#666666 ;
		font-size:22px;
		color:#FFB732;
		font-weight:lighter;
		
		}
		.centerButt
		{
		margin-top :10px;
		margin-left: 550px;
		}
		
.butts4 {
	background-color: #fff2eb;
	height: 100px;
	width: 100%;
	border-style: none;
}

.butts1 {
	background-color: #ff9051;
	height: 100px;
	width: 100%;
	border-style: none;
}
#oneP
{
margin-left: 230px;
}
.butts2 {
	background-color: #ffc19e;
	height: 100px;
	width: 100%;
	border-style: none;
	float:right;
}
.butts3 {
	background-color: #ffe2d1;
	height: 100px;
	width: 100%;
	border-style: none;
}
.panelC {
	padding: 0px;
	font-size: 20px;
	font-weight: bold;
	margin-left:10px;
}

.updateBtn
{
margin-left: 500px;

}
</style>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">TradeShares.com |</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="welcome"><b>WELCOME
						${sessionScope.brokerObject.fName}
						${sessionScope.brokerObject.lName}</b></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/trading/logout.htm"><span
						class="glyphicon glyphicon-log-in"></span> Logout </a></li>
			</ul>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 panelC" id="oneP">
				<button type="button" class="butts1" onClick="popPndingOrders()">
					VIEW ALL PENDING ORDERS<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-tasks">
					</span>
				</button>
			</div>
			<div class="col-md-3 panelC">
				<button type="button" class="butts2">
					VIEW CLIENT SPECIFIC PENDING ORDERS<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-briefcase">
					</span>
				</button>
			</div>
		
			<div class="col-md-3 panelC">
				<button type="button" class="butts4" onClick="updateDetails()">
					MANAGE YOUR PROFILE<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-briefcase">
					</span>
				</button>
			</div>
		</div>
	</div>
	<div class="container-fluid">
	<div class="row" class="colorDark">
	 
			<div id="ctm" class="panel panel-default" >
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<div class="panel-body">
				<h1 class="heading text-center">#My Pending Orders</h1>
  			   		<div class="row">
      					<div id="myWatch1">
 						<table class="table table-hover table-bordered" id="myWatchTable">
 							 <thead>
      							<tr>
        							<th>Client's Name</th>
        							<th>Security Symbol</th>
        							<th>Security Name</th>
        							<th>Bid Price</th>
        							<th>Current Price</th>
        							<th>Order Type</th>
        							<th>Traded Quantity</th>
        							<th>Total Amount</th>
        							<th>Order Timestamp</th>
        							<th>Order Validity</th>
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
				<h1 class="heading text-center">#Client Specific Orders</h1>
				<h3 class="text-center heading">select a Client:</h3><div id="selection"></div>
				<button type="button" class="btn btn-default centerButt" onClick="getUsersPendOrders();">Get Results</button>
  			   		<div class="row">
      					<div id="myWatch1">
 						<table class="table table-hover table-bordered" id="myWatchTable1">
 							 <thead>
      							<tr>
        							<th>Client's Name</th>
        							<th>Security Symbol</th>
        							<th>Security Name</th>
        							<th>Bid Price</th>
        							<th>Current Price</th>
        							<th>Order Type</th>
        							<th>Traded Quantity</th>
        							<th>Total Amount</th>
        							<th>Order Timestamp</th>
        							<th>Order Validity</th>
        							<th>Place order on Exchange</th>
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
		</div><!-- container-fluid close -->
		
		<div class="container">
		<div class="row">
		<div id="admin" class="panel panel-default">
			<div class="panel-body">
				<h1 class="heading text-center"># Update Details</h1>
 				 	<label>First Name:</label><input type="text" class="form-control emailId" placeholder="first Name" name="firstname" disabled="disabled" id="firstnameAdmin" required/><br />
	  			 	<label>Last Name:</label><input type="text" class="form-control emailId" placeholder="Last Name" name="lName" id="lastnameAdmin" disabled="disabled"/> <br />
	  				<label>Email ID:</label><input type="email" class="form-control emailId" placeholder="Email ID" name="eMailID" id="emailAdmin" required/><br />
				    <label>UserName:</label><input type="text" class="form-control emailId" placeholder="Username" name="userName" id="usernameAdmin" disabled="disabled"/> <br />
	  				<label>Password:</label><input type="password" placeholder="password" class="pw form-control" name="password" id="passwordAdmin" required/><br />
      				<label>Contact Number:</label><input type="text" placeholder="Contact Number" class="form-control emailId" name="contact" id="contactAdministrator" required/><br />
	  				<label>Address:</label><input type="text" placeholder="Address" class="form-control emailId" name="address" id="address1" required/><br />
     				<button type="button" class="btn btn-warning updateBtn" onClick="updating()">Update Details</button>
     				
			</div><!-- closing panel body -->
		</div><!-- panel close -->
		</div><!-- complete row close -->
	</div>
</body>