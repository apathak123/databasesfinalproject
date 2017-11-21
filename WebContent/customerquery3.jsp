<!-- added by harsh -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!-- end added by harsh -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin - Start Bootstrap Template</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav"> <a class="navbar-brand" href="index.jsp">BarBeerDrinker+</a>
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarResponsive"
		aria-controls="navbarResponsive" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<li class="nav-item" data-toggle="tooltip" data-placement="right"
				title="Dashboard"><a class="nav-link" href="index.jsp"> <i
					class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">Dashboard</span>
			</a></li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right"
				title="Tables"><a class="nav-link" href="tables.jsp"> <i
					class="fa fa-fw fa-table"></i> <span class="nav-link-text">Tables</span>
			</a></li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right"
				title="Charts"><a class="nav-link" href="charts.jsp"> <i
					class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Charts</span>
			</a></li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right"
				title="Components"><a
				class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
				href="#collapseComponents" data-parent="#exampleAccordion"> <i
					class="fa fa-fw fa-wrench"></i> <span class="nav-link-text">Components</span>
			</a>
				<ul class="sidenav-second-level collapse" id="collapseComponents">
					<li><a href="navbar.jsp">Navbar</a></li>
					<li><a href="cards.jsp">Cards</a></li>
				</ul></li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right"
				title="Example Pages"><a
				class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
				href="#collapseExamplePages" data-parent="#exampleAccordion"> <i
					class="fa fa-fw fa-file"></i> <span class="nav-link-text">Bar Queries</span>
			</a>
				<ul class="sidenav-second-level collapse" id="collapseExamplePages">
					<li><a href="barquery1.jsp">Bar Owner Query 1</a></li>
					<li><a href="barquery2.jsp">Bar Owner Query 2</a></li>
					<li><a href="barquery3.jsp">Bar Owner Query 3</a></li>
					<li><a href="customerquery1.jsp">Customer Query 1</a></li>
					<li><a href="customerquery2.jsp">Customer Query 2</a></li>
					<li><a href="customerquery3.jsp">Customer Query 3</a></li>
				</ul></li>
	
			<li class="nav-item" data-toggle="tooltip" data-placement="right"
				title="Example Pages"><a
				class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
				href="#collapseExamplePages" data-parent="#exampleAccordion"> <i
					class="fa fa-fw fa-file"></i> <span class="nav-link-text">Example
						Pages</span>
			</a>
				<ul class="sidenav-second-level collapse" id="collapseExamplePages">
					<li><a href="blank.jsp">Blank Page</a></li>
				</ul></li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right"
				title="Menu Levels"><a
				class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
				href="#collapseMulti" data-parent="#exampleAccordion"> <i
					class="fa fa-fw fa-sitemap"></i> <span class="nav-link-text">Menu
						Levels</span>
			</a>
				<ul class="sidenav-second-level collapse" id="collapseMulti">
					<li><a href="#">Second Level Item</a></li>
					<li><a href="#">Second Level Item</a></li>
					<li><a href="#">Second Level Item</a></li>
					<li><a class="nav-link-collapse collapsed"
						data-toggle="collapse" href="#collapseMulti2">Third Level</a>
						<ul class="sidenav-third-level collapse" id="collapseMulti2">
							<li><a href="#">Third Level Item</a></li>
							<li><a href="#">Third Level Item</a></li>
							<li><a href="#">Third Level Item</a></li>
						</ul></li>
				</ul></li>
			<li class="nav-item" data-toggle="tooltip" data-placement="right"
				title="Link"><a class="nav-link" href="#"> <i
					class="fa fa-fw fa-link"></i> <span class="nav-link-text">Link</span>
			</a></li>
		</ul>
		<ul class="navbar-nav sidenav-toggler">
			<li class="nav-item"><a class="nav-link text-center"
				id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
			</a></li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<form class="form-inline my-2 my-lg-0 mr-lg-2">
					<div class="input-group">
						<input class="form-control" type="text"
							placeholder="Search for..."> <span
							class="input-group-btn">
							<button class="btn btn-primary" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
			</li>
			<li class="nav-item"><a class="nav-link" data-toggle="modal"
				data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"></i>Logout
			</a></li>
		</ul>
	</div>
	</nav>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.jsp">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Blank Page</li>
      </ol>
      <div class="row">
        <div class="col-12">
 <!-- added by harsh -->

<h3>Query 3</h3>
want to know the cheapest beers from beers you like and places you frequent?<br/>
          enter in the following information!<br/>
      (use Jessica Martinez)<br/>

<form name="f3" method="get" action="#">
  First name:<br>
  <input type="text" name="given_name"><br>
  Last name:<br>
  <input type="text" name="surname"><br>
  <input type="submit" value="Submit">
</form> 
     <% String given_name3=request.getParameter("given_name");
     String surname3=request.getParameter("surname");
     out.print(given_name3+" "+surname3); %>     
          	<% 		  
     try{
    	//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			if (given_name3!=null)
			{
			String str = "SELECT Sells.beer_name, Sells.price_per_beer FROM Sells WHERE EXISTS( SELECT * FROM Likes WHERE Likes.given_name = \""+given_name3+"\" AND Likes.surname = \""+surname3+"\"AND Likes.beer_name = Sells.beer_name)ORDER BY Sells.price_per_beer ASC";
			//Run the query against the database.
			out.print("query being run: <br/>"+str);
			ResultSet result = stmt.executeQuery(str);
			//Make an HTML table to show the results in:
			%>
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<thead>
			<tr><td>beer_name</td><td>price_per_beer</td></tr>
			</thead>
			<tbody>
		<% while (result.next()) 
		{%>
			<tr>
			<td><%out.print(result.getString("beer_name")); %></td>
			<td><%out.print(result.getString("price_per_beer")); %></td>
			</tr>
		
		<%}%>
		</tbody>
		</table>
			<%}
			else out.print("names were null! no table compiled");
				%>
		<% 			//close the connection.
		db.closeConnection(con);
     }catch (Exception e) {
			out.print(e);
			out.print("an error occured");
		}
      %>

<h4>End Of Query 3</h4>

        </div>
      </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright � Your Website 2017</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">�</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.jsp">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
  </div>
</body>

</html>