<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page session="true"%>
<html>
<head>
<title>WELCOME ${sessionScope.adminObject.fName}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<script>
re = /^[a-zA-Z]+$/;
regcon=/^[0-9]+$/;
regemail=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
ret = /^\w+$/;
regpw=/^[a-zA-Z]\w{3,14}$/;
regadd=/^[a-zA-Z0-9]+$/;
function createTM()
{
	var fn=document.getElementById("fName").value;
	 if(!re.test(fn)) {
		  document.getElementById('fNameDiv').style.display = 'block';
		  document.getElementById("fNameDiv").innerHTML="FirstName must contain only letters!!";
	      return false;
	    } 
	var ln=document.getElementById("lName").value;
	 if(!re.test(ln)) {
		  document.getElementById('lNameDiv').style.display = 'block';
		  document.getElementById("lNameDiv").innerHTML="LastName must contain only letters!!";
	      return false;
	    } 
	var con=document.getElementById("contact").value;
	 if(!regcon.test(con)) {
		  document.getElementById('contactDiv').style.display = 'block';
		  document.getElementById("contactDiv").innerHTML="Contact Number must contain only letters!!";
	      return false;
	    } 
	var em=document.getElementById("email").value;
	var un=document.getElementById("userName").value;
	 if(!ret.test(un)) {
		  document.getElementById('userNameDiv').style.display = 'block';
		  document.getElementById("userNameDiv").innerHTML="UserName must contain only letters,alphabets and underscores!!";
	      return false;
	    } 
	var pw=document.getElementById("pwd").value;
	 if(!regpw.test(pw)) {
		  document.getElementById('pwdDiv').style.display = 'block';
		  document.getElementById("pwdDiv").innerHTML="Password must only contain letter number and underscore( first character must be a letter)!!";
	      return false;
	    }
	var ad=document.getElementById("add").value;
	 if(!regadd.test(ad)) {
		  document.getElementById('addDiv').style.display = 'block';
		  document.getElementById("addDiv").innerHTML="Invalid Characters in Address!!";
	      return false;
	    }
	var ct=document.getElementById("city").value;
	 if(!re.test(ct)) {
		  document.getElementById('cityDiv').style.display = 'block';
		  document.getElementById("cityDiv").innerHTML="City must contain only letters!!";
	      return false;
	    } 
	var st=document.getElementById("state").value;
	 if(!re.test(st)) {
		  document.getElementById('state').style.display = 'block';
		  document.getElementById("state").innerHTML="State must contain only letters!!";
	      return false;
	    } 
	var co=document.getElementById("country").value;
	 if(!re.test(co)) {
		  document.getElementById('countryDiv').style.display = 'block';
		  document.getElementById("countryDiv").innerHTML="Country must contain only letters!!";
	      return false;
	    } 
	var add=ad+" "+ct+" "+st+" "+co;
	
	var xmlHttp;
	xmlHttp=new XMLHttpRequest();
	
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
					  
					  var returnedValue=xmlHttp.responseText;
					  if(returnedValue.trim()=="false")
						  {
						   alert("not added");
						  }
					  else if(returnedValue.trim()=="true")
					  	  {
					  	  alert("Trading membr has been added to the database and an Email ha been set to the Trading Member created");
					  	 setTimeout(populateTM, 1000);
					  	  }
					  }
			  };
			  var query= "Firstname=" + fn + "&lastname=" + ln + "&contact=" + con + "&email=" + em+ "&add=" + add+ "&username=" + un+ "&password=" + pw;
			  xmlHttp.open("POST","addTM.htm",true);
			  xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xmlHttp.send(query);
			
			  return null;
		}
	}
	
function hidefName1()
{
	document.getElementById('fName1Div').style.display = 'none';
	}
function hidelName1()
{
	document.getElementById('lName1Div').style.display = 'none';
	}
function hidecontact1()
{
	document.getElementById('contact1Div').style.display = 'none';
	}
function hideemail1()
{
	document.getElementById('email1Div').style.display = 'none';
	}
function hideuserName1()
{
	document.getElementById('userName1Div').style.display = 'none';
	}
function hidepwd1()
{
	document.getElementById('pwd1Div').style.display = 'none';
	}
