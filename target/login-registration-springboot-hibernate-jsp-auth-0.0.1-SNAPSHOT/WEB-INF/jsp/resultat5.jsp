<%@ page import="com.Springboot.example.service.DbServiceImpl" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

  <head>
  <script type="text/javascript">


function validerDate(){
alert(document.getElementById('dateDeb').value);
var dateDeb = document.getElementById('dateDeb').value;
document.querySelector('p.bleuu').textContent = document.getElementById('dateFin').value;
//S�lectionne le premier paragraphe du class bleuu du document et modifie son texte

};

</script>
  <style>
 h1 {
	color: red;
}
</style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

      <title>DWH Test Automatisation</title>


    <!-- Bootstrap -->
     <link href="<c:url value="/resources/vendors/bootstrap/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<c:url value="/resources/vendors/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="<c:url value="/resources/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"/>" rel="stylesheet">
    
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
        <!-- iCheck -->
    <link href="<c:url value="/resources/vendors/iCheck/skins/flat/green.css"/>" rel="stylesheet">
    
         <!-- Datatables -->
    <link href="<c:url value="/resources/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"/>" rel="stylesheet">
     <link href="<c:url value="/resources/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"/>" rel="stylesheet">
 
    <!-- Custom Theme Style -->
    <link href="<c:url value="/resources/build/css/custom.min.css"/>" rel="stylesheet">

  </head>

  <body  class="nav-md">

    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
           

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="<c:url value="/resources/images/a.png"/>" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>${pageContext.request.userPrincipal.name}</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
             <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu " class="toggled">
                  
                   <li>
                    <a><i class="fa fa-line-chart"></i>Manage KPIs/Requetes
                    <span class="fa fa-chevron-down"></span></a>
                     <ul class="nav child_menu" style="display: block;">
                       <li ><a href="listRequetes">List Requetes</a>
                       </li>
                       <li  ><a href="listKpis">List Kpis</a>
                        <li  ><a href="manage_kpi">Add Kpis & Requetes</a>
                       </li>
                    </ul>
                    </li>
                      <li>
                      <a ><i class="fa fa-database"></i>Manage Connection 
                      <span class="fa fa-chevron-down"></span></a>
                      <ul class="nav child_menu" style="display: block;">
                       <li ><a href="list">List Databases</a>
                       </li>
                       <li  ><a href="manage_connexion">add Database</a>
                       </li>
                    </ul>
                      </li>
                       <li>
                      <a><i class="fa fa-bolt"></i>Resultat
                       <span class="fa fa-chevron-down"></span></a>
                       <ul class="nav child_menu" style="display: block;">
                    <li  ><a href="resultat">Lanch Script</a>
                       <li ><a href="resultat5" > Vue Global</a>
                        <li><a href="resultat4" >Vue Details</a>
                       
                       </ul>
                      </li>
                </ul>
              </div>
              
              </div>

            </div>
            <!-- /sidebar menu -->

            
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <div class="nav toggle">
                  <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>
                <nav class="nav navbar-nav">
                <ul class=" navbar-right">
                  <li class="nav-item dropdown open" style="padding-left: 15px;">
                    <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                      <img src="<c:url value="/resources/images/img.jpg"/>" alt="">${pageContext.request.userPrincipal.name}
                    </a>
                    <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item"  href="javascript:;"> Profile</a>
                      
                    
                      <a class="dropdown-item"  href="/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                    </div>
                  </li>
  
                
                </ul>
              </nav>
            </div>
          </div>
        <!-- /top navigation -->
                <!-- page content -->
         <div class="right_col" role="main" >
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Manage KPIs</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5   form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Search</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>
          <div class="row">
              <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Resultat</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  
                  <h2>Download Data File</h2>
                  <form id="demo-form2" data-parsley-validate="" method="get" action ="Vue_detaille" class="form-horizontal form-label-left"   >

            <div class="row">
                          <div class="col-sm-12">
                       <div class="card-box table-responsive">

