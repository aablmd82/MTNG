<!DOCTYPE html>
<html>
<head>
<title>MTNG Spring MVC</title>
<style type="text/css">
</style>
<spring:url value="/resources/index.js" var="indexJS" />
<script src="${indexJS}"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<link rel="stylesheet"
	href="https://getbootstrap.com/dist/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/Footer-Dark.css">
<link rel="stylesheet" href="./resources/css/Header-Blue.css">
<link rel="stylesheet" href="./resources/css/styles.css">
<link rel="stylesheet" href="./resources/fonts/font-awesome.min.css">
<link rel="stylesheet" href="./resources/fonts/ionicons.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">

<!-- Finish adding tags -->


<script src="https://unpkg.com/jquery"></script>

<script>
	function getPoll() {
		alert('Inside getPoll js function');
		// Send the request
		$
				.ajax({
					url : "http://localhost:8080/MTNG/getPoll",
					type : 'GET',
					// dataType for returning objects to json from java
					dataType : 'json',
					success : function(data) {
						alert("Name : " + data.name + ", : Location : "
								+ data.location);
					},
					error : function(data, status, er) {
						alert("error: " + data + " status: " + status + " er:"
								+ er);
					}
				});
	};
</script>

</head>
<body>
	<!--
	<br>
	<div style="text-align: center">
		<h2>
			Hello, this is the MTNG sample page.<br> <br>
		</h2>
		<input type="button" value="Create Poll" onclick="location.href='http://localhost:8080/MTNG/createPoll'">
	</div>
	<form action="${pageContext.servletContext.contextPath}/goToPoll"
		method="GET">
		<br>  <br><br><br> <input type="button" value="Get Poll" onclick="getPoll();">
	</form>
	<!--  <a href="${pageContext.servletContext.contextPath}/jsp/welcome.jsp">Click here to create a poll</a>-->
	<div>
		<div class="header-blue" style="padding-bottom: 60px; height: 70px;">
			<nav
				class="navbar navbar-dark navbar-expand-md navigation-clean-search">
				<div class="container">
					<a class="navbar-brand" href="#">MTNG</a>
					<button class="navbar-toggler" data-toggle="collapse"
						data-target="#navcol-1">
						<span class="sr-only">Toggle navigation</span><span
							class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navcol-1">
						<ul class="nav navbar-nav">
							<li class="nav-item" role="presentation"><a
								class="nav-link active invisible" href="#">Link</a></li>
							<li class="dropdown"><a
								class="dropdown-toggle nav-link dropdown-toggle invisible"
								data-toggle="dropdown" aria-expanded="false" href="#">Dropdown
							</a>
								<div class="dropdown-menu" role="menu">
									<a class="dropdown-item" role="presentation" href="#">First
										Item</a><a class="dropdown-item" role="presentation" href="#">Second
										Item</a><a class="dropdown-item" role="presentation" href="#">Third
										Item</a>
								</div></li>
						</ul>
						<form class="form-inline mr-auto" target="_self">
							<div class="form-group">
								<label class="invisible" for="search-field"><i
									class="fa fa-search"></i></label><input
									class="form-control search-field" type="search" name="search"
									id="search-field">
							</div>
						</form>
						<span class="navbar-text"> <a href="#" class="login">Log
								In</a></span><a class="btn btn-light action-button" role="button" href="#">Sign
							Up</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<div>
		<div class="container"
			style="margin-right: 0; margin-left: 0; background-color: transparent; padding-right: 0; padding-left: 0; width: auto; max-width: none;">
			<div class="row"
				style="margin-right: 0px; margin-left: 0px; min-width: 95%; padding-right: 0px; padding-left: 0px;">
				<div class="col-12 col-lg-3 col-xl-3 offset-xl-1"
					style="margin: 0; margin-left: 10; padding-right: 10;">
					<h1>Instructions</h1>
					<p>You won't believe how easy it is to create our polls</p>
					<button class="btn btn-light btn-lg action-button" type="button">Learn
						More</button>
				</div>
				<div
					class="col-11 col-sm-12 col-md-auto col-lg-8 col-xl-8 offset-lg-1 offset-xl-0 d-sm-inline-block d-md-inline-block d-lg-block d-xl-inline-block phone-holder"
					style="min-height: 10px; background-color: transparent; height: 600px; max-height: 600px; padding-right: 0px; margin-left: 0; font-size: 16px; max-width: 95%; padding-left: 0; width: 500px; min-width: none;">
					<div id="surveyElement" style="background-color: transparent;"></div>
					<div id="surveyResult" style="background-color: transparent;"></div>
					<div id="surveyContainer"
						style="background-color: transparent; width: 41%; min-height: 5px; font-size: 16px;"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-dark">
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-3 item">
						<h3>Services</h3>
						<ul>
							<li><a href="#">Web design</a></li>
							<li><a href="#">Development</a></li>
							<li><a href="#">Hosting</a></li>
						</ul>
					</div>
					<div class="col-sm-6 col-md-3 item">
						<h3>About</h3>
						<ul>
							<li><a href="#">Company</a></li>
							<li><a href="#">Team</a></li>
							<li><a href="#">Careers</a></li>
						</ul>
					</div>
					<div class="col-md-6 item text">
						<h3>Company Name</h3>
						<p>Praesent sed lobortis mi. Suspendisse vel placerat ligula.
							Vivamus ac sem lacus. Ut vehicula rhoncus elementum. Etiam quis
							tristique lectus. Aliquam in arcu eget velit pulvinar dictum vel
							in justo.</p>
					</div>
					<div class="col item social">
						<a href="#"><i class="icon ion-social-facebook"></i></a><a
							href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i
							class="icon ion-social-snapchat"></i></a><a href="#"><i
							class="icon ion-social-instagram"></i></a>
					</div>
				</div>
				<p class="copyright">Company Name © 2017</p>
			</div>
		</footer>
	</div>

	<script src="./resources/js/survey.jquery.js"></script>
	<!-- Why is index.js linked twice? Line 7&8 and line 130 -->
	<script src="./resources/index.js"></script>
</body>
</html>