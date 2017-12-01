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
<title>BarBeerDrinker+e</title>
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
				<li class="breadcrumb-item active">Customer Query 1</li>
			</ol>
			<div class="row">
				<div class="col-12">
					<h3>Query 1</h3>
					Our website has data on reviews for each bar, Drinkers want to go to the best bars whenever possible, <br>
					so we have provided you with the 5 highest ranked bars that you frequent.<br>
					<br>
					(Unfortunately, because we have 3 primary keys, a drop down is not viable since the forms get reset every time the page is reloaded. <br>
					I tested this by making the drop down of all possible first names, having the user select one, then generating all the possible middle names, selecting the middle name, then generating all the possible last names, then finally putting them together. <br>
					This would not work because after the possible middle names are generated, the first name is reset to null by the page and we could not store it without it being overwritten by null.) <br>
					<br>
					Want to see the top 5 ranked bars by reviews that you frequent?<br />
					Enter in the following information(use joel G Alvarado)!<br />

					<form name="f1" method="get" action="#">
						First name:<br> <input type="text" name="given_name"><br>
						Middle name:<br> <input type="text" name="middle_initial"><br>
						Last name:<br> <input type="text" name="surname"><br>
						<input type="submit" value="Submit">
					</form>
					<%
						String given_name = request.getParameter("given_name");
						String middle_initial = request.getParameter("middle_initial");
						String surname = request.getParameter("surname");
						out.print(given_name + " " + middle_initial + " " + surname);
					%>
					<%
						try {
							//Get the database connection
							ApplicationDB db = new ApplicationDB();
							Connection con = db.getConnection();
							Statement stmt = con.createStatement();
							if (given_name != null) {
								String str = "select Barranks.rank,Barranks.name,Barranks.number_of_reviews,Barranks.average_reviewer_reputation,Barranks.average_review, Barranks.score from Frequents, Barranks where Frequents.given_name=\""
										+ given_name
										+ "\" and Frequents.middle_initial=\""
										+ middle_initial
										+ "\" and Frequents.surname=\""
										+ surname
										+ "\" and Frequents.bar_name=Barranks.name order by Barranks.rank ASC limit 5";
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