function hideadd1()
{
	document.getElementById('add1Div').style.display = 'none';
	}
function hidecity1()
{
	document.getElementById('city1Div').style.display = 'none';
	}
function hidestate1()
{
	document.getElementById('state1Div').style.display = 'none';
	}
function hidecountry1()
{
	document.getElementById('country1Div').style.display = 'none';
	}
function hidefName()
{
	document.getElementById('fNameDiv').style.display = 'none';
	}
function hidelName()
{
	document.getElementById('lNameDiv').style.display = 'none';
	}
function hidecontact()
{
	document.getElementById('contactDiv').style.display = 'none';
	}
function hideemail()
{
	document.getElementById('emailDiv').style.display = 'none';
	}
function hideuserName()
{
	document.getElementById('userNameDiv').style.display = 'none';
	}
function hidepwd()
{
	document.getElementById('pwdDiv').style.display = 'none';
	}
function hideadd()
{
	document.getElementById('addDiv').style.display = 'none';
	}
function hidecity()
{
	document.getElementById('cityDiv').style.display = 'none';
	}
function hidestate()
{
	document.getElementById('stateDiv').style.display = 'none';
	}
function hidecountry()
{
	document.getElementById('countryDiv').style.display = 'none';
	}
function createBroker()
{
	var fn=document.getElementById("fName1").value;
	 if(!re.test(fn)) {
		  document.getElementById('fName1Div').style.display = 'block';
		  document.getElementById("fName1Div").innerHTML="FirstName must contain only letters!!";
	      return false;
	    } 
	var ln=document.getElementById("lName1").value;
	 if(!re.test(ln)) {
		  document.getElementById('lName1Div').style.display = 'block';
		  document.getElementById("lName1Div").innerHTML="LastName must contain only letters!!";
	      return false;
	    } 
	var con=document.getElementById("contact1").value;
	 if(!regcon.test(con)) {
		  document.getElementById('contact1Div').style.display = 'block';
		  document.getElementById("contact1Div").innerHTML="contact must contain only numbers!!";
	      return false;
	    } 
	var em=document.getElementById("email1").value;

	var un=document.getElementById("userName1").value;
	 if(!ret.test(un)) {
		  document.getElementById('userName1Div').style.display = 'block';
		  document.getElementById("userName1Div").innerHTML="UserName must contain only letters,alphabets and underscores!!";
	      return false;
	    } 
	var pw=document.getElementById("pwd1").value;
	 if(!regpw.test(pw)) {
		  document.getElementById('pwd1Div').style.display = 'block';
		  document.getElementById("pwd1Div").innerHTML="Password must only contain letter number and underscore( first character must be a letter)!!";
	      return false;
	    }
	var ad=document.getElementById("add1").value;
	 if(!regadd.test(ad)) {
		  document.getElementById('add1Div').style.display = 'block';
		  document.getElementById("add1Div").innerHTML="Invalid Characters in Address!!";
	      return false;
	    }
	var ct=document.getElementById("city1").value;
	 if(!re.test(ct)) {
		  document.getElementById('city1Div').style.display = 'block';
		  document.getElementById("city1Div").innerHTML="City must contain only letters!!";
	      return false;
	    } 
	var st=document.getElementById("state1").value;
	 if(!re.test(st)) {
		  document.getElementById('state1Div').style.display = 'block';
		  document.getElementById("state1Div").innerHTML="State must contain only letters!!";
	      return false;
	    } 
	var co=document.getElementById("country1").value;
	 if(!re.test(co)) {
		  document.getElementById('country1Div').style.display = 'block';
		  document.getElementById("country1Div").innerHTML="Country must contain only letters!!";
	      return false;
	    } 
	
	var add=ad+" "+ct+" "+st+" "+co;
	
	var xmlHttp;
	xmlHttp=new XMLHttpRequest();
	
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
					  
					  var returnedValue=xmlHttp.responseText;
					  if(returnedValue.trim()=="false")
						  {
						   alert("not added");
						  }
					  else if(returnedValue.trim()=="true")
					  	  {
					  	  alert("Broker has been added to the database And an Email has been sent to the broker with all the details");
					  	  setTimeout(populateBroker, 1000); 
					  	  }
					  }
			  };
			  var query= "Firstname=" + fn + "&lastname=" + ln + "&contact=" + con + "&email=" + em+ "&add=" + add+ "&username=" + un+ "&password=" + pw;
			  xmlHttp.open("POST","addBroker.htm",true);
			  xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xmlHttp.send(query);
			
			  return null;
		}
	}



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
		$("#ctm").css("display","none");
		$("#broker").css("display","none");
		$("#investors").css("display","none");
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

