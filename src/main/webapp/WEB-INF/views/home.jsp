<%@ page import="com.project.trading.pojo.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
        <title>Trading Application</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/CSS/example.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/CSS/trade.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/JS/background.cycle.js"></script>
		<script src="<%=request.getContextPath()%>/resources/JS/modernizr.custom.js"></script>
		<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
		<script>
  		function preventBack(){window.history.forward();}
  		setTimeout("preventBack()", 0);
  		window.onunload=function(){null};
		</script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("body").backgroundCycle({
                    imageUrls: [
                        '<%=request.getContextPath()%>/resources/IMG/bg1.jpg',
                        '<%=request.getContextPath()%>/resources/IMG/bg2.jpg',
                        '<%=request.getContextPath()%>/resources/IMG/bg3.jpg'
                    ],
                    fadeSpeed: 2000,
                    duration: 5000,
                    backgroundSize: SCALING_MODE_COVER
                });
            });
			
         
          
			function toggleIt(id,id1)
			  {
				var signup=document.getElementById(id);
				var signin=document.getElementById(id1);
				var displaySetting=signup.style.display;
				if(displaySetting=='none')
				{
					signup.style.display='block';
					signin.style.display='none';
					
				}
				else
				{
					signup.style.display='none';
					signin.style.display='block';
				}
			  }
			  
			  function toggleNow(id,id1)
			  {
				var signup=document.getElementById(id);
				var signin=document.getElementById(id1);
				var displaySetting=signin.style.display;
				if(displaySetting=='none')
				{
					signup.style.display='none';
					signin.style.display='block';
					
				}

			  }
			  function hidelDiv()
			  {
				  document.getElementById('fNameDiv').style.display = 'none';
				  
			  }
			  function hiding()
	            {
	            	
	            	document.getElementById('userN').style.display = 'none';
	            	document.getElementById('pwUsers').style.display = 'none';
	            	document.getElementById("hideIt").style.display = 'none';
	            }
			  
			   function chkValues()
	            {
	            	var fName=document.getElementById("fName").value;
	            	var lName=document.getElementById("lName").value;
	            	var userName=document.getElementById("nameUs").value;
	            	re = /^[a-zA-Z]+$/;
	            	 if(!re.test(fName)) {
						  document.getElementById('fNameDiv').style.display = 'block';
						  document.getElementById("fNameDiv").innerHTML="FirstName must contain only letters!!";
					      return false;
					    } 
	            	 if(!re.test(lName)) {
						  document.getElementById('lNameDiv').style.display = 'block';
						  document.getElementById("lNameDiv").innerHTML="LastName must contain only letters!!";
					      return false;
					    } 
	            	  ret = /^\w+$/;
					  if(!ret.test(userName)) {
						  document.getElementById('userrNAME').style.display = 'block';
						  document.getElementById("userrNAME").innerHTML="Username must contain only letters, numbers and underscores!";
					      return false;
					    }
					  
	            	
	            }
	            
			  var xmlHttp;
			  xmlHttp=new XMLHttpRequest();
			  function chkUser()
			  {
				  if (xmlHttp == null)
                  {
                      alert("Your browser does not support AJAX!");
                      return;
                  }
				  else
				  {
					  var ckstat=document.getElementById('messageCheckbox').checked;
					  var nameUser=document.getElementById("nameOfUser").value;
					  var pwUser=document.getElementById("pwOfUser").value;
					  
					  if(nameUser == "")
						  {
						  document.getElementById('userN').style.display = 'block';
						  document.getElementById("userN").innerHTML="You cannot leave this Field blank!!";
						  return false;
						  }
					  
					  if(pwUser == '')
					  {
					  document.getElementById('pwUsers').style.display = 'block';
					  document.getElementById("pwUsers").innerHTML="You cannot leave this Field blank!!";
					  return false;
					  }
					  
					  re = /^\w+$/;
					  if(!re.test(nameUser)) {
						  document.getElementById('userN').style.display = 'block';
						  document.getElementById("userN").innerHTML="Username must contain only letters, numbers and underscores!";
					      return false;
					    }
					  
					  p= /^[a-zA-Z0-9]*$/;
					  if(!p.test(pwUser)) {
						  document.getElementById('pwUsers').style.display = 'block';
						  document.getElementById("pwUsers").innerHTML="Password must contain only letters and numbers!!";
					      return false;
					    }
				  }
				 
				  xmlHttp.onreadystatechange = function stateChanged()
				  {
					  if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
						  {
						  
						  var returnedValue=xmlHttp.responseText;
						  if(returnedValue.trim()=="false")
							  {
							   document.getElementById('hideIt').style.display = 'block';
							   document.getElementById("hideIt").innerHTML="Id and password could not be found";
							  }
						  else if(returnedValue.trim()=="adminIsHere")
						  	  {
						  	  location.href="/trading/adminIsHere.htm";
						  	  }
						  else if(returnedValue.trim()=="brokerIsHere")
					  	  {
					  	  location.href="/trading/brokerIsHere.htm";
					  	  }
						  else if(returnedValue.trim()=="tmIsHere")
					  	  {
					  	  location.href="/trading/tmIsHere.htm";
					  	  }
						  else
						  {
							  location.href="/trading/investorWorkspace.htm";
						  }
						  }
				  };

				  var query= "Username=" + nameUser + "&password=" + pwUser+"&remeberMeOpt=" + ckstat;
				  xmlHttp.open("POST","searchinvestor.htm",true);
				  xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				  xmlHttp.send(query);
				
				  return null;
			  }
			  
			  
			  function allBrokers()
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
							    var nameArray =new Array(),i;
							    count=nameArray.length;
							    for(i=0;i<count;i++)
							    	{
							    	nameArray[i]=json.bList[i].fName;
							    	}
							    var newDiv=document.createElement('div');
							    var a=document.getElementById("selectCreate");
							    var html='<select class="form-control size" name="item">';
							    for(i=0;i<nameArray.length;i++)
							    	{
							    	html=html+"<option value='"+nameArray[i]+"'>"+nameArray[i]+"</option>";
							    	}
							    html += '</select>';
							    newDiv.innerHTML= html;
							    a.appendChild(newDiv);
							  }
					  }
					  xtp.open("POST","popBro.htm",true);
					  xtp.send();
					  return null;
			      }
				  
				  
			  }
        </script>
