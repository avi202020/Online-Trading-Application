<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
  <style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 20%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
#broker
{
display:none;
}
.close1 {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

#admin
{
display:none;
}
.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    background-color:#666666 ;
    color: white;
}
.butts2 {
	background-color: #ffc19e;
	height: 100px;
	width: 100%;
	border-style: none;
	float:right;
}
.butts1 {
	background-color: #ff9051;
	height: 100px;
	width: 100%;
	border-style: none;
}
.butts3 {
	background-color: #ffe2d1;
	height: 100px;
	width: 100%;
	border-style: none;
}

.centerit
{
margin-left: 700px;

}

.butts4 {
	background-color: #fff2eb;
	height: 100px;
	width: 100%;
	border-style: none;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    color: white;
    background-color:#666666 ;
}
.updateBtn
{
margin-left:500px;
}
.panelC {
	padding: 0px;
	font-size: 20px;
	font-weight: bold;
	margin-left: 0px;
}

  #bodycss{
  font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
  }
 
  .modal-body
  {
   background: linear-gradient(#FFDB99, #BFBFBF);
  }
  
  #investors
  {
  display:none;
  }
		#tabsnNav{
		margin-top:-20px;
		}
		#securities
		{
		margin-left:-22px;
		}
		thead
		{
		background-color:#666666 ;
		font-size:22px;
		color:#FFB732;
		
		}
		.welcome
		{
		color:#FFB732;
		font-size:20px;
		margin-top:11px;
		}
		th{
		font-weight: normal;}
		tbody{
		
		}
		#titleModal
		{
			background-color:#666666 ;
		font-size:28px;
		color:#FFB732;
		}
		img[src="up.png"]
		{
		height:10px;
		width:10px;
		}
		img[src="down.png"]
		{
		height:10px;
		width:10px;
		}
		#navtab{
		font-size: 18px;
	
		font-weight:bold;
	
		}
		.form-group
		{
		margin-top:10px;
		}
		.linkCreation
		{
		color:blue;
		text-decoration: underline;
		}
</style>
<script>

function chkorder(a,counter)
{
	var chk;
    var ss=document.getElementById(a).cells[0].innerHTML;
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
				  		
				    	var z10=document.createElement("TD");
				    	var a = document.createElement("button");
				     	a.setAttribute("data-toggle","tooltip");
				    	a.setAttribute("type","button");
				    	a.setAttribute("class","btn btn-warning");
				    	a.setAttribute("onclick","addIt(this.parentNode.parentNode.id)");
				    	var r=document.createTextNode("add to your watchlist !!");
				    	a.appendChild(r);
				    	z10.appendChild(a);
				    	document.getElementById("row"+counter).appendChild(z10);
					  }
				    
				    else
					  {
				    	var z10=document.createElement("TD");
				    	var a = document.createElement("button");
				     	a.setAttribute("data-toggle","tooltip");
				    	a.setAttribute("type","button");
				    	a.setAttribute("class","btn btn-default");
				    	a.setAttribute("disabled","disabled");
				    	a.setAttribute("onclick","addIt(this.parentNode.parentNode.id)");
				    	var r=document.createTextNode("added to your watchlist");
				    	a.appendChild(r);
				    	z10.appendChild(a);
				    	document.getElementById("row"+counter).appendChild(z10);
				    	
				    	
				    	
					  }
				  	
				  }
		  };
		  var query="secSymbol="+ ss;
		  xhttp.open("POST","chkPersnl.htm",true);
		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xhttp.send(query);
		  
	 }
    
}
var clicks = -1;
function getSecData()
{	clicks +=1;
	var xmlHttp;
	xmlHttp=new XMLHttpRequest();
	var table = document.getElementById("sectable");
	for(var i = table.rows.length - 1; i > 0; i--)
	{
	    table.deleteRow(i);
	}
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
				    var count=json.SecurityList.length;
				    var counter=1;
				    for(var i=0;i<count;i++,counter++)
				    	{
				    	var tablename=document.getElementById("sectable");
				    	var y1=document.createElement("TR");
				    	y1.setAttribute("id", "row"+counter);
				    	tablename.tBodies[0].appendChild(y1);
				    	
				    	var z1=document.createElement("TD");
				    	t=document.createTextNode(json.SecurityList[i].securitiesStatic.secSymbol);
				    	z1.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z1);
				    	
				    	var z2=document.createElement("TD");
				    	t=document.createTextNode(json.SecurityList[i].securitiesStatic.secName);
				    	z2.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z2);
				    	
				    	var z3=document.createElement("TD");
				    	t=document.createTextNode(json.SecurityList[i].securitiesStatic.faceValue);
				    	z3.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z3);
				    	
				    	var z4=document.createElement("TD");
				    	t=document.createTextNode(json.SecurityList[i].securitiesStatic.listingDate);
				    	z4.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z4);
				    	
				    	var z5=document.createElement("TD");
				    	t=document.createTextNode(json.SecurityList[i].high);
				    	z5.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z5);
				    	
				    	var z6=document.createElement("TD");
				    	t=document.createTextNode(json.SecurityList[i].low);
				    	z6.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z6);
				    	
				    	var z7=document.createElement("TD");
				    	t=document.createTextNode(json.SecurityList[i].lastClose);
				    	z7.appendChild(t);
				    	document.getElementById("row"+counter).appendChild(z7);
				    	
				    	var z8=document.createElement("TD");
				    	z8.setAttribute("id", "td"+i);
				    	t=document.createTextNode(json.SecurityList[i].currentPrice);
				    	z8.appendChild(t);				    	
				    	document.getElementById("row"+counter).appendChild(z8);
				    	chkorder(z8.parentNode.id,counter);
				    
				    	
				    	var z9=document.createElement("TD");
				    	var a = document.createElement("button");
				    	a.setAttribute("id",i);
				    	a.setAttribute("type","button");
				    	a.setAttribute("class","btn btn-warning");
				    	a.setAttribute("onclick","buyIt(this.parentNode.parentNode.id)");
				    	var te=document.createTextNode("buy");
				    	a.appendChild(te);
				    	z9.appendChild(a);
				    	document.getElementById("row"+counter).appendChild(z9);
				    	}
				    
				    
				  }
			  
		  };
		  var query="pagecount=" +clicks;
		  xmlHttp.open("POST","addSecData.htm",true);
		  xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xmlHttp.send(query);
		  
		  return null;
	 }
}
function buyIt(a)
{
	alert(a);
	var val=document.getElementById(a).cells[0].innerHTML;
	var val1=document.getElementById(a).cells[1].innerHTML;
	var val7=document.getElementById(a).cells[7].innerHTML;
	var sss=document.getElementById("ss").value=val;	
	var secName=document.getElementById("sn").value=val1;	
	var p=document.getElementById("cp").value=val7;
	var modal = document.getElementById('myModal');
	var btn = document.getElementById(a);
	var span = document.getElementsByClassName("close")[0];
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	span.onclick = function() {
	    modal.style.display = "none";
	}
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	
	 }
	