<!--       <table id="datatable-buttons" class="table table-striped table-bordered" style="width:100%"> -->
<!--                     <thead> -->
<!--                         <tr role="row"> -->
<!--                           <th>Name_kpi</th> -->
<!--                      <th>Seuil Kpi</th> -->
<!--                           <th >Seuil GAP</th> -->
<!--                           <th>Seuil Data Quality</th> -->
<!--                             </tr> -->
<!--                                    </thead> -->
<!--                                       <tbody> -->
<%--                                       <c:forEach items="${rslt}" var="u"> --%>
                                     
<!--                          <tr> -->
<%--                           <td>${u. getName_kpi()}</td>    --%>
<%--                          <td>${u.getSeuil()}</td> --%>
<%--                         <td>${u.getSeuil_gap()}</td> --%>
<%--                         <td>${u. getSeuil_dataQuality()}</td>  --%>
<!--                              </tr> -->
                        
<%--                          </c:forEach> --%>
<!--                       </tbody> -->
<!--                     </table> -->
                 

                               <table id="resultat2" class="table table-bordered" style="width:100%">
                      <thead>
                        <tr role="row">
                         <th></th>
                         <th>Date Deb</th>
                         <th>Date Fin</th>
                   <%--     <th>Date</th>--%>  
                          <th >Code_requete</th>
                          <th>Name_kpi</th>
                          <th>Total Kpi in DB1</th>
                          <th>Total Kpi in DB2</th>
                          <th> GAP</th>
                          <th> GAP %</th>
                          <th> Data Quality</th>
                            <th> Acceptation</th>
                          <%--  <th> Number Records <%= DbServiceImpl.getRecordById(Long.parseLong(request.getParameter("db1"))).getName()%></th>
                           <th> Number Records <%= DbServiceImpl.getRecordById(Long.parseLong(request.getParameter("db2"))).getName()%></th>--%>
                          <th> Number Records OK</th>
                          <th> Number Records Not OK</th>
                         <%--  <th> Not Found in  <%= DbServiceImpl.getRecordById(Long.parseLong(request.getParameter("db1"))).getName()%></th>
                          <th> Not Found in  <%= DbServiceImpl.getRecordById(Long.parseLong(request.getParameter("db2"))).getName()%></th>--%>
                          <th> Temps Exec</th>
                          <th> Date Exec</th> 
                       
                        </tr>
                      </thead>


                      <tbody>
                        <c:forEach items="${rslt}" var="u">
                        
                         <tr>
                          <td class="a-center ">
           <input type="checkbox" value="${u.getId()}" name="kpiss" class="flat" >
        
           </td>
              			<td>${u.getDateDeb()}</td>
              			<td>${u.getDateFin()}</td>
                       <%--  <td>${u.getDate()}</td>--%>  
                        <td>${u.getCode_requete()}</td>
                        <td>${u. getName_kpi()}</td>                       
                    	 <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${u.getVal_kpi1()}" /></td> 
                       	 <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${u.getVal_kpi2()}" /></td> 
<%--                        	 <td>${u.getVal_kpi1()}</td> --%>
<%--                          <td>${u.getVal_kpi2()}</td> --%>
                         <td>${u.getGap()} </td> 
                                <td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${u.getGAP_par_100()}" />% </td>
                         
<%--                          <td> ${u.getGAP_par_100()}% </td> --%>
                        <td>${u.getDataQualite()}% </td>
                        <td>${u.getAcceptation()} </td>
<%--                              <c:if test="${u.acceptation=='OK'}"> --%>
<%--                              <td> <span style='background-color:#00FF00;display:block;width:${u.getAcceptation()}%'>${u.acceptation}</span> </td> --%>
<%--                              </c:if> --%>
<%--                              <c:if test="${u.acceptation=='NotOk'}"> --%>

<%--                                  <td> <span style='background-color:#F88;display:block;width:${u.getAcceptation()}%'>${u.acceptation}</span> </td> --%>

