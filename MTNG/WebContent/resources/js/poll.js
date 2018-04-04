/*Load data*/
var data = JSON.parse($('#data').val());
document.querySelector('#here').innerHTML += "Event name: " + data.name + "<br>Location: " + data.location + "<br>";

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

survey
    .onComplete
    .add(function (result) {
        document
            .querySelector('#surveyResult')
            .innerHTML = "result: " + JSON.stringify(result.data);
    });

$("#surveyElement").Survey({model: survey});