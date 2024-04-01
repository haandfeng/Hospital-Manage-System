<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.project.dao.LoginDao" 
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
     <%! 
	LoginDao infoLog= new LoginDao();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	.demo{
	font-size: 20px;
	margin-left: 100px;
	margin-right: 100px;
	}
</style>	  
</head>
<body onload="printFunction()">
<script>
	function printFunction()
	{ window.print()}
</script>
	<div class="container"><br/>
		<%@ page import="com.project.entity.Login" %>
		<% Login l=(Login)session.getAttribute("userInfo");	 %>
		<% if(l.getRole().equals("doctor")){ %>
			<center><h2>Patient Prescription Copy</h2></center><br/>
		<%} %>
		
		<!-- header -->
		<div class="row">
			<div class="col-sm-5">
			<h1><span style="color:blue;">S</span><span style="color:red;">C</span><span style="color:grey;">UT</span> HOSPITAL</h1>
			</div>
			<div class="col-sm-7">
			<p><b>Dr. Sachine Kautikrao Deore</b><br/> MBBS, DNB(Gen. Surgeon), MS, MNAMS, FMAS, FIAGES, FALS, AFIH</p>
			</div>
		</div>
		<hr/>
	<div class="demo">
			<% String pname=""; 
			  if(l.getRole().equals("doctor")){
			  pname= (String)session.getAttribute("currentPatientName");
			  }%>
			  <% if(l.getRole().equals("receptionist")){
			  pname= (String)request.getAttribute("patientName");
			  }%>
		 	<div>
		 	
		 	<%@ page import="com.project.entity.OpdDetails" %>
		 	<% OpdDetails prescription= (OpdDetails)request.getAttribute("prescription"); %>
		 		<div class="row">
		 			<div class="col-sm-10"><b>Name:</b> <%=pname %> </div>
		 			<div class="col-sm-2"><span style="text-align:right; color:blue;"><%= prescription.getOpdid() %></span></div>
		 		</div>		 		
		 		<br/><br/>
		 		<b>Rx</b>
		 	</div>
		 	<div class="row">
		 	<div class="col-sm-1"></div>
		 	<div class="col-sm-10">
			<table class="table borderless">
			    <tbody>
			       <tr>
			        <td>Medicines & Dose: </td>
			        <td>
			        	<%  
			        	String temp=prescription.getMedicinesDose();
						String[] temp1=temp.split("#");
				try{
						String[] temp2;
						for(int i=1; i<temp1.length; i++)
						{  
							temp2=temp1[i].split("@");
							out.print("- "+temp2[0]+" ("+temp2[1]+" times) "+"<br>");
						}
				 	}
				 	catch(Exception e)
				 	{
				 		infoLog.logActivities(""+e);
				 		for(int i=1; i<temp1.length; i++)
						{
				 		out.print("- "+temp1[i]+"<br>");
						}
				 	}
			        	%>
			        </td>
			      </tr>
			      <tr>
			        <td>Do's: </td>
			         <td>
			        	<%  
				        	temp=prescription.getDos();
							temp1=temp.split("#");
							for(int i=1; i<temp1.length; i++)
							{  
								out.print("- "+temp1[i]+"<br>");
							}
			        	%>
			        </td>
			      </tr>
			  	 <tr>
			        <td>Don'ts</td>
			         <td>
			        	<%  
				        	temp=prescription.getDonts();
							temp1=temp.split("#");
							for(int i=1; i<temp1.length; i++)
							{  
								out.print("- "+temp1[i]+"<br>");
							}
			        	%>
			        </td>
			     </tr>
			     <tr>
			        <td>Investigations: </td>
			        <td><%= prescription.getInvestigations() %></td>	
			     </tr>
			     <tr>
			        <td>Follow up Date: </td>
			        <td><%= prescription.getFollowupDate() %></td>
			     </tr>
			     <tr>
			        <td>Fees: </td>
			        <td><%= prescription.getFees() %></td>
			     </tr>
			</tbody>
			</table>
			</div>
			<div class="col-sm-1"></div>
			</div>
	</div>
			<div>
				<small>*or other cheaper generic medicines of same contents, as per choice of patients. No compulsion of particular brand.</small>
				<hr/>
				Our Centers:<br/>
				1. SCUT Hospital, Wushan road, GuangZhou,China 510000 |
				2. SCUT Hospital, XiaoGuWei road, GuangZhou,China 510000 <br/>
				Mobile No. 8087030000 | Phone No. 020-2575151 | E-mail: SCUT@gmail.com
			</div>	
	
	</div><br/><br/>		    	
</body>
</html>