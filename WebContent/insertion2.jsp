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
<title>SB Admin - Start Bootstrap Template</title>
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
				<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
				<li class="breadcrumb-item active">Insertion 2</li>
			</ol>
			<div class="row">
				<div class="col-12">

					<h3>Insert into Beer table</h3>
					<p>
						(use BeerName= 'Aguila' and Manufactures= 'MillerCoors' if you
						want to insert an already existing primary key)<br>
						(duplicate values of primary keys Beername and Manufactures will
						be stopped from inserting by constraints)<br>
					</p>
					<form name="f9" method="get" action="#">
						<h5>
							Beer name:<br>
						</h5>
						<input type="text" name="beer_name"><br>
						<h5>
							manufactures:<br>
						</h5>
						<input type="text" name="manufactures"><br>
						<h5>
							price_per_beer:<br>
						</h5>
						<input type="number" step="0.01" name="price_per_beer"><br>
						<input type="submit" value="Submit">
					</form>
					<%
						String beer_name = request.getParameter("beer_name");
						String manufactures = request.getParameter("manufactures");
						String price_per_beer = request.getParameter("price_per_beer");
						out.print("to be inserted: " + beer_name + " " + manufactures + " "
								+ price_per_beer + "<br>");
					%>
					<%
						try {
							//Get the database connection
							ApplicationDB db = new ApplicationDB();
							Connection con = db.getConnection();
							Statement stmt = con.createStatement();
							if (beer_name != null && manufactures != null
									&& price_per_beer != null) {
								String str = "SELECT COUNT(*) as cnt FROM Beer where beer_name='"
										+ beer_name
										+ "' and manufactures='"
										+ manufactures
										+ "'";
								ResultSet result = stmt.executeQuery(str);
								result.next();
								int beerexists = result.getInt("cnt");
								if (beerexists > 0) {
									out.print("primary keys beer_name and manufactures already exist in the table. insertion terminated <br>");
								} else {
									str = "SELECT COUNT(*) as cnt FROM Beer";
									result = stmt.executeQuery(str);
									result.next();
									int countbeers = result.getInt("cnt");

									//Make an insert statement for the Sells table:
									String insert = "INSERT INTO Beer(beer_name, manufactures, price_per_beer)"
											+ "VALUES (?, ?,?)";
									//Create a Prepared SQL statement allowing you to introduce the parameters of the query
									PreparedStatement ps = con.prepareStatement(insert);

									//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
									double pricedoub = Double.valueOf(price_per_beer);
									ps.setString(1, beer_name);
									ps.setString(2, manufactures);
									ps.setDouble(3, pricedoub);
									//Run the query against the DB
									ps.executeUpdate();

									str = "SELECT COUNT(*) as cnt FROM Beer";
									result = stmt.executeQuery(str);
									result.next();
									int countbeern = result.getInt("cnt");
									db.closeConnection(con);
									int updatebeer = (countbeers != countbeern) ? 1 : 0;

									if (updatebeer > 0)
										out.print("insert succeeded");
									else
										out.print("insertion didn't succeed");
								}
							} else
								out.print("one of the values was null. stopped insertion");
					%>
					<%
						//close the connection.
						} catch (Exception e) {
							out.print(e);
							out.print("insertion failed");
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