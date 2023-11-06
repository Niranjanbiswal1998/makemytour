<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="travel.DBConnection,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link rel="stylesheet" href="css/jquery-ui.css">
  

  <!-- Custom styles for this template-->
  <link href="css/bootstrap.css" rel="stylesheet">
  <style type="text/css">
  #invoice{
    padding: 30px;
}

.invoice {
    position: relative;
    background-color: #FFF;
    min-height: 680px;
    padding: 15px
}

.invoice header {
    padding: 10px 0;
    margin-bottom: 20px;
    border-bottom: 1px solid #3989c6
}

.invoice .company-details {
    text-align: right
}

.invoice .company-details .name {
    margin-top: 0;
    margin-bottom: 0
}

.invoice .contacts {
    margin-bottom: 20px
}

.invoice .invoice-to {
    text-align: left
}

.invoice .invoice-to .to {
    margin-top: 0;
    margin-bottom: 0
}

.invoice .invoice-details {
    text-align: right
}

.invoice .invoice-details .invoice-id {
    margin-top: 0;
    color: #3989c6
}

.invoice main {
    padding-bottom: 50px
}

.invoice main .thanks {
    margin-top: -100px;
    font-size: 2em;
    margin-bottom: 50px
}

.invoice main .notices {
    padding-left: 6px;
    border-left: 6px solid #3989c6
}

.invoice main .notices .notice {
    font-size: 1.2em
}
.invoice-title h2, .invoice-title h3 {
    display: inline-block;
}


.invoice footer {
    width: 100%;
    text-align: center;
    color: #777;
    border-top: 1px solid #aaa;
    padding: 8px
    }
/* .table > tbody > tr > .no-line {
    border-top: none;
}

.table > thead > tr > .no-line {
    border-bottom: none;
}

.table > tbody > tr > .thick-line {
    border-top: 2px solid;
} */

@media print {
    .invoice {
        font-size: 11px!important;
        overflow: hidden!important
    }

    .invoice footer {
        position: absolute;
        bottom: 10px;
        page-break-after: always
    }

    .invoice>div:last-child {
        page-break-before: always
    }
}
  
  </style>