function addIt(b)
{
	var symbol=document.getElementById(b).cells.item(0).innerHTML;
	var securityName=document.getElementById(b).cells.item(1).innerHTML;
	var highPrice=document.getElementById(b).cells.item(4).innerHTML;
	var lowPrice=document.getElementById(b).cells.item(5).innerHTML;
	var closingPrice=document.getElementById(b).cells.item(6).innerHTML;
	var currentPrice=document.getElementById(b).cells.item(7).innerHTML;
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
					  alert("added to your watchlist");
					  }
				    
				  }
		  };
		  var query= "symbol=" + symbol + "&securityname=" + securityName + "&highprice=" + highPrice + "&lowprice=" + lowPrice + "&closingprice=" + closingPrice + "&currentprice=" + currentPrice;
		  xhttp.open("POST","addToWatch.htm",true);
		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xhttp.send(query);
		  
	 }
	
}

function getMyWatchList()
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
				    var count=json.myDataWatch.length;
				    var counter=1;
				    for(var i=0;i<count;i++,counter++)
			    	{
			    	var tablename=document.getElementById("myWatchTable");
			    	var y1=document.createElement("TR");
			    	y1.setAttribute("id", "rowWatch"+counter);
			    	tablename.tBodies[0].appendChild(y1);
			    	
			    	var z1=document.createElement("TD");
			    	t=document.createTextNode(json.myDataWatch[i].secSymbol);
			    	z1.appendChild(t);
			    	document.getElementById("rowWatch"+counter).appendChild(z1);
			    	
			    	var z2=document.createElement("TD");
			    	t=document.createTextNode(json.myDataWatch[i].secName);
			    	z2.appendChild(t);
			    	document.getElementById("rowWatch"+counter).appendChild(z2);
			    	
			    	var z3=document.createElement("TD");
			    	t=document.createTextNode(json.myDataWatch[i].high);
			    	z3.appendChild(t);
			    	document.getElementById("rowWatch"+counter).appendChild(z3);
			    	
			    	var z4=document.createElement("TD");
			    	t=document.createTextNode(json.myDataWatch[i].low);
			    	z4.appendChild(t);
			    	document.getElementById("rowWatch"+counter).appendChild(z4);
			    	
			    	var z5=document.createElement("TD");
			    	t=document.createTextNode(json.myDataWatch[i].lastClose);
			    	z5.appendChild(t);
			    	document.getElementById("rowWatch"+counter).appendChild(z5);
			    	
			    	var z6=document.createElement("TD");
			    	t=document.createTextNode(json.myDataWatch[i].currentPrice);
			    	z6.appendChild(t);
			    	document.getElementById("rowWatch"+counter).appendChild(z6);

			    	
			    	
			    	var z9=document.createElement("TD");
			    	var a = document.createElement("button");
			    	//a.setAttribute("class","linkCreation");
			    	a.setAttribute("id",i+"2buy");
			    	a.setAttribute("type","button");
			    	a.setAttribute("class","btn btn-warning");
			    	a.setAttribute("onclick","buyIt1(this.parentNode.parentNode.id)");
			    	var te=document.createTextNode("buy");
			    	a.appendChild(te);
			    	z9.appendChild(a);
			    	document.getElementById("rowWatch"+counter).appendChild(z9);
			    	
			    	
			    	var z10=document.createElement("TD");
			    	var a = document.createElement("button");
			     	a.setAttribute("type","button");
			    	a.setAttribute("class","btn btn-warning");
			    	a.setAttribute("onclick","deleteIt(this.parentNode.parentNode.id)");
			    	var te=document.createTextNode("Delete From Watchlist");
			    	a.appendChild(te);
			    	z10.appendChild(a);
			    	document.getElementById("rowWatch"+counter).appendChild(z10);
			    	}
				  }
			  
		  }	
		 xhtp.open("POST","populateMyList.htm",true);
		 xhtp.send();
		  return null;
	 }
	
}

function deleteIt(a)
{
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
					  }
				  
				  }
		 	};
		 	 var query= "symbol=" + val;
		 	 xmlHttp.open("POST","deleteFromPW.htm",true);
		  	 xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		 	 xmlHttp.send(query);
		 	 
		  }
	
	}

