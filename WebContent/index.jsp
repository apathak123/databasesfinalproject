<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">My Dashboard</li>
			</ol>
			<p>
				<b><center>Welcome to BarBeerDrinker+</center></b> Disclaimer: As
				you use this amazing tool, there will be error messages for the
				Queries and the Inserting Pages because of the dynamic forms that
				are present. As a result they will be updated and submitted once the
				forms have been correctly filled.</br> </p>
		</div>
		<center>
			<IMG SRC="beergif.gif">
		</center>
	</div>
	<!-- /.container-fluid-->
	<!-- /.content-wrapper-->
	<footer class="sticky-footer">
	<div class="container">
		<div class="text-center">
			<small>Copyright � Akanksha & Harsh Bar Beer Drinker Plus
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
	<script src="vendor/datatables/jquery.dataTables.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin.min.js"></script>
	<!-- Custom scripts for this page-->
	<script src="js/sb-admin-datatables.min.js"></script>
	<script src="js/sb-admin-charts.min.js"></script>
	</div>
</body>

</html>
