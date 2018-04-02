<!DOCTYPE html>
<html>
<head>
<title>MTNG Spring MVC</title>
<style type="text/css">
body
</style>
<spring:url value="/resources/index.js" var="indexJS" />
<script src="${indexJS}"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<!-- Finish adding tags -->


<script src="https://unpkg.com/jquery"></script>

<script>
	function getPoll() {
		alert('Inside getPoll js function');
		// Send the request
		$.ajax({
			url : "http://localhost:8080/MTNG/getPoll",
			type : 'GET',
			// dataType for returning objects to json from java
			dataType : 'json',
			success : function(data) {
				alert("Name : " + data.name + ", : Location : " + data.location);
			},
			error : function(data, status, er) {
				alert("error: " + data + " status: " + status + " er:" + er);
			}
		});
	};
</script>

</head>
<body>
	<br>
	<div style="text-align: center">
		<h2>
			Hello, this is the MTNG sample page.<br> <br>
		</h2>
	</div>
	<form action="${pageContext.servletContext.contextPath}/goToPoll"
		method="GET">
		<br> <input type="submit" value="Submit"> <br><br><br> <input
			type="button" value="Get Poll" onclick="getPoll();">
	</form>

	<!--  <a href="${pageContext.servletContext.contextPath}/jsp/welcome.jsp">Click here to create a poll</a>-->
</body>
</html>