function buyIt1(a)
{
	var val=document.getElementById(a).cells[0].innerHTML;
	var val1=document.getElementById(a).cells[1].innerHTML;
	var val7=document.getElementById(a).cells[5].innerHTML;
	var sss=document.getElementById("ss1").value=val;	
	var secName=document.getElementById("sn1").value=val1;	
	var p=document.getElementById("cp1").value=val7;
	var modal = document.getElementById('myModal1');
	var btn = document.getElementById(a);
	var span = document.getElementsByClassName("close")[0];
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	span.onclick = function() {
	    modal.style.display = "none";
	}
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	
	 }
	 
function sellIt(a)
{
	var val=document.getElementById(a).cells[3].innerHTML;
	var val1=document.getElementById(a).cells[4].innerHTML;
	var val2=document.getElementById(a).cells[2].innerHTML;
	var sss=document.getElementById("ss2").value=val;	
	var secName=document.getElementById("sn2").value=val1;	
	var noOfLots=document.getElementById("cp2").value=val2;	
	var modal = document.getElementById('myModal12');
	var btn = document.getElementById(a);
	var span = document.getElementsByClassName("close")[0];
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	span.onclick = function() {
	    modal.style.display = "none";
	}
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	
	 }
	 
	 
	 
function myFunc()
{
	window.location.reload(true); 
	}
	
	
	$(document).ready(function(){
		 $('[data-toggle="tooltip"]').tooltip();  
	});
function closeThis()
{
	var modal = document.getElementById('myModal');
	 modal.style.display = "none";
	}

function closeThis1()
{
	var modal = document.getElementById('myModal1');
	 modal.style.display = "none";
	}
	
function buyingit()
{
	var quant=document.getElementById("quantity").value;
	var bid=document.getElementById("bidPrice").value;
	var dateV=document.getElementById("validDate").value;	
	if(quant == "" || bid =="" || dateV == "")
		{
		alert("please enter all the values");
		return;
		}
	else
		{
		//modal.style.display = "none";
		
	var xmlHttp;
	var symbol=document.getElementById("ss").value;
	   var securityName=document.getElementById("sn").value;
	   var currentPrice=document.getElementById("cp").value;
	   var quantity=document.getElementById("quantity").value;
	   alert(document.getElementById("quantity"));
	   var bidPrice=document.getElementById("bidPrice").value;
	   var validityDate=document.getElementById("validDate").value;
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
				   
				  	var res= xmlHttp.responseText;
				    if(res.trim()=="false")
					  {
					   alert("not added");				 
					  }
				  	else
					  {
					  alert("Order added");
					  var modal=document.getElementById("myModal");
					  modal.style.display = "none";
					  }
				  
				  }
		 	};
		 	 var query= "symbol=" + symbol + "&securityName=" + securityName + "&currentPrice=" + currentPrice+ "&quantity=" + quantity + "&bidPrice=" + bidPrice+ "&validityDate=" + validityDate;
		 	 xmlHttp.open("POST","addToOrder.htm",true);
		  	 xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		 	 xmlHttp.send(query);
		 	 alert(query);
		 	 alert(quantity);
		 	 
		  }
		}
	
	
	
}	



function sellingit()
{   
	var bid=document.getElementById("bidPrice2").value;
	var dateV=document.getElementById("validDate2").value;	
	if(bid =="" || dateV == "")
		{
		alert("please enter all the values");
		return;
		}
	else
		{
		//modal.style.display = "none";
		
	var xmlHttp;
	   var symbol=document.getElementById("ss2").value;
	   var securityName=document.getElementById("sn2").value;
	   var noOfLots=document.getElementById("cp2").value;
	   var bidPrice=document.getElementById("bidPrice2").value;
	   var validityDate=document.getElementById("validDate2").value;
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
				  	var res= xmlHttp.responseText;
				    if(res.trim()=="false")
					  {
					   alert("not added");				 
					  }
				  	else if(res.trim()=="true")
					  {
					  alert("Order added");
					  var modal=document.getElementById("myModal12");
					  modal.style.display = "none";
					  }
				  
				  }
		 	};
		 	 var query= "symbol=" + symbol + "&securityName=" + securityName + "&noOfShares=" + noOfLots + "&bidPrice=" + bidPrice+ "&validityDate=" + validityDate;
		 	 xmlHttp.open("POST","addToOrderSell.htm",true);
		  	 xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		 	 xmlHttp.send(query);

		 	 
		  }
		}	
}


function buyingit1()
{
	var quant=document.getElementById("quantity1").value;
	var bid=document.getElementById("bidPrice1").value;
	var dateV=document.getElementById("validDate1").value;	
	if(quant == "" || bid =="" || dateV == "")
		{
		alert("please enter all the values");
		return;
		}
	else
		{
		//modal.style.display = "none";
		
	var xmlHttp;
	var symbol=document.getElementById("ss1").value;
	   var securityName=document.getElementById("sn1").value;
	   var currentPrice=document.getElementById("cp1").value;
	   var quantity=document.getElementById("quantity1").value;
	   var bidPrice=document.getElementById("bidPrice1").value;
	   var validityDate=document.getElementById("validDate1").value;
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
				   
				  	var res= xmlHttp.responseText;
				    if(res.trim()=="false")
					  {
					   alert("not added");				 
					  }
				  	else if(res.trim()=="true")
					  {
					  alert("Order added");
					  var modal=document.getElementById("myModal1");
					  modal.style.display = "none";
					  }
				  	else if(res.trim()=="Notsufficient")
				  	  {
				  		alert("Order can't be placed as you dont have sufficient Amount in your account");
				  	  }
				  
				  }
		 	};
		 	 var query= "symbol=" + symbol + "&securityName=" + securityName + "&currentPrice=" + currentPrice+ "&quantity=" + quantity + "&bidPrice=" + bidPrice+ "&validityDate=" + validityDate;
		 	 xmlHttp.open("POST","addToOrder.htm",true);
		  	 xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		 	 xmlHttp.send(query);

		 	 
		  }
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

