<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="travel.SubcategoryDao,travel.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="travel.DBConnection,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SubCategory</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">
  <style type="text/css">
  #category-welcome{
   background-image:url(img/117.jpg);
  }
  .tour{
  font-weight:120px;
   color:white;
  padding:50px;
 
  }
  .body-tour{
 margin:0px;
  
  }
 
  </style>
</head>
<body>
<section id="category-welcome">
<div class="headingText">Welcome to Make My Tour</div>
<div class="tour">
<div class="body-tour">

Plan and Book Your Perfect Trip.Create your dream holiday.
what you like. Do what you love.
What's New Explore new experiences, attractions, food and wine trends.
What will you find during your visit to My Tour? Awe-inspiring natural beauty and the dramatic
red rock landscape of the Colorado National Monument. Exhilarating outdoor adventures including
hiking, camping or skiing on the Grand Mesa. Hundreds of miles of world-class mountain biking trails
such as the Kokopelli Trail. Incredible whitewater rafting on the Colorado River. Stunning golf courses
whose green fairways are juxtaposed against the craggy Redland desert. Peaceful places to reflect and
unwind amidst the natural splendor of Colorado's Western Slope. A charming downtown full of great
shops, restaurants, art galleries and so much more. This is My Tour, where you can experience
beautiful tourist places.
</div>
</div>

</section>
<div class="row"style=" margin:auto" >
   <div class="col-md-3 "style="background-color:#737070;padding-left:110px;padding-top:10px;float:left;">
         <div class=" " id="dwn-ticket"><span class="font-weight-bold text-white">Download Ticket:</span><input type="text" name="trans_id" id="trans_id" placeholder="Enter Tid"><a href="#" target="_blank"class="btn btn-info" id="pdf"onclick="dwnPdf()" style="margin-top:5px !important;">Download</a></div>
        <div class="row font-weight-bold" style="font-family:Lucida Calligraphy; font-size:20px; padding-top:20px;color:#09F">Category</div>

         <%
          Connection con=new DBConnection().Connect();
          PreparedStatement ps=con.prepareStatement("select * from tbl_category");
          ResultSet rs=ps.executeQuery();
          while(rs.next()){
         %>
        <div class="row" style="padding:7px;font-weight:bold"><a href="subcategory.jsp?cat_id=<% out.print(rs.getInt(1)); %>" style="text-decoration:none;color:white !important;"><% out.print(rs.getString(2)); %></a></div>
       <%
       }
      %>
   </div>
   
 <div class="col-md-9"style="background-color:#ebfff0;float:left;padding-top:20px;">
  <div class="text-center text-white bg-info display1"style="border-bottom:2px solid red;"><h2>Package List</h2></div>
    
    <div class="row">
       <%
       int subcat_id=Integer.parseInt(request.getParameter("subcat_id"));
       Connection con1=new DBConnection().Connect();
       PreparedStatement ps1=con1.prepareStatement("select * from tbl_package where fk_subcat_id="+subcat_id+"");
       ResultSet rs1=ps1.executeQuery();
       while(rs1.next()){
       %> 
       <%
       String pic =rs1.getString(6);
       //SubcatImages/
		  pic=pic.substring(pic.lastIndexOf("/")-13);
       %>
        <div class="card-group p-3">
	      <div class="card" style="width:200px;">
	        <a href="details.jsp?pack_id=<%out.print(rs1.getInt(1));%>" style="text-decoration:none">
               <img class="card-img-top" src="<%out.print(pic); %>" alt="Card image cap"style="width:198px;height:150px;">
               <div class="card-body bg-info text-white p-2">
               <p class="card-text text-center font-weight-bold "><%out.print(rs1.getString(4)); %></p>
               </div>
             </a>
         </div>
       </div> 
     <%
    }      
    %> 
   </div> 
</div>

</div>

 <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  function dwnPdf(){
	  var trans_id=$('#trans_id').val();
	    var url = "print_ticket.jsp?trans_id=" + trans_id;
  	     $('#pdf').attr("href",url)
	}
  </script>
</body>
</html>