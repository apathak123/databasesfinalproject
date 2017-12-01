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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>BarBeerDrinker+</title>
<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="index.jsp">BarBeerDrinker+</a>
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
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Patterns</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Components"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseComponents" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-wrench"></i> <span class="nav-link-text">Components</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents">
						<li><a href="navbar.jsp">Navbar</a></li>
					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Example Pages"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseExamplePages" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-file"></i> <span class="nav-link-text">Bar
							Queries</span>
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
					title="Menu Levels"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseMulti" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-sitemap"></i> <span class="nav-link-text">Inserting
							into Tables </span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseMulti">
						<li><a href="insertion1.jsp">Insertion 1</a></li>
						<li><a href="insertion2.jsp">Insertion 2</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
				<li class="breadcrumb-item active">Bar Query 1</li>
			</ol>
			<div class="row">
				<div class="col-12">
					<!-- added by harsh -->

					<h3>Bar Query 1</h3>
					want to know people in your state that dont frequent your bar?<br />
					enter in the following information!<br /> (use Rebel Moustache Inn)<br />

					<form name="f4" method="get" action="#">
						Bar name:<br> <input type="text" name="bar_name"><br>
						<input type="submit" value="Submit">
					</form>
					<%
						String bar_name = request.getParameter("bar_name");
						out.print(bar_name);
					%>
					<%
						try {
							//Get the database connection
							ApplicationDB db = new ApplicationDB();
							Connection con = db.getConnection();
							Statement stmt = con.createStatement();
							if (bar_name != null) {
								String str = "select d1.given_name, d1.middle_initial, d1.surname, d1.street_address,d1.city,d1.state,d1.zipcode,d1.email_address,d1.telephone_number from Drinker d1 where exists ( select * from Bar where Bar.bar_name= \""
										+ bar_name
										+ "\" and Bar.state=d1.state) and not exists (select * from  Frequents f2 where d1.given_name=f2.given_name and d1.middle_initial=f2.middle_initial and d1.surname=f2.surname and f2.bar_name=\""
										+ bar_name + "\")";
								//Run the query against the database.
								out.print("query being run: <br/>" + str);
								ResultSet result = stmt.executeQuery(str);
								//Make an HTML table to show the results in:
					%>
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-table"></i> Data Table Example
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<td>given_name</td>
											<td>middle_initial</td>
											<td>surname</td>
											<td>street_address</td>
											<td>city</td>
											<td>state</td>
											<td>zipcode</td>
											<td>email_address</td>
											<td>telephone_number</td>
										</tr>
									</thead>
									<tbody>
										<%
											while (result.next()) {
										%>
										<tr>
											<td>
												<%
													out.print(result.getString("given_name"));
												%>
											</td>
											<td>
												<%
													out.print(result.getString("middle_initial"));
												%>
											</td>
											<td>
												<%
													out.print(result.getString("surname"));
												%>
											</td>
											<td>
												<%
													out.print(result.getString("street_address"));
												%>
											</td>
											<td>
												<%
													out.print(result.getString("city"));
												%>
											</td>
											<td>
												<%
													out.print(result.getString("state"));
												%>
											</td>
											<td>
												<%
													out.print(result.getString("zipcode"));
												%>
											</td>
											<td>
												<%
													out.print(result.getString("email_address"));
												%>
											</td>
											<td>
												<%
													out.print(result.getString("telephone_number"));
												%>
											</td>
										</tr>

										<%
											}
										%>
									</tbody>
								</table>

							</div>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
				<%
					} else
							out.print("names were null! no table compiled");
				%>
				<%
					//close the connection.
						db.closeConnection(con);
					} catch (Exception e) {
						out.print(e);
						out.print("an error occured");
					}
				%>
			</div>
		</div>
	</div>
	<!-- /.container-fluid-->
	<!-- /.content-wrapper-->
	<footer class="sticky-footer">
		<div class="container">
			<div class="text-center">
				<small>Copyright © Akanksha & Harsh Bar Beer Drinker Plus
					2017</small>
			</div>
		</div>
	</footer>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
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