$(document).ready(function(){
	$(".butts4").click(function(){
		$("#admin").slideToggle("slow");
		$("#ctm").css("display","none");
		$("#broker").css("display","none");
		$("#investors").css("display","none");
	});
});


function populateMyOrders()
{

	 
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
					    var count=json.myOrders.length;
					    var counter=1;
					    for(var i=0;i<count;i++,counter++)
				    	{
				    	var tablename=document.getElementById("myWatchTable1");
				    	var y1=document.createElement("TR");
				    	y1.setAttribute("id", "rowWatchit"+counter);
				    	tablename.tBodies[0].appendChild(y1);
				    	
				    	var z1=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].secSymbol);
				    	z1.appendChild(t);
				    	document.getElementById("rowWatchit"+counter).appendChild(z1);
				    	
				    	var z2=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].secName);
				    	z2.appendChild(t);
				    	document.getElementById("rowWatchit"+counter).appendChild(z2);
				    	
				    	var z9=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].bidPrice);
				    	z9.appendChild(t);
				    	document.getElementById("rowWatchit"+counter).appendChild(z9);
				    	
				    	var z3=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].currPrice);
				    	z3.appendChild(t);
				    	document.getElementById("rowWatchit"+counter).appendChild(z3);
				    	
				    	var z4=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].orderType);
				    	z4.appendChild(t);
				    	document.getElementById("rowWatchit"+counter).appendChild(z4);
				    	
				    	var z5=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].quantity);
				    	z5.appendChild(t);
				    	document.getElementById("rowWatchit"+counter).appendChild(z5);
				    	
				    	var z6=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].totalAmount);
				    	z6.appendChild(t);
				    	document.getElementById("rowWatchit"+counter).appendChild(z6);

				    	var z7=document.createElement("TD");
				    	t=document.createTextNode(json.myOrders[i].validityDate);
				    	z7.appendChild(t);
				    	document.getElementById("rowWatchit"+counter).appendChild(z7);
				    	}
					  }
				  
			  };	
				 xhtp.open("POST","populateMyOrders.htm",true);
				 xhtp.send();
				  return null;
		 }
	 
	
	}

function populateBuyOrders()
{
	
	var table = document.getElementById("myWatchTable2");
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
				    var count=json.mybuyOrders.length;
				    var counter=1;
				    for(var i=0;i<count;i++,counter++)
			    	{
			    	var tablename=document.getElementById("myWatchTable2");
			    	var y1=document.createElement("TR");
			    	y1.setAttribute("id", "rowWatchit2"+counter);
			    	tablename.tBodies[0].appendChild(y1);
			    	
			    	var z1=document.createElement("TD");
			    	t=document.createTextNode(json.mybuyOrders[i].secSymbol);
			    	z1.appendChild(t);
			    	document.getElementById("rowWatchit2"+counter).appendChild(z1);
			    	
			    	var z2=document.createElement("TD");
			    	t=document.createTextNode(json.mybuyOrders[i].secName);
			    	z2.appendChild(t);
			    	document.getElementById("rowWatchit2"+counter).appendChild(z2);
			    	
			    	var z9=document.createElement("TD");
			    	t=document.createTextNode(json.mybuyOrders[i].bidPrice);
			    	z9.appendChild(t);
			    	document.getElementById("rowWatchit2"+counter).appendChild(z9);
			    	
			    	var z3=document.createElement("TD");
			    	t=document.createTextNode(json.mybuyOrders[i].currPrice);
			    	z3.appendChild(t);
			    	document.getElementById("rowWatchit2"+counter).appendChild(z3);
			    	
			    	var z4=document.createElement("TD");
			    	t=document.createTextNode(json.mybuyOrders[i].orderType);
			    	z4.appendChild(t);
			    	document.getElementById("rowWatchit2"+counter).appendChild(z4);
			    	
			    	var z5=document.createElement("TD");
			    	t=document.createTextNode(json.mybuyOrders[i].quantity);
			    	z5.appendChild(t);
			    	document.getElementById("rowWatchit2"+counter).appendChild(z5);
			    	
			    	var z6=document.createElement("TD");
			    	t=document.createTextNode(json.mybuyOrders[i].totalAmount);
			    	z6.appendChild(t);
			    	document.getElementById("rowWatchit2"+counter).appendChild(z6);

			    	var z7=document.createElement("TD");
			    	t=document.createTextNode(json.mybuyOrders[i].validityDate);
			    	z7.appendChild(t);
			    	document.getElementById("rowWatchit2"+counter).appendChild(z7);
			    	}
				  }
			  
		  };	
		 xhtp.open("POST","populateBuyOrders.htm",true);
		 xhtp.send();
		  return null;
	 }
	
	}
	

