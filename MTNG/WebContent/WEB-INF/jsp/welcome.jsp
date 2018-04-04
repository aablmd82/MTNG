<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>MTNG Homepage</title>
<!-- let's add tag srping:url -->
<spring:url value="/resources/index.js" var="indexJS" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<!-- Finish adding tags -->


<script src="https://unpkg.com/jquery"></script>

<script src="https://unpkg.com/survey-jquery"></script>

<link rel="stylesheet"
	href="https://getbootstrap.com/dist/css/bootstrap.css">
<!-- <link rel="stylesheet" href="/index.css"> -->

<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/smoothness/jquery-ui.css"
	type="text/css" rel="stylesheet" />

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

</head>

<body>
	<input type="hidden" id="data" value='${data}' />
	<div id="surveyElement"></div>
	<div id="surveyResult"></div>
	<div id="surveyContainer"></div>
	<script src="${indexJS}"></script>
</body>
</html>