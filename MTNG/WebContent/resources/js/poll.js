/*Load data*/
var dataString = $('#data').val();
try{
	var data = JSON.parse($('#data').val());
} catch(SyntaxError){
	var data = {"name":"hello","location":"hello","pollTimeList":[{"startdate":"2018-12-31","starthours":"0","startminutes":"0","enddate":"2018-12-31","endhours":"16","endminutes":"15","Time_ID":0},{"startdate":"2018-04-01","starthours":"0","startminutes":"0","enddate":"2018-12-01","endhours":"2","endminutes":"0","Time_ID":0}]};
}
document.getElementById("eventName").innerHTML = data.name;
document.getElementById("locationName").innerHTML = data.location;
document.getElementById("personName").innerHTML = data.personName;

/*Load the available options*/
var choices1 = [];
var dateOptions = { weekday: 'short', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric', hour12: true };
for (i in data.pollTimeList) {
    var dt = data.pollTimeList[i];
    choices1.push(formatDates(dt));
}

/*Format the options into a nice string*/
function formatDates(times) {
	var obj = {
			"value": times.Time_ID,
			"text": (new Date(times.startdate + " " + times.starthours + ":" + times.startminutes).toLocaleString('en-US', dateOptions).replace(/,/g, '') + "   -   " +
					new Date(times.enddate + " " + times.endhours + ":" + times.endminutes).toLocaleString('en-US', dateOptions).replace(/,/g, ''))
	};
	return obj;
}

/*Define the survey*/ 
Survey.Survey.cssType = "bootstrap";
var json = {
    requiredText: "",
    questions: [
    	{
    		type: "text",
    		name: "personName",
    		title: "Please enter your name",
    		isRequired: true
    	}, {
            type: "checkbox",
            name: "pollTimeList",
            title: "Select available times:",
            isRequired: true,
            colCount: 1,
        }
    ]
};

/*Add the time options*/
json.questions[1].choices = choices1;

/*Instantiate the survey*/
window.survey = new Survey.Model(json);
survey.showQuestionNumbers = 'off';
survey.requiredText = '';

function saveVote(survey) {
	alert('Inside saveVote js function');
	var voteData = JSON.stringify(survey.data);
	alert(voteData);
	// Send the request
	$.ajax({
		url : "http://localhost:8080/MTNG/saveVote",
		type : 'POST',
		data : voteData,
		// contentType defines json which becomes @RequestBody in controller
		// Without it, "unsupported media type" error appears
		success : function(data) {
		},
		error : function(data, status, er) {
			"Voter ID: 1<br><br>Use this ID to view the results of the poll at any time";
		}
	});
};

function showChart(chartDataSource) {
    document
        .getElementById("chartContainer")
        .style
        .height = "500px";
    $("#chartContainer").dxChart({
        dataSource: chartDataSource,
        argumentAxis: {
        	label: {
        		customizeText: function() {
        			return this.value.replace(/-/g, '-<br>')
        		}
        	}
        },
        commonSeriesSettings: {
            hoverMode: "allArgumentPoints",
            selectionMode: "allArgumentPoints",
            label: {
                visible: true,
                backgroundColor: "#000000"
            }
        },
        rotated: true,
        series: {
            argumentField: 'name',
            valueField: 'value',
            type: "bar",
            color: '#fff222'
        }
    });
}

var chartDataSource = [{name: "Thu Jun 5 5:30AM - Thu Jun 6:00PM", value: "5"},
	{name:"Thu Jun 5 5:30AM - Thu Jun 8:00PM", value: "60"},
	{name:"Thu Jun 6 5:30AM - Thu Jun 8:00PM", value: "30"}];
chartDataSource.sort(function(a,b){return a.value - b.value});

survey
.onComplete
.add(function (result) {
	showChart(chartDataSource);
});

$("#surveyElement").Survey({model: survey, onComplete: saveVote});