function populateSellOrders()
{
	var table = document.getElementById("myWatchTable3");
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
				    var count=json.mysellOrders.length;
				    var counter=1;
				    for(var i=0;i<count;i++,counter++)
			    	{
			    	var tablename=document.getElementById("myWatchTable3");
			    	var y1=document.createElement("TR");
			    	y1.setAttribute("id", "rowWatchit33"+counter);
			    	tablename.tBodies[0].appendChild(y1);
			    	
			    	var z1=document.createElement("TD");
			    	t=document.createTextNode(json.mysellOrders[i].secSymbol);
			    	z1.appendChild(t);
			    	document.getElementById("rowWatchit33"+counter).appendChild(z1);
			    	
			    	var z2=document.createElement("TD");
			    	t=document.createTextNode(json.mysellOrders[i].secName);
			    	z2.appendChild(t);
			    	document.getElementById("rowWatchit33"+counter).appendChild(z2);
			    	
			    	var z9=document.createElement("TD");
			    	t=document.createTextNode(json.mysellOrders[i].bidPrice);
			    	z9.appendChild(t);
			    	document.getElementById("rowWatchit33"+counter).appendChild(z9);
			    	
			    	var z3=document.createElement("TD");
			    	t=document.createTextNode(json.mysellOrders[i].currPrice);
			    	z3.appendChild(t);
			    	document.getElementById("rowWatchit33"+counter).appendChild(z3);
			    	
			    	var z4=document.createElement("TD");
			    	t=document.createTextNode(json.mysellOrders[i].orderType);
			    	z4.appendChild(t);
			    	document.getElementById("rowWatchit33"+counter).appendChild(z4);
			    	
			    	var z5=document.createElement("TD");
			    	t=document.createTextNode(json.mysellOrders[i].quantity);
			    	z5.appendChild(t);
			    	document.getElementById("rowWatchit33"+counter).appendChild(z5);
			    	
			    	var z6=document.createElement("TD");
			    	t=document.createTextNode(json.mysellOrders[i].totalAmount);
			    	z6.appendChild(t);
			    	document.getElementById("rowWatchit33"+counter).appendChild(z6);

			    	var z7=document.createElement("TD");
			    	t=document.createTextNode(json.mysellOrders[i].validityDate);
			    	z7.appendChild(t);
			    	document.getElementById("rowWatchit33"+counter).appendChild(z7);
			    	}
				  }
			  
		  };	
		 xhtp.open("POST","populateSellOrders.htm",true);
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
				  document.getElementById("fName").value=json.details.fName;
				  document.getElementById("lName").value=json.details.lName;
				  document.getElementById("eMailID").value=json.details.email;
				  document.getElementById("userName").value=json.details.username;
				  document.getElementById("password").value=json.details.pass;
				  document.getElementById("contact").value=json.details.contact;
				  document.getElementById("panCardNum").value=json.details.pan;
				  document.getElementById("accountNum").value=json.details.account;
				  document.getElementById("address").value=json.details.address;
				  
				  }
		  }
		 xmlHttp.open("POST","updateDetails.htm",true);
		 xmlHttp.send();
		 return null; 	 
	 }
	
}

function updating()
{
	  var emid=document.getElementById("eMailID").value;
	  var pass=document.getElementById("password").value;
	  var contact=document.getElementById("contact").value;
	  var ssn=document.getElementById("panCardNum").value;
	  var actno=document.getElementById("accountNum").value;
	  var add=document.getElementById("address").value;
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
			 var query="eMailID="+ emid +"&password="+ pass +"&contact="+ contact +"&panCardNum="+ ssn +"&accountNum="+ actno +"&address="+ add;
			 xmlHttp.open("POST","updating.htm",true);
			 xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			 xmlHttp.send(query);
			 return null; 	 
		 }
	  
	
	}
	
	function getSettledTrdes()
	{

		var table = document.getElementById("mysettledtable");
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
					    var count=json.settledList.length;
					    var counter=1;
					    for(var i=0;i<count;i++,counter++)
				    	{
				    	var tablename=document.getElementById("mysettledtable");
				    	var y1=document.createElement("TR");
				    	y1.setAttribute("id", "rowWatchit33"+counter);
				    	tablename.tBodies[0].appendChild(y1);
				    	
				    	var z1=document.createElement("TD");
				    	t=document.createTextNode(json.settledList[i].clientName);
				    	z1.appendChild(t);
				    	document.getElementById("rowWatchit33"+counter).appendChild(z1);
				    	
				    	var z2=document.createElement("TD");
				    	t=document.createTextNode(json.settledList[i].brokerName);
				    	z2.appendChild(t);
				    	document.getElementById("rowWatchit33"+counter).appendChild(z2);
				    	
				    	var z9=document.createElement("TD");
				    	t=document.createTextNode(json.settledList[i].noOfShares);
				    	z9.appendChild(t);
				    	document.getElementById("rowWatchit33"+counter).appendChild(z9);
				    	
				    	
				    	var z33=document.createElement("TD");
				    	t=document.createTextNode(json.settledList[i].secSymbol);
				    	z33.appendChild(t);
				    	document.getElementById("rowWatchit33"+counter).appendChild(z33);
				    	
				    	var z3=document.createElement("TD");
				    	t=document.createTextNode(json.settledList[i].secName);
				    	z3.appendChild(t);
				    	document.getElementById("rowWatchit33"+counter).appendChild(z3);
				    	
				    	var z4=document.createElement("TD");
				    	t=document.createTextNode(json.settledList[i].orderType);
				    	z4.appendChild(t);
				    	document.getElementById("rowWatchit33"+counter).appendChild(z4);
				    	
				    	var z5=document.createElement("TD");
				    	t=document.createTextNode(json.settledList[i].counter);
				    	z5.appendChild(t);
				    	document.getElementById("rowWatchit33"+counter).appendChild(z5);
				    	
				    	var z6=document.createElement("TD");
				    	t=document.createTextNode(json.settledList[i].amntSettled);
				    	z6.appendChild(t);
				    	document.getElementById("rowWatchit33"+counter).appendChild(z6);

				    	var z7=document.createElement("TD");
				    	t=document.createTextNode(json.settledList[i].tradeTime);
				    	z7.appendChild(t);
				    	document.getElementById("rowWatchit33"+counter).appendChild(z7);
				    	
				    	
				    	var z13=document.createElement("TD");
				    	var a = document.createElement("button");
				    	a.setAttribute("id",i+"2buy");
				    	a.setAttribute("type","button");
				    	a.setAttribute("class","btn btn-warning");
				    	a.setAttribute("onclick","sellIt(this.parentNode.parentNode.id)");
				    	var te=document.createTextNode("sell");
				    	a.appendChild(te);
				    	z13.appendChild(a);
				    	document.getElementById("rowWatchit33"+counter).appendChild(z13);
				    	}
					  }
			  }
			 xmlHttp.open("POST","getSettledTrades.htm",true);
			 xmlHttp.send();
			 return null; 	 
		 }
	  
		
	}
