<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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
				<li class="breadcrumb-item active">Customer Query 2</li>
			</ol>
			<div class="row">
				<div class="col-12">
					<h3>Query 2</h3>
					want to see the top 5 ranked bars by reviews in your state that you
					dont frequent?<br /> enter in the following information!<br />
					(use joel G Alvarado)<br />

					<p>query might take up to a minute to retrieve after pressing
						submit button. Please wait patiently</p>
					<form name="f2" method="get" action="#">
						First name:<br> <input type="text" name="given_name"><br>
						Middle name:<br> <input type="text" name="middle_initial"><br>
						Last name:<br> <input type="text" name="surname"><br>
						<input type="submit" value="Submit">
					</form>
					<%
						String given_name2 = request.getParameter("given_name");
						String middle_initial2 = request.getParameter("middle_initial");
						String surname2 = request.getParameter("surname");
						out.print(given_name2 + " " + middle_initial2 + " " + surname2);
					%>
					<%
						try {
							//Get the database connection
							ApplicationDB db = new ApplicationDB();
							Connection con = db.getConnection();
							Statement stmt = con.createStatement();
							if (given_name2 != null) {
								String str = "select rank,name,number_of_reviews, score, state from (select * from Barranks b1 , Bar bar1 where not exists (select * from Frequents f1 where f1.given_name=\""
										+ given_name2
										+ "\" and f1.middle_initial=\""
										+ middle_initial2
										+ "\" and f1.surname=\""
										+ surname2
										+ "\" and f1.bar_name=b1.name) and b1.name=bar1.bar_name) as barslinked where exists(select * from Frequents f2 where f2.given_name=\""
										+ given_name2
										+ "\" and f2.middle_initial=\""
										+ middle_initial2
										+ "\" and f2.surname=\""
										+ surname2
										+ "\"and f2.drinker_state=barslinked.state) order by rank ASC limit 5";
								//Run the query against the database.
								out.print("query being run: <br/>" + str);
								ResultSet result = stmt.executeQuery(str);
								//Make an HTML table to show the results in:
					%>
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<td>rank</td>
								<td>name</td>
								<td>number_of_reviews</td>
								<td>score</td>
								<td>state</td>
							</tr>
						</thead>
						<tbody>
							<%
								while (result.next()) {
							%>
							<tr>
								<td>
									<%
										out.print(result.getString("rank"));
									%>
								</td>
								<td>
									<%
										out.print(result.getString("name"));
									%>
								</td>
								<td>
									<%
										out.print(result.getString("number_of_reviews"));
									%>
								</td>
								<td>
									<%
										out.print(result.getString("score"));
									%>
								</td>
								<td>
									<%
										out.print(result.getString("state"));
									%>
								</td>
							</tr>

							<%
								}
							%>
						</tbody>
					</table>
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
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
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