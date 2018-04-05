<!DOCTYPE html>
<html>
<head>
<title>MTNG Spring MVC</title>
<style type="text/css">
</style>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="./resources/css/Footer-Dark.css">
    <link rel="stylesheet" href="./resources/css/Header-Blue.css">
    <link rel="stylesheet" href="./resources/css/styles.css">
    <link rel="stylesheet" href="./resources/css/untitled.css">
    <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<link rel="stylesheet" href="https://getbootstrap.com/dist/css/bootstrap.css">
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/smoothness/jquery-ui.css" type="text/css" rel="stylesheet" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
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
	<input type="hidden" id="data" value='${data}' />
	<div>
        <div class="d-flex align-items-xl-center align-content-xl-stretch header-blue" style="height:96px;padding-top:0px;">
            <div class="d-flex justify-content-between align-items-center" style="min-width:100%;padding-left:6px;"><img src="./resources/img/logo.png" style="width:auto;height:86px;background-size:auto;padding-right:18px;padding-left:22px;">
                <h1 style="margin-bottom:0px;color:#f0f9ff;font-size:54px;">MTNG&nbsp;</h1>
                <h3 class="mr-auto" style="margin-bottom:0px;color:#f0f9ff;font-size:20px;">Make time today</h3><form action="http://localhost:8080/MTNG/goToPoll"><div class="form-group d-flex justify-content-center align-items-center align-content-center" style="margin-bottom:0px;width:476px;margin-right:36px;"><input type="text" name="pollID" placeholder="Poll ID" class="form-control-sm" style="background-color:#f0f0f0;height:39px;font-size:21px;width:153px;" />
    <hr style="margin-right:auto;margin-top:0px;margin-bottom:0px;margin-left:auto;background-color:#f0f9ff;height:43px;width:1px;"
    /><input type="text" name="userID" placeholder="User ID (Optional)" class="form-control-sm" style="background-color:#f0f0f0;height:39px;font+-size:21px;width:175px;" />
    <hr style="width:1px;margin-top:0px;margin-right:auto;margin-bottom:0px;margin-left:auto;height:43px;background-color:#f0f9ff;"
    /><button class="btn btn-outline-light btn-lg" type="submit" ref="/hello" style="background-color:rgba(235,236,255,0.49);">View Poll</button></div></form></div>
        </div>
    </div>
    <div style="background-color:#cccccc;height:auto;">
        <div class="container" style="margin-right:0;margin-left:0;padding-right:0;padding-left:0;width:auto;max-width:none;height:auto;">
            <div class="row justify-content-around" style="margin-right:0px;margin-left:0px;padding-right:0px;padding-left:0px;min-height:none;padding-top:25px;padding-bottom:25px;">
                <div class="col-auto col-lg-3 col-xl-3 offset-xl-1" style="margin:0;margin-left:10;padding-right:10;background-color:#444444;padding-bottom:15px;height:517px;padding-top:15px;">
                    <div class="carousel slide" data-ride="carousel" data-interval="5000" id="carousel-1" style="height:100%;">
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active" style="height:499px;"><img class="w-100 d-block" src="./resources/img/firstPage.png" alt="Slide Image" style="height:210px;">
                                <div class="carousel-caption">
                                    <h3>Input names</h3>
                                    <p>Begin by inputting information about yourself and the event. All information is secure and handled by the powerful, open-source SurveyJS</p>
                                </div>
                            </div>
                            <div class="carousel-item" style="height:499px;"><img class="w-100 d-block" src="./resources/img/survey.png" alt="Slide Image" style="height:211px;">
                                <div class="carousel-caption">
                                    <h3>Create Survey</h3>
                                    <p>Begin by selecting possible time slots, adding or deleting rows as necessary. Press complete to generate the poll along with a link to invite others to vote on the poll</p>
                                </div>
                            </div>
                            <div class="carousel-item" style="height:499px;"><img class="w-100 d-block mb-auto" src="./resources/img/vote.png" alt="Slide Image" style="height:210px;">
                                <div class="carousel-caption">
                                    <h3>Vote</h3>
                                    <p>When users click on a survey link, they will be asked for their name, and the times they are available. Both the creator and voters can edit their choices at any time</p>
                                </div>
                            </div>
                            <div class="carousel-item" style="height:499px;"><img class="w-100 d-block" src="./resources/img/capture.png" alt="Slide Image" style="height:234;">
                                <div class="carousel-caption">
                                    <h3>View Results</h3>
                                    <p>Get a clean, up-to-date graphical representation of the survey results at any time. This helps to make choosing the most popular result an easy task</p>
                                </div>
                            </div>
                        </div>
                        <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev"><span class="carousel-control-prev-icon"></span><span class="sr-only">Previous</span></a><a class="carousel-control-next" href="#carousel-1" role="button"
                                data-slide="next"><span class="carousel-control-next-icon"></span><span class="sr-only">Next</span></a></div>
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-1" data-slide-to="1"></li>
                            <li data-target="#carousel-1" data-slide-to="2"></li>
                            <li data-target="#carousel-1" data-slide-to="3"></li>
                        </ol>
                    </div>
                </div>
                <div class="col-11 col-sm-12 col-md-auto col-lg-8 col-xl-8 offset-lg-1 offset-xl-0 d-sm-inline-block d-md-inline-block d-lg-block d-xl-inline-block phone-holder" style="padding-right:0px;margin-left:0;font-size:16px;padding-left:0;padding-top:0px;min-height:none;height:auto;">
                    <div id="surveyElement"></div>
                    <div id="surveyResult"></div>
                    <div class="m-auto" id="surveyContainer" style="width:100%;min-height:517px;font-size:16px;background-color:#ffffff;color:#282d32;"></div>
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
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/survey.jquery.js"></script>
    <script src="./resources/js/index.js"></script>
</body>
</html>