$(document).ready(function(){
	$(".butts3").click(function(){
		$("#investors").slideToggle("slow");
		$("#ctm").css("display","none");
		$("#broker").css("display","none");
		$("#admin").css("display","none");
	});
});
function populateBroker()
{
	var table = document.getElementById("tablePop1");
	for(var i = table.rows.length - 1; i > 0; i--)
	{
	    table.deleteRow(i);
	}
	var xmHtp;
	xmHtp=new XMLHttpRequest();
	if (xmHtp == null)
    	{
        alert("Your browser does not support AJAX!");
        return;
    	}
	  else
		{
		  xmHtp.onreadystatechange = function stateChanged()
		  {
			  if(xmHtp.readyState == 4 && xmHtp.status == 200)
				  {
				  	var t;
				    var json=JSON.parse(xmHtp.responseText);
				    var count=json.bList.length;
				    var counter=1;
				    for(var i=0;i<count;i++,counter++)
			    	{
				    	var tablename=document.getElementById("tablePop1");
				    	var y1=document.createElement("TR");
				    	y1.setAttribute("id", "row1"+counter);
				    	tablename.tBodies[0].appendChild(y1);
				    	
				    	var z1=document.createElement("TD");
				    	t=document.createTextNode(json.bList[i].fName);
				    	z1.appendChild(t);
				    	document.getElementById("row1"+counter).appendChild(z1);
				    	
				    	var z2=document.createElement("TD");
				    	t=document.createTextNode(json.bList[i].lName);
				    	z2.appendChild(t);
				    	document.getElementById("row1"+counter).appendChild(z2);
				    	
				    	var z3=document.createElement("TD");
				    	t=document.createTextNode(json.bList[i].date);
				    	z3.appendChild(t);
				    	document.getElementById("row1"+counter).appendChild(z3);
				    	
				     	var z4=document.createElement("TD");
				    	t=document.createTextNode(json.bList[i].eMailID);
				    	z4.appendChild(t);
				    	document.getElementById("row1"+counter).appendChild(z4);
				    	
				    	var z10=document.createElement("TD");
				    	var a = document.createElement("button");
				    	//a.setAttribute("class","linkCreation");
				     	//a.setAttribute("data-toggle","tooltip");
				    	//a.setAttribute("title","Click here to delete");
				    	a.setAttribute("type","button");
				    	a.setAttribute("class","btn btn-default");
				    	a.setAttribute("onclick","deleteIt(this.parentNode.parentNode.id)");
				    	var te=document.createTextNode("Delete the Person");
				    	a.appendChild(te);
				    	z10.appendChild(a);
				    	document.getElementById("row1"+counter).appendChild(z10);
				    	
				    	}
				    
				  }
		  };
		  
		  xmHtp.open("POST","popBro.htm",true);
		  xmHtp.send();
		  return null;
		}
}
function populateTM()
{
	var table = document.getElementById("tablePop");
	for(var i = table.rows.length - 1; i > 0; i--)
	{
	    table.deleteRow(i);
	}
	var xmlHtp;
	xmlHtp=new XMLHttpRequest();
	if (xmlHtp == null)
    	{
        alert("Your browser does not support AJAX!");
        return;
    	}
	  else
		{
		  xmlHtp.onreadystatechange = function stateChanged()
		  {
			  if(xmlHtp.readyState == 4 && xmlHtp.status == 200)
				  {
				  var t;
				    var json=JSON.parse(xmlHtp.responseText);
				    var count=json.tmLists.length;
				    var counter=1;
				    for(var i=0;i<count;i++,counter++)
			    	{
				    	var tablename=document.getElementById("tablePop");
				    	var y1=document.createElement("TR");
				    	y1.setAttribute("id", "row"+counter);
				    	tablename.tBodies[0].appendChild(y1);
				    	
				    	var z1=document.createElement("TD");
				    	t=document.createTextNode(json.tmLists[i].fName);
				    	z1.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z1);
				    	
				    	var z2=document.createElement("TD");
				    	t=document.createTextNode(json.tmLists[i].lName);
				    	z2.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z2);
				    	
				    	var z3=document.createElement("TD");
				    	t=document.createTextNode(json.tmLists[i].date);
				    	z3.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z3);
				    	
				     	var z4=document.createElement("TD");
				    	t=document.createTextNode(json.tmLists[i].eMailID);
				    	z4.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z4);
				    
				    	var z10=document.createElement("TD");
				    	var a = document.createElement("button");
				    	a.setAttribute("type","button");
				    	a.setAttribute("class","btn btn-default");
				    	a.setAttribute("onclick","deleteIt(this.parentNode.parentNode.id)");
				    	var te=document.createTextNode("Delete the Person");
				    	a.appendChild(te);
				    	z10.appendChild(a);
				    	document.getElementById("row"+counter).appendChild(z10);
				    	}
				    
				  }
		  };
		  
		  xmlHtp.open("POST","popTM.htm",true);
		  xmlHtp.send();
		  return null;
		}
	}
	function deleteIt(a)
	{
		alert(a);
		var val=document.getElementById(a).cells[0].innerHTML;
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
						   alert("not deleted");				 
						  }
					  	else if(res.trim()=="true")
						  {
						 alert("Record Deleted");
						 setTimeout(populateBroker, 1000);
						 setTimeout(populateTM, 1000);
						 setTimeout(populateInvestors, 1000);
						  }
					  
					  }
			 	};
			 	 var query= "symbol=" + val;
			 	 xmlHttp.open("POST","deleteFromDatabase.htm",true);
			  	 xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			 	 xmlHttp.send(query);
			  }
		
	}
	function populateInvestors()
	{
		var table = document.getElementById("tablePop2");
		for(var i = table.rows.length - 1; i > 0; i--)
		{
		    table.deleteRow(i);
		}
		var xmlHtp;
		xmtp=new XMLHttpRequest();
		if (xmtp == null)
	    	{
	        alert("Your browser does not support AJAX!");
	        return;
	    	}
		  else
			{
			  xmtp.onreadystatechange = function stateChanged()
			  {
				  if(xmtp.readyState == 4 && xmtp.status == 200)
					  {
					  var t;
					    var json=JSON.parse(xmtp.responseText);
					    var count=json.iList.length;
					    var list=json.iList;
					    var counter=1;
					    for(var i=0;i<count;i++,counter++)
				    	{
					    	var tablename=document.getElementById("tablePop2");
					    	var y1=document.createElement("TR");
					    	y1.setAttribute("id", "row2"+counter);
					    	tablename.tBodies[0].appendChild(y1);
					    	
					    	
					    	var z1=document.createElement("TD");
					    	t=document.createTextNode(json.iList[i].fName);
					    	z1.appendChild(t);
					    	document.getElementById("row2"+counter).appendChild(z1);
					   
					    	
					    	var z2=document.createElement("TD");
					    	t=document.createTextNode(json.iList[i].lName);
					    	z2.appendChild(t);
					    	document.getElementById("row2"+counter).appendChild(z2);
					    	
					    	var z3=document.createElement("TD");
					    	t=document.createTextNode(json.iList[i].date);
					    	z3.appendChild(t);
					    	document.getElementById("row2"+counter).appendChild(z3);
					    	
					     	var z4=document.createElement("TD");
					    	t=document.createTextNode(json.iList[i].eMailID);
					    	z4.appendChild(t);
					    	document.getElementById("row2"+counter).appendChild(z4);
					    	
					    	var z10=document.createElement("TD");
					    	var a = document.createElement("p");
					    	a.setAttribute("type","button");
					    	a.setAttribute("class","btn btn-default");
					    	a.setAttribute("onclick","deleteIt(this.parentNode.parentNode.id)");
					    	var te=document.createTextNode("Delete the Person");
					    	a.appendChild(te);
					    	z10.appendChild(a);
					    	document.getElementById("row2"+counter).appendChild(z10);
					    	}
					    	
					    
					  }
			  };
			  
			  xmtp.open("POST","popInvestors.htm",true);
			  xmtp.send();
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
			 xmlHttp.open("POST","updateDetailsUser.htm",true);
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
				 xmlHttp.open("POST","updatingUser.htm",true);
				 xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				 xmlHttp.send(query);
				 return null; 	 
			 }
		  
		
	}
	