</head>
<body>
<% 
String trans_id=request.getParameter("trans_id");
/* Stringtrans_id="1586307711625"; */
try{ 
	
    Connection con= new DBConnection().Connect(); 
    String sql="select b.booking_id,b.travel_date,b.cust_name,b.mobile,b.email,b.address,b.room_type,b.room_no,b.adult_no,b.children_no,b.grand_total_price,b.status,p.payment_id,p.trans_id,p.payment_type,p.cardhld_name,p.card_no,p.expiry_date,p.cvv_no,p.status,pk.pack_name,pk.pack_price,pk.pic1Path,pk.pic2Path,pk.pic3Path from tbl_booking b inner join tbl_payment p inner join tbl_package pk on b.booking_id=p.fk_booking_id and pk.pack_id=b.fk_pack_id where p.trans_id="+trans_id+"";
    PreparedStatement ps=con.prepareStatement(sql);   
    ResultSet rs=ps.executeQuery();  
    while(rs.next()){  
     String booking_id=rs.getString(1);   
     String travel_date=rs.getString(2);
     String cust_name=rs.getString(3);
     String mobile=rs.getString(4);
     String email=rs.getString(5);
     String address=rs.getString(6);
     int room_no=rs.getInt(8);
     int adult_no=rs.getInt(9);
     int child_no=rs.getInt(10);
     float grand_total=rs.getFloat(11);
     int payment_id=rs.getInt(13);
     String transid=rs.getString(14);
     String payment_type=rs.getString(15);
     String crdhld_name=rs.getString(16);
     String cardno=rs.getString(17);
     String expiry_date=rs.getString(18);
     int cvv_no=rs.getInt(19);
     String pay_status=rs.getString(20);
     
     String pack_name=rs.getString(21);
     String pack_price=rs.getString(22);
     String pic1=rs.getString(23);
     String pic2=rs.getString(24);
     String pic3=rs.getString(25);
     
     
%>
<div id="invoice" style="">
<div id="editor"></div>
  
       <div class="toolbar hidden-print">
     
        <div class="text-right">
            <button id="printInvoice" class="btn btn-info"><i class="fa fa-print"></i> Print</button>
            <button id="exportToPdf"class="btn btn-info"><i class="fa fa-file-pdf-o"></i> Export as PDF</button>
        
        </div>
        <hr>
    </div>
    
    
    
    
    
    <div class="invoice overflow-auto font-weight-bold" id="div-invoice" style="padding:40px;background-image:url(121.jpg);">
        <div style="min-width: 600px;border:3px solid black;padding:20px;">
            <header>
                <div class="row">
                    <div class="col">
                        <a target="_blank" href="https://opentechz.com">
                            <img src="img/Website-Transparent.png" data-holder-rendered="true" height=80px;/>
                            </a>
                    </div>
                      <div class="text-center text-danger"><h1>Confirm Token</h1></div>
                    <div class="col company-details">
                        <h5 class="name">
                            <a target="_blank" href="https://opentechz.com">
                           Opentechz Pvt Ltd
                            </a>
                        </h5>
                        <div>Krishna Garden, Phase-2,<br>Bhubaneswar,752001</div>
                        <div>(+91)7381584856</div>
                        <div>info@opentechz.com</div>
                    </div>
                </div>
            </header>
      
                <div class="row contacts">
                    <div class="col invoice-to">
                        <div class="text-info"><h5>INVOICE TO:</h5></div>
                        <h3 class="to"><%out.print(cust_name); %></h3>
                        <div class="address"><%out.print(address); %></div>
                        <div class="email"><a href="mailto:<%out.print(email);%>"><%out.print(email);%></a></div>
                    </div>
                    <div class="col invoice-details">
                        <h5 class="invoice-id">INVOICE NO:<%out.print(trans_id); %></h5>
                        <div class="date">Date of Invoice:<%= (new java.util.Date()).toLocaleString()%></div>
                        <!-- <div class="date">Due Date: 30/10/2018</div> -->
                        <%-- <div class="payment-status">Payment Status:<%out.print();%></div> --%>
                    </div>
                </div>
<div class="container-fluid">
<table class="table" id="table">

<tbody>
    <tr>
        <td><h5>Booking Details:</h5>
        
        <p>Package Name:<%out.print(pack_name);%></p>
        <p>Travel Date:<%out.print(travel_date); %></p>
           <p>No of Adult(Above 12 yrs):<%out.print(adult_no);%></p>
           <p>No of Child:<%out.print(child_no);%></p>
           <p>No of Room:<%out.print(room_no);%></p>
           <p>Room Type:Standard</p>
        </td>
		 
        <td><h5>Customer Details</h5> 
        <p>Customer Name:<%out.print(cust_name);%></p>
         <p>Mobile No:<%out.print(mobile); %></p>
         <p>Email Id:<%out.print(email); %></p>
         <%--  <p>Address:<%out.print(address); %></p> --%>
        </td>
        <td><h5>Payment Details:</h5>
        <p>Payment Status:<%out.print(pay_status);%></p>
         <p>Mode Of Payment:<%out.print(payment_type);%></p>
         <p>Card Holder Name:<%out.print(crdhld_name);%></p>
          <p>Card No:<%out.print(cardno);%></p>
          <p>Amount Paid:<%out.print(grand_total);%></p>
        </td>
    </tr>
    
   
    
    
    <tr >
    <td ></td>
    <td></td>
    <td>
    <p >Sub Total:<%out.print(grand_total);%></p>
	<p >GST:0.0%</p>
	<p style="border-top:3px solid red"><b class="text-danger">Grand Total:</b><%out.print(grand_total);%>(Ruppes only)</p>
    </td>
    
    </tr>
    
   
    
</tbody>
</table>
</div><br><br>
                <div class="thanks">Thank you!</div>
                <div class="notices">
                    <div class="text-danger">NOTICE:</div>
                    <div class="notice">A finance charge of 10% will be made on cancel Booking.</div>
                </div>
            </main>
            <footer>
                Invoice was created on a computer and is valid without the signature and seal.<br>
                  All right reserved Opentechz Pvt Ltd
            </footer>
        </div>
        <!--DO NOT DELETE THIS div. IT is responsible for showing footer always at the bottom-->
        <div></div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/jquery/jquery-ui.js"></script>
      <script type="text/javascript" src="./js/html2canvas.js"></script>
    <script type="text/javascript" src="./js/jsPdf.debug.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$('#printInvoice').click(function(){
	
    Popup($('.invoice')[0].outerHTML);
    function Popup(data) 
    {
        window.print();
        return true;
    }
});

</script>

  <script type="text/javascript">

      var downPdf = document.getElementById("exportToPdf");
      var cname="<%out.print(cust_name);%>";
      downPdf.onclick = function() {
          html2canvas(document.getElementById("div-invoice"), {
              onrendered:function(canvas) {
                  var pageData = canvas.toDataURL('image/jpeg', 1.0);
                  var pdf = new jsPDF('', 'pt', 'a4');
				  pdf.addImage(pageData, 'JPEG', 0, 0, 595.28, 592.28);
                  pdf.save(cname+'.pdf');
				
              }
          })
      }
    </script>
<%
    }    
   }catch(Exception e){System.out.println(e);}


%>
</body>
</html>