setInterval(getMyWatchList, 10000);
</script>
</head>
<body id="bodycss">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">TradeShares.com |</a>
    </div>
    <ul class="nav navbar-nav">
     <li class="welcome"><b>WELCOME ${sessionScope.InvestorObject.fName} ${sessionScope.InvestorObject.lName} associated with BROKER : ${sessionScope.InvestorObject.broker}</b></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li class="welcome"><b>AMOUNT IN YOUR ACCOUNT : ${sessionScope.InvestorObject.amountInAccount}</b></li>
      <li><a href="/trading/logout.htm"><span class="glyphicon glyphicon-log-in"></span> Logout </a></li>
    </ul>
  </div>
</nav>
<!--<h1>Welcome ${sessionScope.InvestorObject.fName}</h1>-->
<div class="container-fluid">
<div id="tabsnNav">
  <ul class="nav nav-tabs nav-justified" id="navtab">
    <li class="active"><a data-toggle="tab" href="#menu4" >MARKET ANALYSIS</a></li>
    <li><a data-toggle="tab" href="#home" onClick="getSecData()">WATCHLIST</a></li>
    <li><a data-toggle="tab" href="#menu1" onClick="getMyWatchList()">PERSONAL WATCHLIST</a></li>
    <li><a data-toggle="tab" href="#menu2" onClick="populateMyOrders()">ORDERS</a></li>
    <li><a data-toggle="tab" href="#menu3" onClick="updateDetails()">SETTINGS</a></li>

  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade">
    <div class="row">
    <div class="col-md-2">
      <div id="stocktwits-widget-news"></div><a href='http://stocktwits.com' style='font-size: 0px;'>StockTwits</a>
<script type="text/javascript" src="http://stocktwits.com/addon/widget/2/widget-loader.min.js"></script>
<script type="text/javascript">
STWT.Widget({container: 'stocktwits-widget-news', symbol: 'ENY', width: '300', height: '850', limit: '20', scrollbars: 'true', streaming: 'true', title: 'Latest News', style: {link_color: '4871a8', link_hover_color: '4871a8', header_text_color: '000000', border_color: 'cecece', divider_color: 'cecece', divider_color: 'cecece', divider_type: 'solid', box_color: 'f5f5f5', stream_color: 'ffffff', text_color: '000000', time_color: '999999'}});
</script>
</div>
<div class="col-md-10">
  <h2 class="text-center"># Complete Watchlist</h2>
      <div id="securities">
 		<table class="table table-hover table-bordered" id="sectable">
 		 <thead>
      		<tr>
        		<th>SECURITY SYMBOL</th>
        		<th>SECURITY NAME</th>
        		<th>FACE VALUE</th>
        		<th>LISTING DATE</th>
        		<th>HIGH PRICE</th>
        		<th>LOW PRICE</th>
        		<th>CLOSING PRICE</th>
        		<th>CURRENT PRICE</th>
        		<th>ACTION</th>
        		<th>PERSONAL WATCHLIST</th>
        		
      		</tr>
      		
      		
      	</thead>
      	<tbody>
      	</tbody>
  		</table>     
      </div>
   
      <button type="button" class="btn btn-default centerit" id="pageCountInc" onClick="getSecData()">Show More</button>
         </div><!-- col closed -->
      </div><!-- row close -->


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header"  id="titleModal">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 class="modal-title text-center"><b># PLACE AN ORDER</b></h3>
    </div>
    <div class="modal-body">
            <form:form action="addOrder.htm" commandName="addOrder" method="post">
            	 <div class="form-group">
                 <label for="ss">Security Symbol: </label>
                 <input type="text" class="form-control" name="ss" id="ss" disabled/>
                 <font color="red"><form:errors path="ss"/></font>
                 </div>
                 <div class="form-group">
                 <label for="sn">Security Name: </label>
                 <input type="text" class="form-control" name="sn" id="sn" disabled/>
                 <font color="red"><form:errors path="sn"/></font>
                 </div>
                 <div class="form-group">
                 <label for="sn">Current Price: </label>
                 <input type="text" class="form-control" name="cp" id="cp" disabled/>
                 <font color="red"><form:errors path="cp"/></font>
                 </div>
                 <div class="form-group">
                 <label for="inputQuantity">Enter Quantity:(1 lot = 10 shares) </label>
                 <input type="number" class="form-control" placeholder="quantity in lots" name="quantity" id="quantity" required/>
                 <font color="red"><form:errors path="quantity"/></font>
                 </div>
                 <div class="form-group">
                 <label for="BidPrice">Enter Bid Price: </label>
                 <input type="number" class="form-control" placeholder="Example: $000.00" name="bidPrice" id="bidPrice" required/>
                 <font color="red"><form:errors path="bidPrice"/></font>
                 </div>
                 <div class="form-group">
                 <label for="SelectDate">Validity of Order Date: </label>
                 <input type="date" class="form-control" placeholder="validity of order" name="validDate" id="validDate" required/>
                 <font color="red"><form:errors path="validDate"/></font>
                 </div>
                
                </form:form>
          </div>

           <div class="modal-footer">
        <input type="submit" onclick="buyingit()" class="btn btn-default" value="Submit Order" class=" smallbutn col-md-2 logs" />
        <button type="button" class="btn btn-default col-md-offset-6 col-md-4" onClick="closeThis()">Close</button>
      </div>
  </div>