<%--                              </c:if> --%>
<%--                              <c:if test="${u.acceptation=='OK partiel'}"> --%>
<%--                                  <td> <span style='background-color:#90EE90;display:block;width:${u.getAcceptation()}%'>${u.acceptation}</span> </td> --%>
<%--                              </c:if> --%>
                         <%--     <td>${u.getLoad1()}</td>
                         <td>${u.getLoad2()} </td> --%>
                          
                             <td>${u.getNbreRecordOk()} </td>
                              <td>${u.getNbreRecordNotOk()} </td>
                       <%--         <td>${u.getFoundDB1()} </td>
                                 <td>${u.getFoundDB2()} </td> --%>
                               <td>${u.getTempsExec()} Ms</td>
                               <td>${u.getDateExec()} </td> 
                         </tr>
                        
                         </c:forEach>
                      </tbody>
                    </table>
                  
   
                     </div>
                     </div>     
                        
 
                    </form>
                   
                  
                  </div>
                      
           $
                  </div>
                  </div>
                  
                  </div>
                  </div>
                 
         
 <!-- jQuery -->

    <script src="<c:url value="/resources/vendors/jquery/dist/jquery.min.js"/>"></script>
    <!-- Bootstrap -->

   <script src="<c:url value="/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"/>"></script>
    <!-- FastClick -->
    <script src="<c:url value="/resources/vendors/fastclick/lib/fastclick.js"/>"></script>
   
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="../vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- jQuery Sparklines -->
    <script src="../vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- morris.js -->
    <script src="../vendors/raphael/raphael.min.js"></script>
    <script src="../vendors/morris.js/morris.min.js"></script>
    <!-- gauge.js -->
    <script src="../vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- Skycons -->
    <script src="../vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="../vendors/Flot/jquery.flot.js"></script>
    <script src="../vendors/Flot/jquery.flot.pie.js"></script>
    <script src="../vendors/Flot/jquery.flot.time.js"></script>
    <script src="../vendors/Flot/jquery.flot.stack.js"></script>
    <script src="../vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="../vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="../vendors/DateJS/build/date.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

     <!-- iCheck -->
     <script src="<c:url value="/resources/vendors/iCheck/icheck.min.js"/>"></script>
       <!-- Datatables -->
    <script src="<c:url value="/resources/vendors/datatables.net/js/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/resources/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"/>"></script>
     <script src="<c:url value="/resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"/>"></script>
     <script src="<c:url value="/resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/vendors/datatables.net-buttons/js/buttons.flash.min.js"/>"></script>
        <script src="<c:url value="/resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"/>"></script>
      <script src="<c:url value="/resources/vendors/datatables.net-buttons/js/buttons.print.min.js"/>"></script>
      <script src="<c:url value="/resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"/>"></script>
     <script src="<c:url value="/resources/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"/>"></script>
     <script src="<c:url value="/resources/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"/>"></script>
     <script src="<c:url value="/resources/vendors/jszip/dist/jszip.min.js"/>"></script>

 <script src="<c:url value="/resources/vendors/pdfmake/build/pdfmake.min.js"/>"></script>
 <script src="<c:url value="/resources/vendors/pdfmake/build/vfs_fonts.js"/>"></script>
    <!-- jQuery Smart Wizard -->

     <script src="<c:url value="/resources/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"/>"></script>
 
    <!-- jQuery Tags Input -->
    <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
  
    <!-- Custom Theme Scripts -->
    <script src="<c:url value="/resources/build/js/custom.min.js"/>"></script>
    <!-- iCheck 1.0.1 -->
<script src="https://almsaeedstudio.com/themes/AdminLTE/plugins/iCheck/icheck.min.js"></script>
 <script src="<c:url value="/resources/js/tablefilter.js"/>"></script>


<script data-config="">

             var filtersConfig = {
        base_path: 'tablefilter/',
        col_0:'none',
        col_1:'select',
        col_2:'select',
        col_3: 'select',
        col_4: 'select',
        col_5: 'select',
        col_6: 'none',
        popup_filters: true,
        auto_filter: {
            delay: 1100 //milliseconds
        },
        alternate_rows: true,
        rows_counter: true,
        btn_reset: true,
        status_bar: true,
        msg_filter: 'Filtering...',
        col_widths:[
            '125px', '90px', '100px',
            '90px', '90px', '90px',
            '90px', '90px', '90px'
        ]
    };
    var tf = new TableFilter('resultat2', filtersConfig);
    tf.init();
    
    $(document).ready(function() {
        $('#resultat2').DataTable( {
            dom: 'Bfrtip',
            buttons: [
                
                'excelHtml5',
                
               
            ]
        } );
    } );

    </script>
</body>
</html>