</head>
<body style="margin: 0;" onload="allBrokers()">
<style>
#fNameDiv
{
font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
color:red;
font-weight: bold;
margin-left:20px;
margin-bottom: 0px;
margin-top: 10px;
}
#lNameDiv
{
font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
color:red;
font-weight: bold;
margin-left:20px;
margin-bottom: 0px;
margin-top: 10px;
}
#pwUsers
{
font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
color:red;
font-weight: bold;
margin-left:20px;
margin-bottom: 0px;
margin-top: 10px;
}
#userN
{
font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
color:red;
font-weight: bold;
margin-left:20px;
margin-bottom: 0px;
margin-top: 10px;
}
.size{
width:150px;
margin-left: 70px;
}
.white
{
font-family: 'Avant Garde', Avantgarde, 'Century Gothic', CenturyGothic, AppleGothic, sans-serif;
color:white;
margin-top: 10px;
margin-bottom: 10px;
font-size:20px;

}
</style>
    <div class="jquery-script-ads" align="center"><script type="text/javascript"><!--
google_ad_client = "ca-pub-2783044520727903";
/* jQuery_demo */
google_ad_slot = "2780937993";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
</div>


    <div class="wrapper">
        <div class="container-fluid">
			<div class="row">
				<div class="transparentBox">
                </div><!--transparent box closed-->
			</div><!--row closed-->
		</div><!--Container-fluid closed-->
	</div><!--wrapper closed-->
	<div class="topNav">
	<nav class="navbar navbar-inverse">
       <div class="container-fluid">
           <div class="navbar-header">
                 <a class="navbar-brand" href="#">TradeShares.com</a>
           </div>
    <ul class="nav navbar-nav">
    </ul>
       </div>
     </nav>
	 </div>
	<div class="heads">
	<p>Fastest Trading</p>
	<p class="ever"><b>EVER</b></p>
	</div>
	<div class="subs">
	<p>More than 7,000,000 accounts opened</p>
	<p class="seccondline">more than 1,500,000 trades per day</p>
	</div>
	<div class="butts">
    <input type="button" id="showRight" value="TRADE NOW" class="butn">
	</div>
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
			
			<input type="button" value="SIGN IN" onclick="toggleNow('signingUp','getStarted')" class="smallbutn signin" /> <input type="button" value="SIGN UP" onclick="toggleIt('signingUp','getStarted')" class=" smallbutn register" />
			<div id="getStarted" style="display:block;">
			
			<form action="searchinvestor.htm" method="post">
			
			<input type="text" class="form-control emailId" placeholder="Username" name="usernames" id="nameOfUser" value='${cookie.userid.value}' onfocus="hiding()" required/> 
			<div id="userN"></div>
			<input type="password" placeholder="password" class="pw form-control" name="pw" id="pwOfUser" value='${cookie.pwrd.value}' onfocus="hiding()" required/>
			<div id="pwUsers"></div>
			<div id="box"><input type="checkbox" name="check" value="remember" id="messageCheckbox"><span class="reme"> Remember Me</span></div>
			<div id="hideIt"></div>
			<input type="button" value="Login" onclick="chkUser()" class="smallbutn logs" />
			
			</form>
			</div>
			
			<div style="display:none;" id="signingUp">
			
			<form:form action="addinvestor.htm" commandName="investor" method="post">
			
			<form:input type="text" class="form-control emailId" placeholder="First Name" path="fName" name="fName" id="fName" />
			<font color="red"><form:errors path="fName"/></font>
			<form:input type="text" class="form-control emailId" placeholder="Last Name" path="lName" name="lName" id="lName" onfocus="hidelDiv()" required="true"/> 
			<font color="red"><form:errors path="lName"/></font>
			<form:input type="email" class="form-control emailId" placeholder="Email ID" path="eMailID"  name="eMailID" required="true"/> 
			<font color="red"><form:errors path="eMailID"/></font>
			<form:input type="text" class="form-control emailId" placeholder="Username" path="userName" name="userName" id="nameUs" required="true"/> 
			<font color="red"><form:errors path="userName"/></font>
			<form:input type="password" placeholder="password" class="pw form-control" path="password" name="password"  required="true"/>
			<font color="red"><form:errors path="password"/></font>
			<form:input type="text" placeholder="Contact Number" class="form-control emailId" name="contact" path="contact"  required="true"/>
			<font color="red"><form:errors path="contact"/></font>
			<form:input type="text" placeholder="PAN Card Number" class="form-control emailId" name="panCardNum" path="panCardNum" required="true"/>
			<font color="red"><form:errors path="panCardNum"/></font>
			<form:input type="text" placeholder="Account Number" class="form-control emailId" name="accountNum" path="accountNum" required="true"/>
			<font color="red"><form:errors path="accountNum"/></font>
			<form:input type="text" placeholder="Address" class="form-control emailId" name="address" path="address" required="true"/>
			<font color="red"><form:errors path="address"/></font>
			<input type="hidden" name="action" value="addInvestor"/>
			<div class="form-group" id="selectCreate">
			<div class="text-center white">CHOOSE A BROKER</div>
			</div>
			<input type="submit" value="Register" onClick="chkValues()" class=" smallbutn logs" />
			
			
			
			</form:form>
			</div>
			
	</nav>
	<script src="<%=request.getContextPath()%>/resources/JS/classie.js"></script>
		<script>
			var	menuRight = document.getElementById( 'cbp-spmenu-s2' ),
				showRight = document.getElementById( 'showRight' ),
				body = document.body;

			showRight.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( menuRight, 'cbp-spmenu-open' );
				disableOther( 'showRight' );
			};
		
			function disableOther( button ) {
				if( button !== 'showRight' ) {
					classie.toggle( showRight, 'disabled' );
				}
			
			}
		</script>
    <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

    </body>
</html>