</div>
      
    </div>
    <div id="menu1" class="tab-pane fade">
    <div class="container">
      <div class="row">
       <h2 class="text-center"># My WatchList</h2>
      <div id="myWatch">
 		<table class="table table-hover table-bordered" id="myWatchTable">
 	
 		 <thead>
      		<tr>
        		<th>SECURITY SYMBOL</th>
        		<th>SECURITY NAME</th>
        		<th>HIGH PRICE</th>
        		<th>LOW PRICE</th>
        		<th>CLOSING PRICE</th>
        		<th>CURRENT PRICE</th>
        		<th>BUY ACTION</th>
        		<th>DELETE ACTION</th>
      		</tr>
      	</thead>
      	<tbody>
      	</tbody>
  		</table>     
      </div>
      </div><!-- row closed -->
      <div id="myModal1" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header"  id="titleModal1">
        <h3 class="modal-title text-center"><b># PLACE AN ORDER</b></h3>
    </div>
    <div class="modal-body">
            <form:form action="addOrder.htm" commandName="addOrder" method="post">
            	 <div class="form-group">
                 <label for="ss">Security Symbol: </label>
                 <input type="text" class="form-control" name="ss" id="ss1" disabled/>
                 <font color="red"><form:errors path="ss"/></font>
                 </div>
                 <div class="form-group">
                 <label for="sn">Security Name: </label>
                 <input type="text" class="form-control" name="sn" id="sn1" disabled/>
                 <font color="red"><form:errors path="sn"/></font>
                 </div>
                 <div class="form-group">
                 <label for="sn">Current Price: </label>
                 <input type="text" class="form-control" name="cp" id="cp1" disabled/>
                 <font color="red"><form:errors path="cp"/></font>
                 </div>
                 <div class="form-group">
                 <label for="inputQuantity">Enter Quantity:(1 lot = 10 shares) </label>
                 <input type="number" class="form-control" placeholder="quantity in lots" name="quantity" id="quantity1" required/>
                 <font color="red"><form:errors path="quantity"/></font>
                 </div>
                 <div class="form-group">
                 <label for="BidPrice">Enter Bid Price: </label>
                 <input type="number" class="form-control" placeholder="Example: $000.00" name="bidPrice" id="bidPrice1" required/>
                 <font color="red"><form:errors path="bidPrice"/></font>
                 </div>
                 <div class="form-group">
                 <label for="SelectDate">Validity of Order Date: </label>
                 <input type="date" class="form-control" placeholder="validity of order" name="validDate" id="validDate1" required/>
                 <font color="red"><form:errors path="validDate"/></font>
                 </div>
                
                </form:form>
          </div>

           <div class="modal-footer">
        <input type="submit" onclick="buyingit1()" class="btn btn-default" value="Submit Order" class=" smallbutn col-md-2 logs" />
        <button type="button" class="btn btn-default col-md-offset-6 col-md-4" onClick="closeThis1()">Close</button>
      </div>
  </div>

</div>
      </div><!-- container closed -->
    </div>
    <div id="menu2" class="tab-pane fade">
      <div class="container-fluid">
      		<div class="row">
			<div class="col-md-3 panelC" id="oneP">
				<button type="button" class="butts1" onClick="populateMyOrders()">
					VIEW ALL ORDERS<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-plus">
					</span>
				</button>
			</div>
			<div class="col-md-3 panelC">
				<button type="button" class="butts2" onClick="populateBuyOrders()">
					VIEW BUY ORDERS<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-tags">
					</span>
				</button>
			</div>
			<div class="col-md-3 panelC">
				<button type="button" class="butts3" onClick="populateSellOrders()">
					VIEW SELL ORDERS<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-th-list">
					</span>
				</button>
			</div>
			<div class="col-md-3 panelC">
				<button type="button" class="butts4" onClick="getSettledTrdes()">
					SHARES IN ACCOUNT<br />
					<span style="font-size: 2em;" class="glyphicon glyphicon-th-list">
					</span>
				</button>
			</div>
		</div>
    </div><!--  container closed -->
    <div class="container">
      <div class="row">
		<div id="ctm" class="panel panel-default">
			<div class="panel-body">
				<h1 class="heading text-center">#My Orders</h1>
  			   <div class="row">
      <div id="myWatch1">
 		<table class="table table-hover table-bordered" id="myWatchTable1">
 	
 		 <thead>
      		<tr>
        		<th>SECURITY SYMBOL</th>
        		<th>SECURITY NAME</th>
        		<th>BID PRICE</th>
        		<th>CURRENT PRICE</th>
        		<th>ORDER TYPE</th>
        		<th>QUANTITY IN LOTS</th>
        		<th>TOTAL AMOUNT</th>
        		<th>VALIDITY DATE</th>
      		</tr>
      	</thead>
      	<tbody>
      	</tbody>
  		</table>     
      </div>
      </div><!-- row closed -->
			</div><!-- closing panel body -->
		</div><!-- panel close -->
		</div><!-- complete row close -->
		</div>
		<div class="container">
		<div class="row">
			<div id="broker" class="panel panel-default" >
				<div class="panel-body">
				<h1 class="heading text-center">#My Buy Orders</h1>
  			   		<div class="row">
      					<div id="myWatch1">
 						<table class="table table-hover table-bordered" id="myWatchTable2">
 							 <thead>
      							<tr>
        							<th>SECURITY SYMBOL</th>
        							<th>SECURITY NAME</th>
        							<th>BID PRICE</th>
        							<th>CURRENT PRICE</th>
        							<th>ORDER TYPE</th>
        							<th>QUANTITY IN LOTS</th>
        							<th>TOTAL AMOUNT</th>
        							<th>VALIDITY DATE</th>
      							</tr>
      						</thead>
      						<tbody>
      						</tbody>
  						</table>     
      					</div>
     		 		</div><!-- row closed -->
				</div><!-- closing panel body -->
			</div><!-- panel close -->
		</div><!-- complete row close -->
		</div>
		
		<div class="container">
		<div class="row">
			<div id="admin" class="panel panel-default" >
				<div class="panel-body">
				<h1 class="heading text-center">#My shares</h1>
  			   		<div class="row">
      					<div id="myWatch1">
 						<table class="table table-hover table-bordered" id="mysettledtable">
 							 <thead>
      							<tr>
        							<th>CLIENT NAME</th>
        							<th>Broker</th>
        							<th>No of Shares in Lots</th>
        							<th>Security Symbol</th>
        							<th>Security Name</th>
        							<th>ORDER TYPE</th>
        							<th>Counterparty</th>
        							<th>Amount Settled</th>
        							<th>Trade time</th>
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
		</div><!-- complete row close -->

