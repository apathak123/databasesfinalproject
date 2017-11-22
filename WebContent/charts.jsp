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
				<li class="breadcrumb-item active">Patterns</li>
			</ol>
			<p>
				<b>Frequents Table Pattern:</b> All the states that the drinker is
				from match up to the bars that he/she frequents
			<p>Query being run: select count(given_name) as tuples from
				Frequents where drinker_state<>bar_state; Result is: 0</p>
			<p>There are no tuples where drinker_state is different than the
				bar_state</p>
			</p>
			<p>
				<b>Bar Table Pattern:</b> All bars sell their beers for more than
				the manufacturing price
			<p>Query being run: SELECT count(s1.beer_name) as tuples FROM
				Beer b1, Sells s1 WHERE s1.beer_name=b1.beer_name and
				s1.price_per_beer<=b1.price_per_beer; Result is: 0</p>
			<p>There are no tuples where bar price was less than or equal to
				manufacture price</p>
			</p>

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
					//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
					String str = "select count(given_name) as tuples from Frequents where drinker_state<>bar_state; ";
					//Run the query against the database.
					out.print("Query being run: " + str + "<br/>");
					ResultSet result = stmt.executeQuery(str);
					//Make an HTML table to show the results in:
					result.next();
					out.print("result is: " + result.getString("tuples") + "<br/>");

					if (Integer.parseInt(result.getString("tuples")) == 0)
						out.print("there are no tuples where drinker_state is different than the bar_state");
					else
						out.print("there were tuples where the drinker state was different than the bar state ");
			%>
			<%
				//close the connection.
					db.closeConnection(con);
				} catch (Exception e) {
					out.print(e);
					out.print("an error occured");
				}
			%>

			<br /> Bar table pattern: <br /> All bars sell their beers for more
			than the manufacturing price<br />
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
					//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
					String str = "SELECT count(s1.beer_name) as tuples FROM Beer b1, Sells s1 WHERE s1.beer_name=b1.beer_name and s1.price_per_beer<=b1.price_per_beer;";
					//Run the query against the database.
					out.print("Query being run: " + str + "<br/>");
					ResultSet result = stmt.executeQuery(str);
					//Make an HTML table to show the results in:
					result.next();
					out.print("result is: " + result.getString("tuples") + "<br/>");

					if (Integer.parseInt(result.getString("tuples")) == 0)
						out.print("there are no tuples where bar price was less than or equal to manufacture price");
					else
						out.print("there were tuples where tuples where bar price was less than or equal to manufacture price");
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
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		<footer class="sticky-footer">
			<
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
		<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Page level plugin JavaScript-->
		<script src="vendor/chart.js/Chart.min.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin.min.js"></script>
		<!-- Custom scripts for this page-->
		<script src="js/sb-admin-charts.min.js"></script>
		<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
		<div>
		<p></p>
			<p>
				<b>This graph shows the difference between the prices of the
					beers when sold by the manufacturers and the prices of those same
					beers then sold by the bars. The beers sold by the bars are the
					average amount because each bar sells the beers at a different
					price. Either way it is possible to evidently tell that the prices
					sold by the bars are approximately 2.5-3 times the prices that the
					manufacturers sold them to the bars.</b>
			</p>
			<a
				href="https://plot.ly/~AkankshaPathak/4/?share_key=rxQuKWnZwvnErtqf28WrD2"
				target="_blank" title="Beer Price"
				style="display: block; text-align: center;"><img
				src="https://plot.ly/~AkankshaPathak/4.png?share_key=rxQuKWnZwvnErtqf28WrD2"
				alt="Beer Price" style="max-width: 100%; width: 600px;" width="600"
				onerror="this.onerror=null;this.src='https://plot.ly/404.png';" /></a>
			<script data-plotly="AkankshaPathak:4"
				sharekey-plotly="rxQuKWnZwvnErtqf28WrD2"
				src="https://plot.ly/embed.js" async></script>
			<p>
				<b>This graph shows the average salaries of the various
					occupations that are present in this data. While it is not possible
					to see the salary of each occupation on this graph, the purpose is
					to highlight the bell curve to show that the data is well
					distributed and that majority of the participants lie in the bell
					of the curve.</b>
			</p>
			<a
				href="https://plot.ly/~AkankshaPathak/1/?share_key=00ONyQfeVWCLkNuV9CSOiS"
				target="_blank" title="Plot 1"
				style="display: block; text-align: center;"><img
				src="https://plot.ly/~AkankshaPathak/1.png?share_key=00ONyQfeVWCLkNuV9CSOiS"
				alt="Plot 1" style="max-width: 100%; width: 600px;" width="600"
				onerror="this.onerror=null;this.src='https://plot.ly/404.png';" /></a>
			<script data-plotly="AkankshaPathak:1"
				sharekey-plotly="00ONyQfeVWCLkNuV9CSOiS"
				src="https://plot.ly/embed.js" async></script>
		</div>
</body>
</html>
