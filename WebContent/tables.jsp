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
<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
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
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">Tables</li>
			</ol>
			<p>On this page, you can see the tables that exist within the
				BarBeerDrinker+ Database. To operate, click on the drop down menu
				and select the table that you wish to see, and then press the select
				table button.</p>
			<form name="f1" method="get" action="#">
				<select name="disptable">
					<option>Averagesalaryperoccupation</option>
					<option>Bar</option>
					<option>Barranks</option>
					<option>Barreviewers</option>
					<option>Barreviews</option>
					<option>Beer</option>
					<option>Drinker</option>
					<option>Frequents</option>
					<option>Likes</option>
					<option>Numberofbeerstillbloodalcohollevel</option>
					<option>Sells</option>
				</select> <input type="submit" name="submit" value="Select Table" />
			</form>

			<%
				try {
					//Get the database connection
					ApplicationDB db = new ApplicationDB();
					Connection con = db.getConnection();
					if (con != null)
						out.print(" connection made to database! <br/>");
					else
						out.print("connection with the database wasn't made :( <br/>");
					//Create a SQL statement
					Statement stmt = con.createStatement();
					//Get the selected button from above 
					String entity = request.getParameter("disptable");
					if (entity == null)
						entity = "Averagesalaryperoccupation";
					//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
					String str = "SELECT * FROM " + entity;
					//Run the query against the database.
					out.print("query being run: <br/>" + str);
					ResultSet result = stmt.executeQuery(str);
					//Make an HTML table to show the results in:
			%>

			<!-- Example DataTables Card-->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-table"></i> Data Table Example
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<%-- To display selected value from dropdown list. --%>
							<%
								if (entity.equals("Averagesalaryperoccupation")) {
							%>
							<thead>
								<tr>
									<td>
										<%
											out.print("occupation");
										%>
									</td>
									<td>
										<%
											out.print("average_salaries");
										%>
									</td>
								</tr>
							</thead>
							<tbody>
								<%
									while (result.next()) {
								%>
								<tr>
									<td>
										<%
											out.print(result.getString("occupation"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("average_salaries"));
										%>
									</td>
								</tr>

								<%
									}
								%>
							</tbody>
							<%
								} else if (entity.equals("Bar")) {
							%>
							<thead>
								<tr>
									<td>bar_name</td>
									<td>street_address</td>
									<td>city</td>
									<td>state</td>
									<td>state_full</td>
									<td>zipcode</td>
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
											out.print(result.getString("bar_name"));
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
											out.print(result.getString("state_full"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("zipcode"));
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
							<%
								} else if (entity.equals("Barranks")) {
							%>
							<thead>
								<tr>
									<td>rank</td>
									<td>name</td>
									<td>number_of_reviews</td>
									<td>average_reviewer_reputation</td>
									<td>average_review</td>
									<td>score</td>
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
											out.print(result
																.getString("average_reviewer_reputation"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("average_review"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("score"));
										%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} else if (entity.equals("Barreviewers")) {
							%>
							<thead>
								<tr>
									<td>name</td>
									<td>number_of_reviews_written</td>
									<td>reputation score</td>
								</tr>
							</thead>
							<tbody>
								<%
									while (result.next()) {
								%>
								<tr>
									<td>
										<%
											out.print(result.getString("name"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("number_of_reviews_written"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("reputation_score"));
										%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} else if (entity.equals("Barreviews")) {
							%>
							<thead>
								<tr>
									<td>review_index</td>
									<td>reviewer_name</td>
									<td>reviewer_reputation</td>
									<td>bar_name</td>
									<td>review_score</td>
								</tr>
							</thead>
							<tbody>
								<%
									while (result.next()) {
								%>
								<tr>
									<td>
										<%
											out.print(result.getString("review_index"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("reviewer_name"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("reviewer_reputation"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("bar_name"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("review_score"));
										%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} else if (entity.equals("Beer")) {
							%>
							<thead>
								<tr>
									<td>beer_name</td>
									<td>manufactures</td>
									<td>price_per_beer</td>
								</tr>
							</thead>
							<tbody>
								<%
									while (result.next()) {
								%>
								<tr>
									<td>
										<%
											out.print(result.getString("beer_name"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("manufactures"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("price_per_beer"));
										%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} else if (entity.equals("Drinker")) {
							%>
							<thead>
								<tr>
									<td>number</td>
									<td>gender</td>
									<td>name_set</td>
									<td>given_name</td>
									<td>middle_initial</td>
									<td>surname</td>
									<td>street_address</td>
									<td>city</td>
									<td>state</td>
									<td>state_full</td>
									<td>zipcode</td>
									<td>country_full</td>
									<td>email_address</td>
									<td>telephone_number</td>
									<td>birthday</td>
									<td>age</td>
									<td>national_ID</td>
									<td>occupation</td>
									<td>company</td>
									<td>pounds</td>
								</tr>
							</thead>
							<tbody>
								<%
									while (result.next()) {
								%>
								<tr>
									<td>
										<%
											out.print(result.getString("number"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("gender"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("name_set"));
										%>
									</td>
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
											out.print(result.getString("state_full"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("zipcode"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("country_full"));
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
									<td>
										<%
											out.print(result.getString("birthday"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("age"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("national_ID"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("occupation"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("company"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("pounds"));
										%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} else if (entity.equals("Frequents")) {
							%>
							<thead>
								<tr>
									<td>given_name</td>
									<td>middle_initial</td>
									<td>surname</td>
									<td>drinker_state</td>
									<td>bar_name</td>
									<td>bar_state</td>
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
											out.print(result.getString("drinker_state"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("bar_name"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("bar_state"));
										%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} else if (entity.equals("Likes")) {
							%>
							<thead>
								<tr>
									<td>given_name</td>
									<td>surname</td>
									<td>beer_name</td>
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
											out.print(result.getString("surname"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("beer_name"));
										%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} else if (entity.equals("Numberofbeerstillbloodalcohollevel")) {
							%>
							<thead>
								<tr>
									<td>gender</td>
									<td>weight</td>
									<td>number_of_beers_to_have</td>
									<td>number_of_beers_rounded</td>
								</tr>
							</thead>
							<tbody>
								<%
									while (result.next()) {
								%>
								<tr>
									<td>
										<%
											out.print(result.getString("gender"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("weight"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("number_of_beers_to_have"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("number_of_beers_rounded"));
										%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} else if (entity.equals("Sells")) {
							%>
							<thead>
								<tr>
									<td>bar_name</td>
									<td>beer_name</td>
									<td>price_per_beer</td>
								</tr>
							</thead>
							<tbody>
								<%
									while (result.next()) {
								%>
								<tr>
									<td>
										<%
											out.print(result.getString("bar_name"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("beer_name"));
										%>
									</td>
									<td>
										<%
											out.print(result.getString("price_per_beer"));
										%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} else
										out.print("no table was selected");
							%>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</div>
		</div>
		<%
			//close the connection.
				db.closeConnection(con);
			} catch (Exception e) {
				out.print(e);
				out.print("an error occured");
			}
		%>
		<!-- end added by harsh -->
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
		<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Page level plugin JavaScript-->
		<script src="vendor/datatables/jquery.dataTables.js"></script>
		<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin.min.js"></script>
		<!-- Custom scripts for this page-->
		<script src="js/sb-admin-datatables.min.js"></script>
	</div>
</body>

</html>
