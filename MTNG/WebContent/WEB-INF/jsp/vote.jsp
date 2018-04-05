<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>MTNG VotePage</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website2</title>
    <link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="./resources/css/Footer-Dark.css">
    <link rel="stylesheet" href="./resources/css/Header-Blue.css">
    <link rel="stylesheet" href="./resources/css/styles.css">
    <link rel="stylesheet" href="./resources/css/untitled.css">
    <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="https://cdn3.devexpress.com/jslib/17.2.5/js/dx.all.js"></script>
	<link rel="stylesheet" href="https://getbootstrap.com/dist/css/bootstrap.css">
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/smoothness/jquery-ui.css" type="text/css" rel="stylesheet" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

<body>
	<input type="hidden" id="data" value='${data}' />
	<div>
        <div class="d-flex align-items-xl-center align-content-xl-stretch header-blue" style="height:96px;padding-top:0px;">
            <div class="d-flex justify-content-between align-items-center" style="min-width:100%;padding-left:6px;"><img src="./resources/img/logo.png" style="width:auto;height:86px;background-size:auto;padding-right:18px;padding-left:22px;">
                <h1 style="margin-bottom:0px;color:#f0f9ff;font-size:54px;">MTNG&nbsp;</h1>
                <h3 class="mr-auto" style="margin-bottom:0px;color:#f0f9ff;font-size:20px;">Make time today</h3><form><div class="form-group d-flex justify-content-center align-items-center align-content-center" style="margin-bottom:0px;width:476px;margin-right:36px;"><input type="text" name="pollID" placeholder="Poll ID" class="form-control-sm" style="background-color:#f0f0f0;height:39px;font-size:21px;width:153px;" />
    <hr style="margin-right:auto;margin-top:0px;margin-bottom:0px;margin-left:auto;background-color:#f0f9ff;height:43px;width:1px;"
    /><input type="text" name="userID" placeholder="User ID (Optional)" class="form-control-sm" style="background-color:#f0f0f0;height:39px;font+-size:21px;width:175px;" />
    <hr style="width:1px;margin-top:0px;margin-right:auto;margin-bottom:0px;margin-left:auto;height:43px;background-color:#f0f9ff;"
    /><button class="btn btn-outline-light btn-lg" type="submit" style="background-color:rgba(235,236,255,0.49);">View Poll</button></div></form></div>
        </div>
    </div>
    <div style="background-color:#cccccc;height:auto;">
        <div class="container" style="margin-right:0;margin-left:0;padding-right:0;padding-left:0;width:auto;max-width:none;height:auto;">
            <div class="row d-inline-flex justify-content-around" style="margin-right:0px;margin-left:0px;padding-right:0px;padding-left:0px;min-height:none;padding-top:25px;padding-bottom:25px;">
                <div class="col-auto col-sm-auto col-md-auto col-lg-auto col-xl-5 offset-lg-1 offset-xl-0 d-xl-inline-flex flex-wrap phone-holder" style="padding-right:10px;margin-left:0;font-size:16px;padding-left:0;padding-top:10px;min-height:517px;background-color:#ffffff;text-align:center;padding-bottom:10px;">
                    <div class="d-xl-table justify-content-center align-items-center align-content-center flex-wrap" style="width:562px;">
                        <div class="d-xl-table-cell justify-content-center flex-wrap" style="max-width:166.406;">
                            <h3 style="color:#444444;">Event Name</h3>
                            <p class="flex-wrap" id="eventName" style="margin-bottom:0px;min-width:10px;overflow-wrap:break-word;max-width:155;">Hello</p>
                        </div>
                        <hr class="d-table-cell" style="width:1px;height:47px;background-color:#184e8e;">
                        <div class="d-xl-table-cell justify-content-center flex-wrap">
                            <h3 style="color:#444444;font-size:36p;">Location</h3>
                            <p id="locationName" style="margin-bottom:0px;">Paragraph</p>
                        </div>
                        <hr class="d-table-cell" style="background-color:#172a74;width:1px;height:27px;margin:0;max-height:19px;">
                        <div class="justify-content-center flex-wrap">
                            <h3 style="color:#444444;">Created By</h3>
                            <p id="personName">Paragraph</p>
                        </div>
                    </div>
                    <div class="d-table-row mb-auto" id="surveyElement" style="text-align:left;min-width:58px;min-height:100px;"></div>
                    <div id="surveyResult"></div><a class="btn btn-primary btn-lg align-self-end mt-auto" role="button" href="${pageContext.servletContext.contextPath}/getPollToEdit" style="margin-left:auto;">Edit Votes</a></div>
                <div class="col-8 col-lg-3 col-xl-6 offset-xl-1" style="margin:0;margin-left:10;padding-right:10;background-color:#444444;padding-bottom:25px;padding-top:15px;">
                    <div id="chartContainer" style="height:296px;">
                        <h1 class="text-center text-white" id="results">Results will be displayed here after casting your vote</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-dark" style="padding-bottom:10px;padding-top:15px;">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 item text" style="margin-bottom:0px;">
                        <h3>The Squad</h3>
                        <p>Ariana Lee &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Austin Kue<br>Cameron Chambers &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Evan Haskell &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>Mahmood Alomari
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Nikita Chunduru<br>Yousef Ismail</p>
                    </div>
                </div>
                <p class="copyright">The Squad © 2018</p>
            </div>
        </footer>
    </div>
    <script src="./resources/js/jquery.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/survey.jquery.js"></script>
    <script src="./resources/js/poll.js"></script>
</body>
</html>