</script>
<body>
	<style>

#oneP {
	margin-left: 300px;
}
.newVertiClass
{
display:block;
}
.panelC {
	padding: 0px;
	font-size: 20px;
	font-weight: bold;
	margin-left: 10px;
}
.linkCreation
		{
		color:white;
		text-decoration: none;
		}
th
{
background-color: #D3D3D3;
}
form{
font-size: 20px;
}
.butts1 {
	background-color: #ff9051;
	height: 100px;
	width: 100%;
	border-style: none;
}
.updateBtn
{
margin-left: 600px;
}
#ctm{
background-color: #ff9051;
display: none;
margin-left: 298px;
width:1310px;
}

.errors
{
font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
color:red;
font-weight: bold;
margin-left:20px;
margin-bottom: 0px;
margin-top: 10px;
}
#investors
{
background-color: #ffe2d1;
display: none;
margin-left: 298px;
width:1310px;
}

#admin
{
background-color: #fff2eb;
display: none;
margin-left: 298px;
width:1310px;
}
#broker
{
background-color: #ffc19e;
display: none;
margin-left: 298px;
width:1310px;
}
.manageB
{
margin-left: 20px;
}
.centering
{
margin-left:650px;
}
.panel{
margin-top:10px;
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

.butts4 {
	background-color: #fff2eb;
	height: 100px;
	width: 100%;
	border-style: none;
}

.welcome {
	color: #FFB732;
	font-size: 20px;
	margin-top: 11px;
}

.heading
{
margin-top: 0px;
margin-bottom: 5px;
margin: auto;
}
.downHead
{
margin-top: 10px;
}
body {
	background-color: #3a4446;
	font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic,
		AppleGothic, sans-serif;
}
</style>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">TradeShares.com |</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="welcome"><b>WELCOME
						${sessionScope.adminObject.fName}
						${sessionScope.adminObject.lName}</b></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/trading/logout.htm"><span
						class="glyphicon glyphicon-log-in"></span> Logout </a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 panelC" id="oneP">
				<button type="button" class="butts1" onClick="populateTM()">
					MANAGE TRADING MEMBERS<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-plus">
					</span>
				</button>
			</div>
			<div class="col-md-2 panelC">
				<button type="button" class="butts2" onClick="populateBroker()">
					MANAGE BROKERS<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-tags">
					</span>
				</button>
			</div>
			<div class="col-md-2 panelC">
				<button type="button" class="butts3" onClick="populateInvestors()">
					MANAGE INVESTORS<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-th-list">
					</span>
				</button>
			</div>
			<div class="col-md-2 panelC">
				<button type="button" class="butts4" onClick="updateDetails()">
					MANAGE PROFILE<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-user">
					</span>
				</button>
			</div>
		</div>
		<div class="row">
		<div id="ctm" class="panel panel-default">
			<div class="panel-body">
				<h1 class="heading text-center">#Fill Trading Member's Details</h1>
				 <form:form class="form-horizontal" commandName="user" method="post">
				 <div class="col-md-6 downHead">
    					<div class="form-group">
      							<label class="control-label col-sm-3" for="first Name">First Name:</label>
      							<font color="red"><form:errors path="fName"/></font>
      							<div class="col-sm-9">
        						<input type="text" class="form-control col-md-4" id="fName" name="fName"  onfocus="hidefName()"  placeholder="Enter FirstName" required>
     							<div id="fNameDiv" class="errors"></div>
     							</div>
    					</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="email">Email:</label>
      							<div class="col-sm-9">          
        						<input type="email" class="form-control" name="email" id="email" onfocus="hideemail()"  placeholder="Enter email" required>
      							<div id="emailDiv" class="errors"></div>
      							</div>
   						</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="contact">contact:</label>
      							<div class="col-sm-9">          
        						<input type="number" class="form-control" name="contact" onfocus="hidecontact()" id="contact" placeholder="Mobile Number" required>
      							<div id="contactDiv" class="errors"></div>
      							</div>
   						</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="add">Street Line:</label>
      							<div class="col-sm-9">          
        						<input type="text" class="form-control" id="add" name="add" onfocus="hideadd()"  placeholder="Street Address" required>
      							<div id="addDiv" class="errors"></div>
      							</div>
   						</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="state">State:</label>
      							<div class="col-sm-9">          
        						<input type="text" class="form-control" id="state" name="state" onfocus="hidestate()" placeholder="State" required>
      							<div id="stateDiv" class="errors"></div>
      							</div>
   						</div>
    					
    			</div>
    			<div class="col-md-6 downHead">
    					<div class="form-group">
      							<label class="control-label col-sm-3" for="Last Name">Last Name:</label>
      							<div class="col-sm-9">
        						<input type="text" class="form-control" name="lName" id="lName" onfocus="hidelName()" placeholder="Enter Lastname" required>
     							<div id="lNameDiv" class="errors"></div>
     							</div>
    					</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="username">Username:</label>
      							<div class="col-sm-9">          
        						<input type="text" class="form-control" id="userName" name="userName" onfocus="hideuserName()"  placeholder="Enter Username" required>
      							<div id="userNameDiv" class="errors"></div>
      							</div>
   						</div>
    					<div class="form-group">
     							<label class="control-label col-sm-3" for="pwd">Password:</label>
      							<div class="col-sm-9">          
        						<input type="password" class="form-control" id="pwd" name="pwd" onfocus="hidepwd()"  placeholder="Enter password" required>
      							<div id="pwdDiv" class="errors"></div>
      							</div>
   						</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="add">City:</label>
      							<div class="col-sm-9">          
        						<input type="text" class="form-control" id="city" name="city" onfocus="hidecity()" placeholder="Enter City" required>
      							<div id="cityDiv" class="errors"></div>
      							</div>
   						</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="add">Country:</label>
      							<div class="col-sm-9">          
        						<input type="text" class="form-control" id="country" name="country" onfocus="hidecountry()" placeholder="Enter Country" required>
      							<div id="countryDiv" class="errors"></div>
      							</div>
   						</div>
    			</div>
    			<div class="form-group">        
     					<div class="row"> 
        						<button type="button" class="btn btn-default centering" onClick="createTM()">Create Trading Member</button>
        						
      					</div>
    			</div>
  			</form:form>
  				<div class="row">
 					<table class="table table-hover table-bordered" id="tablePop">
 		 				<thead>
      						<tr>
        						<th class="text-center">FIRST NAME</th>
        						<th class="text-center">LAST NAME</th>
        						<th class="text-center">DATE CREATED</th>
        						<th class="text-center">EMAIL ID</th>
        						<th class="text-center">DELETE</th>
      						</tr>
      		   			</thead>
      	       			<tbody>
      		   			</tbody>
  		  			</table>     
				</div><!-- row close -->
			</div><!-- closing panel body -->
		</div><!-- panel close -->
		</div><!-- complete row close -->
		
		<div class="row">
		<div id="broker" class="panel panel-default">
			<div class="panel-body">
				<h1 class="text-center heading" >#Fill Broker's Details</h1>
				 <form:form class="form-horizontal" commandName="user" method="post">
				 <div class="col-md-6 downHead">
    					<div class="form-group">
      							<label class="control-label col-sm-3" for="first Name">First Name:</label>
      							<font color="red"><form:errors path="fName"/></font>
      							<div class="col-sm-9">
        						<input type="text" class="form-control col-md-4" id="fName1" name="fName" placeholder="Enter FirstName" onfocus="hidefName1()" required>
     							<div id="fName1Div" class="errors"></div>
     							</div>
    					</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="email">Email:</label>
      							<div class="col-sm-9">          
        						<input type="email" class="form-control" name="email" id="email1" placeholder="Enter email" onfocus="hideemail1()" required>
      							<div id="email1Div" class="errors"></div>
      							</div>
   						</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="contact">contact:</label>
      							<div class="col-sm-9">          
        						<input type="number" class="form-control" name="contact" id="contact1" placeholder="Mobile Number" onfocus="hidecontact1()" required>
      							<div id="contact1Div" class="errors"></div>
      							</div>
   						</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="add">Street Line:</label>
      							<div class="col-sm-9"> 
        						<input type="text" class="form-control" id="add1" name="add" placeholder="Street Address" onfocus="hideadd1()" required>
        						<div id="add1Div" class="errors"></div>
      							</div>
   						</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="state">State:</label>
      							<div class="col-sm-9">          
        						<input type="text" class="form-control" id="state1" name="state" placeholder="State" onfocus="hidestate1()" required>
      							<div id="state1Div" class="errors"></div>
      							</div>
   						</div>
    					
    			</div>
    			<div class="col-md-6 downHead">
    					<div class="form-group">
      							<label class="control-label col-sm-3" for="Last Name">Last Name:</label>
      							<div class="col-sm-9">
        						<input type="text" class="form-control" name="lName" id="lName1" placeholder="Enter Lastname" onfocus="hidelName1()" required>
     							<div id="lName1Div" class="errors"></div>
     							</div>
    					</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="username">Username:</label>
      							<div class="col-sm-9">          
        						<input type="text" class="form-control" id="userName1" name="userName" placeholder="Enter Username"  onfocus="hideuserName1()" required>
      							<div id="userName1Div" class="errors"></div>
      							</div>
   						</div>
    					<div class="form-group">
     							<label class="control-label col-sm-3" for="pwd">Password:</label>
      							<div class="col-sm-9">          
        						<input type="password" class="form-control" id="pwd1" name="pwd" placeholder="Enter password" onfocus="hidepwd1()" required>
      							<div id="pwd1Div" class="errors"></div>
      							</div>
   						</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="add">City:</label>
      							<div class="col-sm-9">          
        						<input type="text" class="form-control" id="city1" name="city" placeholder="Enter City" onfocus="hidecity1()" required>
      							<div id="city1Div" class="errors"></div>
      							</div>
   						</div>
   						<div class="form-group">
     							<label class="control-label col-sm-3" for="add">Country:</label>
      							<div class="col-sm-9">          
        						<input type="text" class="form-control" id="country1" name="country" placeholder="Enter Country" onfocus="hidecountry1()" required>
      							<div id="country1Div" class="errors"></div>
      							</div>
   						</div>
    			</div>
    			<div class="form-group">    
    				<div class="row"> 
        						<button type="button" class="btn btn-default centering" onClick="createBroker()">Create Broker</button>
      				</div>   
    			</div>
  			</form:form>
  			<div class="row">
 					<table class="table table-hover table-bordered" id="tablePop1">
 		 				<thead>
      						<tr>
        						<th class="text-center">FIRST NAME</th>
        						<th class="text-center">LAST NAME</th>
        						<th class="text-center">DATE CREATED</th>
        						<th class="text-center">EMAIL ID</th>
        						<th class="text-center">DELETE</th>
      						</tr>
      		   			</thead>
      	       			<tbody>
      		   			</tbody>
  		  			</table>     
				</div><!-- row close -->
			</div><!-- closing Panel Body -->
		</div>
		</div><!--  row close -->
	
		<div class="row">
		<div id="investors" class="panel panel-default">
			<div class="panel-body">
				<h1 class="heading text-center"># Investors Details</h1>
 					<table class="table table-hover table-bordered" id="tablePop2">
 		 				<thead>
      						<tr>
        						<th class="text-center">FIRST NAME</th>
        						<th class="text-center">LAST NAME</th>
        						<th class="text-center">DATE CREATED</th>
        						<th class="text-center">EMAIL ID</th>
        						<th class="text-center">DELETE</th>
      						</tr>
      		   			</thead>
      	       			<tbody>
      		   			</tbody>
  		  			</table>     
			</div><!-- closing panel body -->
		</div><!-- panel close -->
		</div><!-- complete row close -->
		
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
	</div><!-- container fluid close -->

</body>
</html>