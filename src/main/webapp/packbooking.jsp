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

.fnl-trip-dtls {
    padding: 10px 1%;
    margin: 0;
    box-sizing: border-box;
    float: left;
    width: 98%;
    background:cyan;
   box-shadow:10px 10px yellow;
   margin-left:3px !important;  
}
.fnl-trip-dtls {
    margin-bottom: 19px;
    position: relative;
}
.f-t-d-img {
    float: left;
    width: 100px;
    height: 70px;
}
.fnl-trip-dtls-cnt {
    float: left;
    margin: 0 !important;
}
.fnl-trip-dtls-cnt {
    width: 85%;
    padding: 7px 0px 7px;
}
.fnl-trip-dtls-cnt {
    min-height: 50px;
    padding: 0 0 5px;
    text-align: left;
}
.fnl-trip-dtls-cnt li {
    float: left;
    line-height: 25px;
    list-style: none outside none;
    width: 38.33%;
    text-align: center;
    margin-top: 12px;
    font-weight: bold;
}

 fieldset 
	{
		border: 1px solid #ddd !important;
		margin: 10px;
		xmin-width: 0;
		padding: 10px !important;       
		position: relative;
		border-radius:4px;
		background-color:#f5f5f5;
		padding-left:10px!important;
	}	
	
		legend
		{
			font-size:14px;
			font-weight:bold;
			margin-bottom: 0px; 
			width: 95%; 
			border: 1px solid #ddd;
			border-radius: 4px; 
			padding: 10px 10px 10px 10px; 
			background-color: #ffffff;
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
   <%
String adult=request.getParameter("adult");
int fadult=Integer.parseInt(adult.substring(4, 5));
String child=request.getParameter("child");
int fchild=Integer.parseInt(child.substring(4, 5));
String roomno=request.getParameter("roomno");
int froomno=Integer.parseInt(roomno.substring(4, 5));
String total=request.getParameter("total");
float grandtotal=Float.parseFloat(total.substring(4));
String travel_date=request.getParameter("travel_date");
//out.println(adult.substring(4, 5));
%>
 <div class="col-md-7"style="background-color:#ebfff0;float:left;padding-top:20px;">
    <div class="row">
    <div class="row font-weight-bold" style="font-family:Lucida Calligraphy; font-size:20px;padding-left:30px; padding-top:10px;color:#09F">Package Details</div><br>
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
      <div class="fnl-trip-dtls">
                                    <span class="f-t-d-img" style="">
                                        <img src="<%out.print(packpic1);%>" id="ContentPlaceHolder1_packageImage" height="70" width="100">
                                    </span>
                                    <div class="fnl-trip-dtls-cnt" style="font-size: 14px;">
                                        <ul>
                                            <li style="padding-left: 15px;"><span id="ContentPlaceHolder1_lblPackageTitle" class="fnl-htl-name"></span>
											  <span id="package_name" class="htl-futrs"><% out.print(rs1.getString(4));%></span></li>
                                               <!--  <span id="ContentPlaceHolder1_lblroomtype" class="htl-futrs">Standard-TIRUPATI</span></li> -->
                                            <li style="width: 20%; padding-left: 15px;"><span id="ContentPlaceHolder1_lblcheckin" class="fnl-htl-frm"><%out.print(travel_date);%></span>

                                            </li>
                                            <li>
                                                <span class="ocupnc-fnl" id="ocupnc-fnl"></span>
                                               
                                                <span class="nm-rooms" id="nm-rooms"></span>
                                                <span id="ContentPlaceHolder1_lblNoofPax" style="display: none;"><%out.print(travel_date); %></span>Adult <span id="ContentPlaceHolder1_lblAdultPaxCount"><%out.print(fadult); %></span>
                                                ,Child <span id="ContentPlaceHolder1_lblChildPaxCount"><%out.print(fchild); %></span><span class="room-dtls">&nbsp;&nbsp;Room <span id="ContentPlaceHolder1_lblRoomCount"><%out.print(froomno); %></span>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                     <span class="pric-fnl pl-5 ml-5 font-weight-bold" id="pric-fnl"><b style="color:red;">Grand Total </b><%out.print(grandtotal); %></span>
                                    
                                </div>
      
      
       <section id="booking_form" style="width:800px;">
       <div id="output_success" class="bg-success font-weight-bold text-white"></div>
	  <div id="output_danger" class="bg-danger font-weight-bold"></div>
       <form id="frm_customer_details">
       <input type="hidden" id="packid" name="packid" value="<%out.print(pack_id);%>">
       <input type="hidden" id="adult" name="adult" value="<%out.print(fadult);%>">
       <input type="hidden" id="child" name="child" value="<%out.print(fchild);%>">
       <input type="hidden" id="room" name="room" value="<%out.print(froomno);%>">
       <input type="hidden" id="grandtotal" name="grandtotal" value="<%out.print(grandtotal);%>">
       <input type="hidden" id="travel_date" name="travel_date" value="<%out.print(travel_date);%>">
         <fieldset>  
            	
			<legend>Customer Details:</legend>
		  <div id="customer_details">  
			  <div class="row">
			  	<div class="col-md-6">
			  	  <div class="form-group">
                    <label for="cust_name">Customer's Name:</label>
                    <input type="text" class="form-control cust_name" id="cust_name" placeholder="Customer name..." name="cust_name">
                   </div>
			  	</div>
			  	<div class="col-md-6">
			  	  <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control email" id="email" placeholder="Email..." name="email">
                 </div>
			  	</div>
              </div>
              
              <div class="row">
			  	<div class="col-md-6">
			  	   <div class="form-group">
                    <label for="mobile">Mobile No:</label>
                    <input type="text" class="form-control mobile" id="mobile" placeholder="Mobile..." name="mobile">
                   </div>
			  	</div>
			  	<div class="col-md-6">
			  	  <div class="form-group">
                    <label for="alt_mobile">Alt Mobile No:</label>
                    <input type="text" class="form-control alt_mobile" id="alt_mobile" placeholder="Alt Mobile..." name="alt_mobile">
                  </div>
			  	</div>
              </div>
				<div class="row">
				 <div class="col-md-12">
			  	  <div class="form-group">
                    <label for="address">Address:</label><br>
                    <textarea rows="5" cols="" class="form-control address" id="address" name="address" placeholder="Enter Address ..."></textarea>
                  </div>
			  	 </div>
				</div>	
				
				<!-- <div class="form-group">
                    <label for="check_in">Check In:</label>
                    <input type="text" class="form-control check_in" id="checkin" placeholder="Check in..." name="checkin">
                </div>
                <div class="form-group">
                    <label for="check_out">Check Out:</label>
                    <input type="text" class="form-control check_out" id="check_out" placeholder="Check Out..." name="checkout">
                </div>
            </div> -->
            </div>
            <div class="bg-warning"><p>1.Remember Once Customer's form submitted,Never Edit option available.</p>
            <p>2. After Details submitted then do the payment to confirm booking.</p>
            </div>
         <div class="text-center">
	       <a href="#" id="btn_book_confirm" class="btn btn-danger text-center">Book Confirm</a>
	     </div>
		</fieldset>	
      </form>			
	
	<div id="payment"  style="display:none;" class="" >
	
	<form id="frm_payment">
		<fieldset >    	
		   <legend>Payment Section:</legend>
		   
		   <input type="hidden" id="trans_id" name="trans_id" >
		  <!--  <div class="bg-info">Only Debit /Credit Card Payment Available</div> -->
				<div class="form-group">
                  <label for="payment_type">Payment Type:</label>
                     <select class="form-control" id="payment_type" name="payment_type">
       					<option>Debit Card</option>
        				<option>Credit Card</option>
     				 </select>
               </div>
				<div class="row">
				   <div class="col-md-6">
				     <div class="form-group">
				     	<label for="cardhld_name">Card Holder's Name:</label>
                    	<input type="text" class="form-control cardhld_name" id="cardhld_name" placeholder="Card Holder name..." name="cardhld_name">
				     </div>
				   </div>
				   <div class="col-md-6">
				     <div class="form-group">
				     	<label for="card_no">Card Number:</label>
                    	<input type="text" class="form-control card_no" id="card_no" placeholder="Card Number..." name="card_no">
				     </div>
				   </div>
               </div>
               <div class="row">
				   <div class="col-md-6">
				     <div class="form-group">
				     	<label for="expiry_date">Card Expiry Date:</label>
                    	<input type="text" class="form-control expriry_date" id="expiry_date" placeholder="Expiry date..." name="expiry_date">
				     </div>
				   </div>
				   <div class="col-md-6">
				     <div class="form-group">
				     	<label for="cvv_no">Card CVV Number:</label>
                    	<input type="text" class="form-control cvv_no" id="cvv_no" placeholder="CVV No...Ex-123" name="cvv_no">
				     </div>
				   </div>
               </div>
               <div class="text-center">
	             <a href="#" id="btn_payment" class="btn btn-danger text-center">Pay Confirm</a>
	           </div>
		</fieldset>
		</form>	 
	</div>
				
</section>
    <div id="div_dwntoken"class="text-center" style="display:none;">

    <div><span class="font-weight-bold">Transaction Id:</span><span id='tid'></span></div>
    <div style="padding:20px;"><p style="font-color:red;"> Please keep this reference id for future.
    By which you can download Booked Ticket.
    If you want to download it now then click on Download </p> </div>
          <div class="text-center">
            <a href="#" target="_blank"class="btn btn-info" id="pdf">Download Ticket</a>
            <a href="category.jsp" class="btn btn-success">Booked Another</a>
          </div>
    </div>
   </div> 
   
</div>
<div class="col-md-2" style="background-color:#f5fffe">
<div>

<h3>Booking Details</h3>
<p><b>Package Name:</b><% out.print(rs1.getString(4));%></p>
<p><b>No of Adult:</b><% out.print(fadult);%></p>
<p><b>No of Child:</b><% out.print(fchild);%></p>
<p><b>No of Room:</b><% out.print(froomno);%></p>
<p><b>Package Price:</b><% out.print(rs1.getString(5));%><br><span>(price per person above 12 yr.)</span></p>
<p><b>Grand Total:</b><% out.print(grandtotal);%></p>



</div>
 <hr style="border-bottom:2px solid red">
  <div class="" id="">
    <h3>Why Book with us?</h3>
     <hr style="border-bottom:2px solid white">
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
$( function() {
    $( "#expiry_date" ).datepicker({
      dateFormat: 'dd-mm-yy',
      changeMonth: true,
      changeYear: true,
      minDate:0,
    });
  } );
</script>

  <script type="text/javascript">
  $('#btn_book_confirm').click(function() {
	  if($.trim($('#cust_name').val()) .length==0)
	  {
  		  var cust_name ='Customer name required';
  		  alert(cust_name);
  		  $('#cust_name').focus(); 
  	  }
	  else if($.trim($('#email').val()) .length==0)
	  {
  		  var email ='Email required';
  		  alert(email);
  		  $('#email').focus(); 
  	  }
	  else if($.trim($('#mobile').val()) .length==0)
	  {
  		  var mobile1 ='Mobile no required';
  		  alert(mobile1);
  		  $('#mobile').focus(); 
  	  }
	  else if($.trim($('#alt_mobile').val()) .length==0)
	  {
  		  var mobile2 ='Alt Mobile no required';
  		  alert(mobile2);
  		  $('#alt_mobile').focus(); 
  	  }
	  else if($.trim($('#address').val()) .length==0)
	  {
  		  var address ='Alt Mobile no required';
  		  alert(address);
  		  $('#address').focus(); 
  	  }
	  else{
		var cname=$.trim($('#cust_name').val());
		var form= $("#frm_customer_details");
		  $.ajax({
              type: "POST",
              url: "packbookingpro.jsp",
              data: form.serialize(),
              //contentType: "application/json; charset=utf-8",
              //dataType: "json",
              success: function (data) {
            	  $('#output_success').html(cname+" "+"your data saved successfully & we redirect to you Payment Section");
                      //alert("You will now be redirected.");
                     // window.location = "http://www.aspsnippets.com/";
            	    $('#payment').toggle('show', function() {
            	    	
					   $('#frm_customer_details').hide();
					   $('#cardlolder_name').focus(); 
					  });
              },
              failure: function (data) {
            	  $('#output_danger').html("Problem Occured");
              }
          });
		 
	  }
  });
  
  </script>  
  
  
  <script type="text/javascript">
  $('#btn_payment').click(function() {
	  var auto_id=new Date().getTime();
	   document.getElementById("trans_id").value=auto_id;
	   var trans_id=$('#trans_id').val();
	  if($.trim($('#cardhld_name').val()) .length==0)
	  {
  		  var cardhld_name ='Card Holdername required';
  		  alert(cardhld_name);
  		  $('#cardhld_name').focus(); 
  	  }
	  
	  else if($.trim($('#card_no').val()) .length==0)
	  {
  		  var card_no ='Card no required';
  		  alert(card_no);
  		  $('#card_no').focus(); 
  	  }
	 
	  else if($.trim($('#expiry_date').val()) .length==0)
	  {
  		  var expiry_date ='Expiry date required';
  		  alert(expiry_date);
  		  $('#expiry_date').focus(); 
  	  }
	  else if($.trim($('#cvv_no').val()) .length==0)
	  {
  		  var cvv_no ='CVV required';
  		  alert(cvv_no);
  		  $('#cvv_no').focus(); 
  	  }
	  else{
		//var cname=$.trim($('#expiry_date').val());
		var form2= $("#frm_payment");
		  $.ajax({
              type: "POST",
              url: "payment_bookingpro.jsp",
              data: form2.serialize(),
              //contentType: "application/json; charset=utf-8",
              //dataType: "json",
              success: function (data) {
            	  $('#output_success').html("Payment done.Your booking confirmed. Download your Ticket");
            	     $('#frm_payment').hide();
            	     //var customer_name= $('');cardhld_name
            	     $('#div_dwntoken').show();
               	     $('#tid').html(trans_id);
               	     var url = "print_ticket.jsp?trans_id=" + trans_id;
               	     $('#pdf').attr("href",url)
               	     //window.location.href=url;
               			  //alert("You will now be redirected.");
                     // window.location = "http://www.aspsnippets.com/";
            	   /*  $('#payment').toggle('show', function() {
            	    	
					   $('#frm_customer_details').hide();
					   $('#cardlolder_name').focus(); 
					  }); */
					  //alert(data);
              },
              failure: function (data) {
            	  $('#output_danger').html("Problem Occured !!!");
              }
          });
		 
	  }
  });
  
  </script>  
  <!-- <script type="text/javascript"> var auto_id=new Date().getTime();
		   document.getElementById("trans_id").value=auto_id;
  </script>   -->
</body>
</html>