<div id="myModal12" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header"  id="titleModa">
        <h3 class="modal-title text-center"><b># PLACE AN ORDER</b></h3>
    </div>
    <div class="modal-body">
            <form:form action="addOrder.htm" commandName="addOrder" method="post">
            	 <div class="form-group">
                 <label for="ss">Security Symbol: </label>
                 <input type="text" class="form-control" name="ss2" id="ss2" disabled/>
                 </div>
                 <div class="form-group">
                 <label for="sn">Security Name: </label>
                 <input type="text" class="form-control" name="sn2" id="sn2" disabled/>
                 </div>
                 <div class="form-group">
                 <label for="sn">Total Shares: </label>
                 <input type="text" class="form-control" name="cp" id="cp2" disabled/>
                 </div>
                 <div class="form-group">
                 <label for="BidPrice">Enter Bid Price: </label>
                 <input type="number" class="form-control" placeholder="Example: $000.00" name="bidPrice2" id="bidPrice2" required/>
                 </div>
                 <div class="form-group">
                 <label for="SelectDate">Validity of Order Date: </label>
                 <input type="date" class="form-control" placeholder="validity of order" name="validDate" id="validDate2" required/>
                 </div>
                
                </form:form>
          </div>

        <div class="modal-footer">
        <input type="submit" onclick="sellingit()" class="btn btn-default" value="Submit Order" class=" smallbutn col-md-2 logs" />
        <button type="button" class="btn btn-default col-md-offset-6 col-md-4" onClick="closeThis1()">Close</button>
      </div>
  </div>

</div>
		</div>
		
		
		<div class="container">
		<div class="row">
			<div id="investors" class="panel panel-default" >
				<div class="panel-body">
				<h1 class="heading text-center">#My Sell Orders</h1>
  			   		<div class="row">
      					<div id="myWatch1">
 						<table class="table table-hover table-bordered" id="myWatchTable3">
 							 <thead>
      							<tr>
        							<th>SECURITY SYMBOL</th>
        							<th>SECURITY NAME</th>
        							<th>BID PRICE</th>
        							<th>CURRENT PRICE</th>
        							<th>ORDER TYPE</th>
        							<th>QUANTITY IN LOTS</th>
        							<th>TOTAL AMOUNT</th>
        							<th>VALIDITY DATE</th>
      							</tr>
      						</thead>
      						<tbody>
      						</tbody>
  						</table>     
      					</div>
     		 		</div><!-- row closed -->
				</div><!-- closing panel body -->
			</div><!-- panel close -->
		</div><!-- complete row close -->
		</div>
		
      
    </div>
    <div id="menu3" class="tab-pane fade">
      <div class="container">
      <div class="text-center"><h1># Update Profile</h1></div>
      <label>First Name:</label><input type="text" class="form-control emailId" placeholder="First Name" name="fName" id="fName" disabled="disabled"/><br />
	  <label>Last Name:</label><input type="text" class="form-control emailId" placeholder="Last Name" name="lName" id="lName" disabled="disabled"/> <br />
	  <label>Email ID:</label><input type="email" class="form-control emailId" placeholder="Email ID" name="eMailID" id="eMailID" required/><br />
	  <label>UserName:</label><input type="text" class="form-control emailId" placeholder="Username" name="userName" id="userName" disabled="disabled"/> <br />
	  <label>Password:</label><input type="password" placeholder="password" class="pw form-control" name="password" id="password" required/><br />
      <label>Contact Number:</label><input type="text" placeholder="Contact Number" class="form-control emailId" name="contact" id="contact" required/><br />
	  <label>SSN Number:</label><input type="text" placeholder="SSN Number" class="form-control emailId" name="panCardNum" id="panCardNum" required/><br />
	  <label>Account Number:</label><input type="text" placeholder="Account Number" class="form-control emailId" name="accountNum" id="accountNum" required/><br />
	  <label>Address:</label><input type="text" placeholder="Address" class="form-control emailId" name="address" id="address" required/><br />
     	<button type="button" class="btn btn-warning updateBtn" onClick="updating()">Update Details</button>
     
      </div>
    </div>
    
       <div id="menu4" class="tab-pane fade in active">
      
   <!-- TradingView Widget BEGIN -->
<script type="text/javascript" src="https://d33t3vvu2t2yu5.cloudfront.net/tv.js"></script>
<script type="text/javascript">
new TradingView.widget({
  "width": 1900,
  "height": 850,
  "symbol": "NASDAQ:GOOG",
  "interval": "3",
  "timezone": "Etc/UTC",
  "theme": "Black",
  "style": "1",
  "locale": "en",
  "toolbar_bg": "rgba(255, 152, 0, 1)",
  "allow_symbol_change": true,
  "details": true,
  "calendar": true,
  "news": [
    "headlines"
  ],
  "hideideas": true,
  "studies": [
    "ATR@tv-basicstudies"
  ],
  "show_popup_button": true,
  "popup_width": "1000",
  "popup_height": "650"
});
</script>
<!-- TradingView Widget END -->

     
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>
