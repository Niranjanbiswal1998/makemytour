<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="travel.PackageDao,travel.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="travel.DBConnection,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link rel="stylesheet" href="css/jquery-ui.css">
  

  <!-- Custom styles for this template-->
  <link href="css/bootstrap.css" rel="stylesheet">
  <style type="text/css">
  .ui-datepicker-today a.ui-state-highlight {
    border:2px solid yellow;
    background: red;
    color:white;
    font-weight:bold;    
}

  
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
.col {
    flex-basis: 100%;
    flex-grow: 1;
    max-width: 100%;
}
ol, ul {
    list-style: none outside none;
}
.plc-list {
    font-size: 17px;
    margin: 0 0 0 6px;
    padding: 0;
    width: 160px;
    text-align: left;
}
.plc-list li {
    background-image: url(img/right-mark.gif)!important;
    background-position: 0 4px;
    background-repeat: no-repeat;
    background-size: 12px auto;
    padding-left: 20px;
}

.etr_adlt {
    width: 140px;
    float: left;
    padding: 0;
    margin: 0;
}
.etr_adltcnt {
    padding-bottom: 5px;
    padding-top: 0px;
    font-size: 13px;
}
.etr_wrw {
    padding: 5px 0;
    overflow: hidden;
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
   
 <div class="col-md-7"style="background-color:#ebfff0;float:left;padding-top:20px;">
    <div class="row">
    <div class="row font-weight-bold" style="font-family:Lucida Calligraphy; font-size:20px;padding-left:30px; padding-top:10px;color:#09F">Package Details</div>
       <%
       int pack_id=Integer.parseInt(request.getParameter("pack_id"));
       Connection con1=new DBConnection().Connect();
       PreparedStatement ps1=con1.prepareStatement("select p.pack_id, c.cat_name,s.subcat_name,p.pack_name,p.pack_price,p.pic1Path,p.pic2Path,p.pic3Path ,p.pack_details from tbl_category c inner join tbl_subcategory s inner join tbl_package p on c.cat_id=p.fk_cat_id and s.subcat_id=p.fk_subcat_id where p.pack_id="+pack_id+"");
       ResultSet rs1=ps1.executeQuery();
       while(rs1.next()){
       %> 
       <%
       String packpic1=rs1.getString(6); 
       String packpic2=rs1.getString(7); 
       String packpic3=rs1.getString(8); 
       //PackImages/
		  packpic1=packpic1.substring(packpic1.lastIndexOf("/")-13);
		  packpic2=packpic2.substring(packpic2.lastIndexOf("/")-13);
		  packpic3=packpic3.substring(packpic3.lastIndexOf("/")-13);
       %>
       
       
       <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100 p-2" src="<%out.print(packpic1); %>" alt="First slide" style="height:300px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 p-2" src="<%out.print(packpic2); %>" alt="Second slide" style="height:300px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 p-2" src="<%out.print(packpic3); %>" alt="Third slide"  style="height:300px;">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
       
   <div class="container">
    <span class="row font-weight-bold" style="font-family:Lucida Calligraphy; font-size:20px; padding-left:20px;color:#09F">Package Name:<% out.print(rs1.getString(4));%></span> 
  <hr style="border-bottom:2px solid gray">
  <div class="row" style="">
    <div class="col-md-2 mb-3 p-4 "style="background-color:#dec9ff">
        <ul class="nav nav-pills flex-column" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="itinerary-tab" data-toggle="tab" href="#itinerary" role="tab" aria-controls="itinerary" aria-selected="true">Itinerary</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="overview-tab" data-toggle="tab" href="#overview" role="tab" aria-controls="overview" aria-selected="false">Overview</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="inclusion-tab" data-toggle="tab" href="#inclusion" role="tab" aria-controls="inclusion" aria-selected="false">Inclusion</a>
  </li>
  <li class="nav-item">
    <a class="nav-link " id="exclusion-tab" data-toggle="tab" href="#exclusion" role="tab" aria-controls="exclusion" aria-selected="true">Exclusion</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="term-tab" data-toggle="tab" href="#term" role="tab" aria-controls="term" aria-selected="false">Term</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="policy-tab" data-toggle="tab" href="#policy" role="tab" aria-controls="policy" aria-selected="false">Policy</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" id="video-tab" data-toggle="tab" href="#video" role="tab" aria-controls="video" aria-selected="false">Video</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="map-tab" data-toggle="tab" href="#map" role="tab" aria-controls="map" aria-selected="false">Map</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="addinfo-tab" data-toggle="tab" href="#addinfo" role="tab" aria-controls="addinfo" aria-selected="false">Addinfo</a>
  </li>
</ul>
    </div>
    <!-- /.col-md-4 -->
        <div class="col-md-10">
      <div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="itinerary" role="tabpanel" aria-labelledby="itinerary-tab">
  <h2>Itinerary</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, eveniet earum. Sed accusantium eligendi molestiae quo hic velit nobis et, tempora placeat ratione rem blanditiis voluptates vel ipsam? Facilis, earum!</p>
  </div>
  <div class="tab-pane fade" id="overview" role="tabpanel" aria-labelledby="overview-tab">
  <h2>Overview</h2>
      <div class="card-group">
	      <div class="card text-center" style="width:200px;margin:15px;">
               <img class="card-img-top" src="<%out.print(packpic1); %>" alt="Card image cap"style="width:198px;height:150px;">
               <%-- <div class="card-body bg-info text-white p-2">
               <p class="card-text text-center font-weight-bold "><%out.print(rs1.getString(3)); %></p>
               </div> --%>
         </div>
         <div class="card text-center" style="width:200px;margin:15px;">
               <img class="card-img-top" src="<%out.print(packpic2); %>" alt="Card image cap"style="width:198px;height:150px;">
               <%-- <div class="card-body bg-info text-white p-2">
               <p class="card-text text-center font-weight-bold "><%out.print(rs1.getString(3)); %></p>
               </div> --%>
         </div>
         <div class="card text-center" style="width:200px;margin:15px;">
               <img class="card-img-top" src="<%out.print(packpic3); %>" alt="Card image cap"style="width:198px;height:150px;">
               <%-- <div class="card-body bg-info text-white p-2">
               <p class="card-text text-center font-weight-bold "><%out.print(rs1.getString(3)); %></p>
               </div> --%>
         </div>
       </div> 
  
  
      <div class="row"style="float:left">
           <div class="col">
             <label class="font-weight-bold text-danger" ><span class="text-dark">1.</span>Category Name:</label>
             <label class="font-weight-bold text-info" ><% out.print(rs1.getString(2));%></label>
           </div><br>
          <div class="col">
            <label class="font-weight-bold text-danger"><span class="text-dark">2.</span>Sub Category Name:</label>
            <label class="font-weight-bold text-info" ><% out.print(rs1.getString(3));%></label>
         </div><br>
         <div class="col">
            <label class="font-weight-bold text-danger"><span class="text-dark">3.</span>Package Name:</label>
            <label class="font-weight-bold text-info" ><% out.print(rs1.getString(4));%></label>
         </div><br>
         <div class="col">
            <label class="font-weight-bold text-danger"><span class="text-dark">4.</span>Package Price:</label>
            <label class="font-weight-bold text-info" ><% out.print(rs1.getString(5));%></label>
         </div><br>
         <div class="col">
            <label class="font-weight-bold text-danger"><span class="text-dark">5.</span>Package Details:</label>
            <p  class="font-weight-bold font-italic text-info"style="padding-left:70px;"><% out.print(rs1.getString(9));%></p>
           
         </div><br>
         <div class="text-center "style="padding-left:300px;"><a href="" class="btn btn-sm btn-danger m-1">Book Online</a><a href="" class="btn btn-sm btn-danger">Enquiry</a></div>
        </div>
  </div>
  <div class="tab-pane fade" id="inclusion" role="tabpanel" aria-labelledby="inclusion-tab">
  <h2>Inclusion</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, eveniet earum. Sed accusantium eligendi molestiae quo hic velit nobis et, tempora placeat ratione rem blanditiis voluptates vel ipsam? Facilis, earum!</p>
  
  </div>
  <div class="tab-pane fade" id="exclusion" role="tabpanel" aria-labelledby=exclusion-tab">
  <h2>Exclusion</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, eveniet earum. Sed accusantium eligendi molestiae quo hic velit nobis et, tempora placeat ratione rem blanditiis voluptates vel ipsam? Facilis, earum!</p>
  </div>
  <div class="tab-pane fade" id="term" role="tabpanel" aria-labelledby="term-tab">
  <h2>Term</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, eveniet earum. Sed accusantium eligendi molestiae quo hic velit nobis et, tempora placeat ratione rem blanditiis voluptates vel ipsam? Facilis, earum!</p>
  </div>
  <div class="tab-pane fade" id="policy" role="tabpanel" aria-labelledby="policy-tab">
  <h2>Policy</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, eveniet earum. Sed accusantium eligendi molestiae quo hic velit nobis et, tempora placeat ratione rem blanditiis voluptates vel ipsam? Facilis, earum!</p>
  </div>
  <div class="tab-pane fade" id="video" role="tabpanel" aria-labelledby="video-tab">
  <h2>Video</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, eveniet earum. Sed accusantium eligendi molestiae quo hic velit nobis et, tempora placeat ratione rem blanditiis voluptates vel ipsam? Facilis, earum!</p>
  </div>
  <div class="tab-pane fade" id="map" role="tabpanel" aria-labelledby="map-tab">
  <h2>Map</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, eveniet earum. Sed accusantium eligendi molestiae quo hic velit nobis et, tempora placeat ratione rem blanditiis voluptates vel ipsam? Facilis, earum!</p>
  </div>
  <div class="tab-pane fade" id="addinfo" role="tabpanel" aria-labelledby="addinfo-tab">
  <h2>Addinfo</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, eveniet earum. Sed accusantium eligendi molestiae quo hic velit nobis et, tempora placeat ratione rem blanditiis voluptates vel ipsam? Facilis, earum!</p>
  </div>
</div>
    </div>
    <!-- /.col-md-8 -->
  </div>
  
  
  
</div>
<!-- /.container -->    
   </div> 
   
</div>
<div class="col-md-2" style="background-color:#f5fffe">
<div>
<p><b>Category Name:</b><% out.print(rs1.getString(2));%></p>
<p><b>Subcategory Name:</b><% out.print(rs1.getString(3));%></p>
<p><b>Package Name:</b><% out.print(rs1.getString(4));%></p>
<p><b>Price:</b><% out.print(rs1.getString(5));%><br><span>(price per person above 12 yr.)</span></p>
</div>

<div><a href="" class="btn btn-sm btn-danger m-1" data-toggle="modal" data-target="#bookonline">Book Online</a><a href="" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#inquiry">Enquiry</a></div>
  <div class="" id="">
    <h3>Why Book with us?</h3>
     <hr style="border-bottom:2px solid gray">
       <div class="slf-cnt description">
         <ul class="plc-list">
            <li>Best Rates Guaranteed</li>
            <li>World Class Service</li>
            <li>Excellent Discount for Regular Clients</li>
            <li>Best Customer Support</li>
          </ul>
          <br clear="all">
       </div>
   </div>
</div>

</div>

<!-- Modal Bookonline-->
<div id="bookonline" class="modal fade" role="dialog" >
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
       
        <h4 class="modal-title">Book Online</h4>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <div class="modal-body">
        <input type="hidden" id="hdnselectedpack" value="<% out.print(rs1.getString(5));%>">
         <form action="" method="post" id="bookOnlineForm">
             
         </form>
         
          <label>Call Us: <b><span id="ContentPlaceHolder1_lblClientContact">+91-7381584856</span>(9AM TO 6PM)</b></label>
                 <div class="row">
                      			<div class="col-md-6">
                                    <div class="form-group">
                                      <label>Package Name:</label>
                                      <input class="form-control" id="txtPackageName" name="textPackageName"  type="text" value="<% out.print(rs1.getString(4));%>" readonly>
                                        <!--<select class="form-control" id="hldslct_season"><option>02-02-2014 - 29-01-2020</option></select> -->
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select travel date</label>
                                       <!--  <input class="form-control" id="txttraveldate" name="textDoj"  placeholder="Select travel date"type="text"> -->
                                        <input class="form-control" id="txttraveldate" placeholder="Travel date" name="traveldate" type="text">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                        <div class="etr_radio">
                                            <div class="etr_adltcnt">
                                                <b>Package Price</b>
                                            </div>
                                            <div id="divPackageTypes">
                                            <label ><b> &#8377 <% out.print(rs1.getString(5));%></b><span>(Price applicable for adult only)</span></label>
                                            <!-- <label class="hd_durationType"><label class="hd_durationck fl"><input type="radio" class="d-none" id="packagetype0" value="Standard-TIRUPATI" name="rbtPackageType" onchange="fnPackageType(&quot;0&quot;);" checked="checked"><label class="hd_durationtyp fl">Standard Package starting from TIRUPATI</label></label></label></div> -->
                                        </div>
                                    </div>
                                  
                                </div>
                                <!-- <div class="col-md-6">
                                     <div class="form-group">
                                        <label for="room_type">Room Type:</label>
                                           <select class="form-control" id="room_type">
        									  <option>AC</option>
        									  <option>NON AC</option>
        									  
       
     									 </select>
                                    </div>
                                </div> -->
                                <div class="col-md-12">
                                <div class="col-md-12">
                                    <div class="etr_wrw" id="gi_hld_room1">
                                        <div class="etr_adlt">
                                            <div class="etr_adltcnt">
                                                <b>Room</b>
                                            </div>
                                            <div class="etr_adltct notranslate">
                                                <label class="btn btn-lg font-weight-bold" type="button" id="hldRoomminus" onclick="AddRoom('-1');"style="color:red;">-</label>
                                                <label class="btn btn-sm border-none font-weight-bold" id="hldRooms">1</label>
                                                <label class="btn btn-lg font-weight-bold" type="button" id="hldRoomplus" onclick="AddRoom('1');"style="color:green;">+</label>
                                            </div>
                                        </div>
                                        <div class="etr_adlt">
                                            <div class="etr_adltcnt">
                                                <b>Adults</b> <span class="etr_lmt">12+ yrs</span>
                                            </div>
                                            <div class="etr_adltct notranslate">
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('1','-1','Adult');" id="hld1RoomAdultminus"style="color:red;">- </label>
                                                <label class="btn btn-sm border-none font-weight-bold" id="hld1Adults">1</label>
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('1','1','Adult');" id="hld1RoomAdultplus" style="color:green;">+</label>
                                            </div>
                                        </div>
                                        <div class="etr_adlt">
                                            <div class="etr_adltcnt">
                                                <b>Children</b> <span class="etr_lmt">2-12 yrs</span>
                                            </div>
                                            <div class="etr_adltct notranslate">
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('1','-1','Child');" id="hld1RoomChildminus" style="color:red;">- </label>
                                                <label class="btn btn-sm border-none font-weight-bold" id="hld1Child">0</label>
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('1','1','Child');" id="hld1RoomChildplus" style="color:green">+</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="etr_wrw" id="gi_hld_room2" style="display: none;">
                                        <div class="etr_adlt">
                                            &nbsp;
                                        </div>
                                        <div class="etr_adlt">
                                            <div class="etr_adltct notranslate">
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('2','-1','Adult');" id="hld2RoomAdultminus" style="color:red;">- </label>
                                                <label class="btn btn-sm border-none font-weight-bold" id="hld2Adults">3</label>
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('2','1','Adult');"id="hld2RoomAdultplus" style="color:green;">+</label>
                                            </div>
                                        </div>
                                        <div class="etr_adlt">
                                            <div class="etr_adltct notranslate">
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('2','-1','Child');" id="hld2RoomChildminus"style="color:red;">- </label>
                                                <label class="btn btn-sm border-none font-weight-bold" id="hld2Child">0</label>
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('2','1','Child');" id="hld2RoomChildplus" style="color:green;">+</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="etr_wrw" id="gi_hld_room3" style="display: none;">
                                        <div class="etr_adlt">
                                            &nbsp;
                                        </div>
                                        <div class="etr_adlt">
                                            <div class="etr_adltct notranslate">
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('3','-1','Adult');" id="hld3stRoomAdultminus" style="color:red;">- </label>
                                                <label class="btn btn-sm border-none font-weight-bold" id="hld3Adults">3</label>
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('3','1','Adult');"id="hld3stRoomAdultplus" style="color:green;">+</label>
                                            </div>
                                        </div>
                                        <div class="etr_adlt">
                                            <div class="etr_adltct notranslate">
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('3','-1','Child');" id="hld3RoomChildminus" style="color:red;">- </label>
                                                <label class="btn btn-sm border-none font-weight-bold" id="hld3Child">0</label>
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('3','1','Child');" id="hld3RoomChildplus" style="color:green;">+</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="etr_wrw" id="gi_hld_room4" style="display: none;">
                                        <div class="etr_adlt">
                                            &nbsp;
                                        </div>
                                        <div class="etr_adlt">
                                            <div class="etr_adltct notranslate">
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('4','-1','Adult');" id="hld4RoomAdultminus" style="color:red;">- </label>
                                                <label class="btn btn-sm border-none font-weight-bold" id="hld4Adults">3</label>
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('4','1','Adult');" id="hld4RoomAddplus" style="color:green;">+</label>
                                            </div>
                                        </div>
                                        <div class="etr_adlt">
                                            <div class="etr_adltct notranslate">
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('4','-1','Child');" id="hld4RoomChildminus" style="color:red;">- </label>
                                                <label class="btn btn-sm border-none font-weight-bold" id="hld4Child">0</label>
                                                <label class="btn btn-lg font-weight-bold" type="button" onclick="AddPax('4','1','Child');" id="hld4RoomChildplus" style="color:green;">+</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                <div><hr></div>
                                    <%-- <div class="etr_wrw">
                                        <div class="etr_radio">
                                            <div class="etr_adltcnt">
                                                <b>Package Price</b>
                                            </div>
                                            <div id="divPackageTypes">
                                            <label ><b> &#8377 <% out.print(rs1.getString(5));%></b><span>(Price applicable for adult only)</span></label>
                                            <!-- <label class="hd_durationType"><label class="hd_durationck fl"><input type="radio" class="d-none" id="packagetype0" value="Standard-TIRUPATI" name="rbtPackageType" onchange="fnPackageType(&quot;0&quot;);" checked="checked"><label class="hd_durationtyp fl">Standard Package starting from TIRUPATI</label></label></label></div> -->
                                        </div>
                                    </div> --%>
                                </div>
                                <div class="col-md-12">
                                    <div class="float-left">
                                        <span class="etr_srchflt fr font-weight-bold " id="BookOverlay" style="color:red;font-size:25px;">Grand Total : &#8377 <span class="text-info h4 font-weight-bold" id="hld_paylabel">  <% out.print(rs1.getString(5));%></span></span><span>(Rupees only)</span>
                                    </div>
                                    
                                	 <button type="button" class="btn btn-danger ml-1 float-right" data-dismiss="modal">Close</button>
                                	 <label id="book_online" style="cursor: pointer" class=" btn btn-primary float-right" onclick="fnBookHolidayPackage()">Book Online</label>
                                </div>
                            </div>
                        </div>
                    </div>
      
  </div>
</div>
</div>
<!-- Modal Inquiry-->
<div id="inquiry" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        
        <h4 class="modal-title">Send Query</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
             <form id="inquiryForm">
             <input type="hidden" name="inq_pack_id" value="<%out.print(pack_id);%>">
             <div id="InquiryForm" class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input id="txtFullName" name="txtFullName" class="form-control" type="text" placeholder="Full name">
                                    </div>
                                </div>
                                
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input class="form-control" id="txtEmailID" name="txtEmailID" type="text" placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Mobile</label>
                                        <input id="txtMobileNumber" name="txtMobileNumber" class="form-control" maxlength="15" type="text" placeholder="Mobile number">
                                    </div>
                                </div>
                                
                                <!-- <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label for="sel1">Gender:</label>
                                           <select class="form-control" id="sel1">
        									  <option>Male</option>
        									  <option>Female</option>
        									  <option>Other</option>
       
     									 </select>
                                    </div>
                                </div> -->
                                
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Date of Journey</label>
                                        <input class="form-control" id="textDoj" name="textDoj"  placeholder="Select travel date"type="text">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>City</label>
                                        <input id="txtCityName" class="form-control" name="txtCityName" type="text" placeholder="Origin city">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Duration<span>(Days)</span></label>
                                        <input id="txtDuration" class="form-control" name="txtDuration" type="text"  placeholder="Duration">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label>Message</label>
                                        <textarea rows="5" cols="55" id="txtMessage" class="form-control" name="txtMessage" placeholder="Please write your Message"></textarea> 
                                    </div>
                                </div> 
                            </div>
           </form>  
             
      </div>
      <div class="modal-footer">
                <div class="col-md-6">
                   <input type="button" id="btn-inquiry" value="Submit Query" class="btn btn-primary float-left mr-1">
                <button type="button" class="btn btn-danger ml-1" data-dismiss="modal">Close</button>
                </div>
        
      </div>
    </div>

  </div>
</div>




 <%
    }      
    %> 
 <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/jquery/jquery-ui.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$( function() {
    $( "#textDoj" ).datepicker({
      dateFormat: 'dd-mm-yy',
      changeMonth: true,
      changeYear: true,
      minDate:0,
    });
  } );
$( function() {
    $( "#txttraveldate" ).datepicker({
      dateFormat: 'dd-mm-yy',
      changeMonth: true,
      changeYear: true,
      minDate:0,//for disable previous date from current date
      /* beforeShowDay:function(date){
    	  var day= date.getDay();
    	    return [(day != 2 && day != 4 && day != 6),''];
      } */
    });
  } );
</script>

<script type="text/javascript">
        function updatepageprice() {


            fnSaveSelectedPackage($('#hdnselectedpack').val());

        }

        $(document).ready(function () {

           

        });
       
        function AddRoom(count) {

            var roomCount = $('#hldRooms').html();
            if (roomCount >= 1 && roomCount <= 4) {

                $('#hldRooms').html((parseInt(roomCount) + parseInt(count)) <= 0 ? 1 : (parseInt(roomCount) + parseInt(count)) >= 4 ? 4 : (parseInt(roomCount) + parseInt(count)));

                switch ((parseInt(roomCount) + parseInt(count)) >= 4 ? 4 : (parseInt(roomCount) + parseInt(count))) {
                    case 1:
                        $('#gi_hld_room2').hide();
                        $('#gi_hld_room3').hide();
                        $('#gi_hld_room4').hide();
                        break;
                    case 2:
                        $('#gi_hld_room2').show();
                        $('#gi_hld_room3').hide();
                        $('#gi_hld_room4').hide();
                        break;
                    case 3:
                        $('#gi_hld_room2').show();
                        $('#gi_hld_room3').show();
                        $('#gi_hld_room4').hide();
                        break;
                    case 4:
                        $('#gi_hld_room2').show();
                        $('#gi_hld_room3').show();
                        $('#gi_hld_room4').show();
                        break;
                }
                //var PackageType=$('#PackageType').val();
                 var PackageType="FamilyTour";
                AddPax($('#hldRooms').html(), '-1', 'PackageType');

            }
        }

        function AddPax(roomNo, count, paxType) {
    
            var adultPax = $('#hld' + roomNo + 'Adults').html();
            
            var childPax = $('#hld' + roomNo + 'Child').html();
           
            //check condition -- package type selected
            if (paxType != "PackageType") {
                var newadultPax = 0;
                var newChildPax = 0;

                if ((parseInt(adultPax) + parseInt(childPax) + parseInt(count)) >= 0 && (parseInt(adultPax) + parseInt(childPax) + parseInt(count)) <= 3) {

                    //if (parseInt(adultPax) + parseInt(count) >= 3) {
                    //    $('#hld' + roomNo + 'Adults').html(3);
                    //    $('#hld' + roomNo + 'Child').html(0);
                    //} else {
                    newadultPax = (paxType == 'Adult') ? parseInt(adultPax) + parseInt(count) <= 0 ? 1 : ((parseInt(adultPax) + parseInt(count) >= 3) ? 3 : (parseInt(adultPax) + parseInt(count))) : adultPax;
                    newChildPax = (paxType != 'Adult') ? parseInt(childPax) + parseInt(count) <= 0 ? 0 : parseInt($('#hld' + roomNo + 'Adults').html()) == 3 ? 0 :


                        (parseInt(adultPax) + parseInt(childPax) == 3) ?
                            (parseInt(count) == 1) ? parseInt(childPax) : parseInt(childPax) + parseInt(count)
                            : parseInt(childPax) + parseInt(count)

                        : parseInt(childPax);


                    $('#hld' + roomNo + 'Adults').html(newadultPax);
                    $('#hld' + roomNo + 'Child').html(newChildPax);
                    //}
                } else {
                    newadultPax = (paxType == 'Adult') ?

                        parseInt(adultPax) + parseInt(childPax) == 3 ? (parseInt(count) == 1) ? parseInt(adultPax) : parseInt(adultPax) + parseInt(count) : parseInt(adultPax) + parseInt(count) :



                        adultPax;
                    newChildPax = (paxType != 'Adult') ? parseInt(childPax) + parseInt(count) <= 0 ? 0 : parseInt($('#hld' + roomNo + 'Adults').html()) == 3 ? 0 :

                        (parseInt(adultPax) + parseInt(childPax) == 3) ?
                            (parseInt(count) == 1) ? parseInt(childPax) : parseInt(childPax) + parseInt(count)
                            : parseInt(childPax) + parseInt(count)


                        : childPax;
                    $('#hld' + roomNo + 'Adults').html(newadultPax);
                    $('#hld' + roomNo + 'Child').html(newChildPax);
                }

            }

          
                            var totalAdultPaxCount = 0;
                        var totalChildPaxCount = 0;
                        switch (parseInt($('#hldRooms').html())) {
                            case 1:
                                totalAdultPaxCount = parseInt($('#hld1Adults').html());
                                totalChildPaxCount = parseInt($('#hld1Child').html());
                                break;
                            case 2:
                                totalAdultPaxCount = parseInt($('#hld1Adults').html());
                                totalChildPaxCount += parseInt($('#hld1Child').html());
                                totalAdultPaxCount += parseInt($('#hld2Adults').html());
                                totalChildPaxCount += parseInt($('#hld2Child').html());
                                break;
                            case 3:
                                totalAdultPaxCount = parseInt($('#hld1Adults').html());
                                totalChildPaxCount += parseInt($('#hld1Child').html());
                                totalAdultPaxCount += parseInt($('#hld2Adults').html());
                                totalChildPaxCount += parseInt($('#hld2Child').html());
                                totalAdultPaxCount += parseInt($('#hld3Adults').html());
                                totalChildPaxCount += parseInt($('#hld3Child').html());
                                break;
                            case 4:
                                totalAdultPaxCount = parseInt($('#hld1Adults').html());
                                totalChildPaxCount += parseInt($('#hld1Child').html());
                                totalAdultPaxCount += parseInt($('#hld2Adults').html());
                                totalChildPaxCount += parseInt($('#hld2Child').html());
                                totalAdultPaxCount += parseInt($('#hld3Adults').html());
                                totalChildPaxCount += parseInt($('#hld3Child').html());
                                totalAdultPaxCount += parseInt($('#hld4Adults').html());
                                totalChildPaxCount += parseInt($('#hld4Child').html());

                                break;
                        }
                        var price=$('#hdnselectedpack').val();
                        var ChildFare=0; 
                        //alert(price);
                        var grandTotal = ((Math.round(price) * totalAdultPaxCount) + Math.round(ChildFare) * totalChildPaxCount);//* parseInt($('#hldRooms').html())
                    
                        $('#hld_paylabel').html(Math.round(grandTotal));
                      //alert(grandTotal);
                   }

                //}
            //}
       // }



        function fnPackageType(id) {

            $('input[id^=packagetype]').removeAttr('checked');
            $("#packagetype" + id).attr('checked', true);
            AddPax($('#hldRooms').html(), '-1', 'PackageType');

        };

        function fnBookHolidayPackage() {
        	//var error_fk_dp_id='';
  		  
  		  
  		  if($.trim($('#txttraveldate').val()) .length==0){
  		  var msg ='Travel date required';
  		  alert(msg);
  		  }
  		  else
  		  {
  			  
  		 

            var totalAdultPaxCount = 0;
            var totalChildPaxCount = 0;
            switch (parseInt($('#hldRooms').html())) {
                case 1:
                    totalAdultPaxCount = parseInt($('#hld1Adults').html());
                    totalChildPaxCount = parseInt($('#hld1Child').html());
                    break;
                case 2:
                    totalAdultPaxCount = parseInt($('#hld1Adults').html());
                    totalChildPaxCount += parseInt($('#hld1Child').html());
                    totalAdultPaxCount += parseInt($('#hld2Adults').html());
                    totalChildPaxCount += parseInt($('#hld2Child').html());
                    break;
                case 3:
                    totalAdultPaxCount = parseInt($('#hld1Adults').html());
                    totalChildPaxCount += parseInt($('#hld1Child').html());
                    totalAdultPaxCount += parseInt($('#hld2Adults').html());
                    totalChildPaxCount += parseInt($('#hld2Child').html());
                    totalAdultPaxCount += parseInt($('#hld3Adults').html());
                    totalChildPaxCount += parseInt($('#hld3Child').html());
                    break;
                case 4:
                    totalAdultPaxCount = parseInt($('#hld1Adults').html());
                    totalChildPaxCount += parseInt($('#hld1Child').html());
                    totalAdultPaxCount += parseInt($('#hld2Adults').html());
                    totalChildPaxCount += parseInt($('#hld2Child').html());
                    totalAdultPaxCount += parseInt($('#hld3Adults').html());
                    totalChildPaxCount += parseInt($('#hld3Child').html());
                    totalAdultPaxCount += parseInt($('#hld4Adults').html());
                    totalChildPaxCount += parseInt($('#hld4Child').html());

                    break;
            }
           
            var price=$('#hdnselectedpack').val();
            var ChildFare=0; 
            //alert(price);
            var grandTotal = ((Math.round(price) * totalAdultPaxCount) + Math.round(ChildFare) * totalChildPaxCount);//* parseInt($('#hldRooms').html())
            var roomno= parseInt($('#hldRooms').html());
            
            //window.location.replace("page.jsp?id="+grandTotal);
            //window.location.href="https://www.google.com/";
            //$('#hld_paylabel').html(Math.round(grandTotal));
            // alert(grandTotal);
            // alert("Adult"+totalAdultPaxCount);
            //alert("Child"+totalChildPaxCount);
            //alert(parseInt($('#hldRooms').html()));var options = { "name1" : "value1", "name2" : "value2"};

                
            //fnBookOnline(totalAdultPaxCount, totalChildPaxCount, $('input[type="radio"][name="rbtPackageType"]:checked').val(), $('#hldRooms').html());
            // var options = { "price" : price, "total" : grandTotal};
             var random = Math.floor(1000 + Math.random() * 9000);//random number generator
             var random1 = Math.floor(1000 + Math.random() * 9000);//random number generator
             var random2 = Math.floor(1000 + Math.random() * 9000);//random number generator
             var random3 = Math.floor(1000 + Math.random() * 9000);//random number generator
             var random4 = Math.floor(1000 + Math.random() * 9000);//random number generator
             var pack_id="<%out.print(pack_id);%>";
             var travel_date=$.trim($('#txttraveldate').val()) ;
            var url = "packbooking.jsp?adult=" + encodeURIComponent(random1+""+totalAdultPaxCount+""+random) + "&child=" + encodeURIComponent(random2+""+totalChildPaxCount+""+random) + "&total=" + encodeURIComponent(random3+""+grandTotal)+ "&roomno=" + encodeURIComponent(random4+""+roomno+""+random)+"&travel_date=" + encodeURIComponent(travel_date)+"&pack_id=" +pack_id ;
            window.location.href=url;
        	}
        }

        function toggleImage() {

            var $test = $('#divmodifysearch');
            if ($test.is(':visible'))
                $('.chng-ex').css('background-image', 'url("images/expand.png")');
            else
                $('.chng-ex').css('background-image', 'url("images/collapse.png")');
            $('#divmodifysearch').slideToggle();
        }
        $(function () {

        	/* $(window).load(function () {

                 $("#txtDateOfJourney").datepicker({
                    dateFormat: 'dd-mm-yy',
                    numberOfMonths: 1,
                    showAnim: 'fadeIn',
                    minDate: $('#hdnvalidfrom').val(),
                    maxDate: $('#hdnvalidto').val()

                }); */
                /* $("#txttraveldate").datepicker({
                    dateFormat: 'dd-mm-yy',
                    numberOfMonths: 1,
                    showAnim: 'fadeIn',
                    minDate: $('#hdnvalidfrom').val(),
                    maxDate: $('#hdnvalidto').val()


                }); 
                $('#txtDateOfJourney').val($('#hdnvalidfrom').val());
                $('#txttraveldate').val($('#hdnvalidfrom').val());
            	
            });*/
        });
        function updatepageprice() {
          fnSelectedPackage(0)
            
        }
    </script>
     <script type="text/javascript">
  $('#btn-inquiry').click(function() {
	  if($.trim($('#txtFullName').val()) .length==0)
	  {
  		  var full_name ='Name required';
  		  alert(full_name);
  		  $('#txtFullName').focus(); 
  	  }
	  else if($.trim($('#txtEmailID').val()) .length==0)
	  {
  		  var email ='Email required';
  		  alert(email);
  		  $('#txtEmailID').focus(); 
  	  }
	  else if($.trim($('#txtMobileNumber').val()) .length==0)
	  {
  		  var mobile1 ='Mobile no required';
  		  alert(mobile1);
  		  $('#txtMobileNumber').focus(); 
  	  }
	  else if($.trim($('#textDoj').val()) .length==0)
	  {
  		  var journey ='Journey date required';
  		  alert(journey);
  		  $('#textDoj').focus(); 
  	  }
	  else if($.trim($('#txtCityName').val()) .length==0)
	  {
  		  var txtCityName ='Cityname required';
  		  alert(txtCityName);
  		  $('#txtCityName').focus(); 
  	  }
	  else if($.trim($('#txtDuration').val()) .length==0)
	  {
  		  var txtDuration ='Duration required';
  		  alert(txtDuration);
  		  $('#txtDuration').focus(); 
  	  }
	  else if($.trim($('#txtMessage').val()) .length==0)
	  {
  		  var txtMessage ='Message required';
  		  alert(txtMessage);
  		  $('#txtMessage').focus(); 
  	  }
	  else{
		var fname=$.trim($('#txtFullName').val());
		var form= $("#inquiryForm");
		  $.ajax({
              type: "POST",
              url: "enquiryprocess.jsp",
              data: form.serialize(),
              //contentType: "application/json; charset=utf-8",
              //dataType: "json",
              success: function (data) {
            	  alert(fname+" "+'inquiry sent successfully');
            	  $('#inquiry').modal('hide');
            	
              },
              failure: function (data) {
            	  //$('#output_danger').html("Problem Occured");
              }
          });
		 
	  }
  });
  
  </script> 
  <script type="text/javascript">
  function dwnPdf(){
	  var trans_id=$('#trans_id').val();
	    var url = "print_ticket.jsp?trans_id=" + trans_id;
  	     $('#pdf').attr("href",url)
	}
  </script>
 
</body>
</html>