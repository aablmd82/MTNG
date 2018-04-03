/*Read poll data if editing a poll*/
try {
	var data = JSON.parse($('#data').val());
} catch (SyntaxError) {
}

/* Checking that the start times are all before the end times */
function surveyValidateQuestion(s, options) {
	if (options.name == "times") {
		for (i in options.value) {
			var tV = options.value[i];
			var startdate = new Date(tV.startdate + ' ' + tV.starthours + ':'
					+ tV.startminutes);
			var enddate = new Date(tV.enddate + ' ' + tV.endhours + ':'
					+ tV.endminutes);
			if (startdate > enddate) {
				options.error = "Please ensure starting times are before ending times";
			}
		}
	}
}

/* Define the survey */
Survey.Survey.cssType = "bootstrap";
var surveyJSON = {
	"pages" : [ {
		"name" : "page1",
		questions : [ {
			type : "text",
			name : "name",
			title : "Please type the event name",
			isRequired : true,
		}, {
			type : "text",
			name : "location",
			title : "Please type the location name",
			isRequired : true
		}, {
			type : "text",
			name : "email",
			title : "Please type your e-mail",
			isRequired : true,
			validators : [ {
				type : "email"
			} ]
		} ]
	}, {
		"name" : "page2",
		questions : [ {
			type : "matrixdynamic",
			name : "pollTimeList",
			title : "Select time options:",
			validators : [ {
				type : "mytextvalidator"
			} ],
			columns : [ {
				"name" : "startdate",
				"title" : "Starting:",
				"cellType" : "text",
				"isRequired" : true,
				"inputType" : "date"
			}, {
				"name" : "starthours",
				"title" : "Hour:",
				"isRequired" : true,
				"cellType" : "dropdown",
				"isRequired" : true,
				"choices" : [ {
					"value" : "0",
					"text" : "12 AM"
				}, {
					"value" : "1",
					"text" : "1 AM"
				}, {
					"value" : "2",
					"text" : "2 AM"
				}, {
					"value" : "3",
					"text" : "3 AM"
				}, {
					"value" : "4",
					"text" : "4 AM"
				}, {
					"value" : "5",
					"text" : "5 AM"
				}, {
					"value" : "6",
					"text" : "6 AM"
				}, {
					"value" : "7",
					"text" : "7 AM"
				}, {
					"value" : "8",
					"text" : "8 AM"
				}, {
					"value" : "9",
					"text" : "9 AM"
				}, {
					"value" : "10",
					"text" : "10 AM"
				}, {
					"value" : "11",
					"text" : "11 AM"
				}, {
					"value" : "12",
					"text" : "12 PM"
				}, {
					"value" : "13",
					"text" : "1 PM"
				}, {
					"value" : "14",
					"text" : "2 PM"
				}, {
					"value" : "15",
					"text" : "3 PM"
				}, {
					"value" : "16",
					"text" : "4 PM"
				}, {
					"value" : "17",
					"text" : "5 PM"
				}, {
					"value" : "18",
					"text" : "6 PM"
				}, {
					"value" : "19",
					"text" : "7 PM"
				}, {
					"value" : "20",
					"text" : "8 PM"
				}, {
					"value" : "21",
					"text" : "9 PM"
				}, {
					"value" : "22",
					"text" : "10 PM"
				}, {
					"value" : "23",
					"text" : "11 PM"
				} ]
			}, {
				"name" : "startminutes",
				"title" : "Minutes:",
				"cellType" : "dropdown",
				"isRequired" : true,
				"choices" : [ "0", "15", "30", "45" ]
			}, {
				"name" : "enddate",
				"isRequired" : true,
				"title" : "Ending:",
				"cellType" : "text",
				"inputType" : "date"
			}, {
				"name" : "endhours",
				"title" : "Hour:",
				"cellType" : "dropdown",
				"isRequired" : true,
				"choices" : [ {
					"value" : "0",
					"text" : "12 AM"
				}, {
					"value" : "1",
					"text" : "1 AM"
				}, {
					"value" : "2",
					"text" : "2 AM"
				}, {
					"value" : "3",
					"text" : "3 AM"
				}, {
					"value" : "4",
					"text" : "4 AM"
				}, {
					"value" : "5",
					"text" : "5 AM"
				}, {
					"value" : "6",
					"text" : "6 AM"
				}, {
					"value" : "7",
					"text" : "7 AM"
				}, {
					"value" : "8",
					"text" : "8 AM"
				}, {
					"value" : "9",
					"text" : "9 AM"
				}, {
					"value" : "10",
					"text" : "10 AM"
				}, {
					"value" : "11",
					"text" : "11 AM"
				}, {
					"value" : "12",
					"text" : "12 PM"
				}, {
					"value" : "13",
					"text" : "1 PM"
				}, {
					"value" : "14",
					"text" : "2 PM"
				}, {
					"value" : "15",
					"text" : "3 PM"
				}, {
					"value" : "16",
					"text" : "4 PM"
				}, {
					"value" : "17",
					"text" : "5 PM"
				}, {
					"value" : "18",
					"text" : "6 PM"
				}, {
					"value" : "19",
					"text" : "7 PM"
				}, {
					"value" : "20",
					"text" : "8 PM"
				}, {
					"value" : "21",
					"text" : "9 PM"
				}, {
					"value" : "22",
					"text" : "10 PM"
				}, {
					"value" : "23",
					"text" : "11 PM"
				} ]
			}, {
				"name" : "endminutes",
				"title" : "Minutes:",
				"cellType" : "dropdown",
				"isRequired" : true,
				"choices" : [ "0", "15", "30", "45" ]
			} ]
		} ]
	} ]
}

/* Initialize survey, with previous data loaded if editing the poll */
if (data) {
	surveyJSON.pages[0].questions[0].visible = false;
	surveyJSON.pages[0].questions[1].visible = false;
	var survey = new Survey.Model(surveyJSON);
	survey.data = data;
	survey.currentPageNo = 1;
} else
	var survey = new Survey.Model(surveyJSON);
survey.showQuestionNumbers = 'off';
survey.requiredText = '';

function createPoll(survey) {
	alert('Inside createPoll js function');
	var poll = JSON.stringify(survey.data);
	alert(poll);
	// Send the request
	$.ajax({
		url : "http://localhost:8080/MTNG/createPoll",
		type : 'POST',
		data : poll,
		// contentType defines json which becomes @RequestBody in controller
		// Without it, "unsupported media type" error appears
		contentType : 'application/json',
		success : function(data) {
			alert(data);
		},
		error : function(data, status, er) {
			alert("error: " + data + " status: " + status + " er:" + er);
		}
	});
};

$("#surveyContainer").Survey({
	model : survey,
	onValidateQuestion : surveyValidateQuestion,
	onComplete : createPoll
});