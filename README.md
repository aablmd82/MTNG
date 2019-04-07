# MTNG

Web application made for Software Engineering and Practice (Winter 2018). The application intent was to create a poll of possible meeting times for people to vote on. Once a poll was created, a link would be generated to allow others to vote  I was in charge of front end design, including HTML, CSS, and JavaScript. The website was designed with <b>Bootstrap Studio</b> using the <b>Spring MVC framework</b>.

- <b>WebContent/</b>:
  - Created all of the jsps included within, which were used to display the website
  - Created <b>poll.js</b> and <b>index.js</b>
    - <b>index.js</b> is used to create or edit a poll. The created poll is saved to a database connected to the server
    - <b>poll.js</b> is used to display the created poll to the end user, allowing them to cast a vote. Once their vote has been cast, a results screen is displayed
    - Both of these files use SurveyJS (Licensed under MIT) to display all the polls and results. I had to familiarize myself on how to create and edit polls, send and retreive data to a poll, and displaying the results of a poll.
- <b>MTNG/src/ou/secs/controller/</b>: Helped write the code here to process the information sent/received from the web application

<a href="https://docs.google.com/presentation/d/e/2PACX-1vRhzt6iebhC3VOPddRodpL9iC8cUCG_zUFOJU9Aeegqcw6An-VNdl6UH4PFpriBkBPk3Qptomcwmfa8/pub?start=false&loop=false&delayms=5000">Link to our final presentation</a>
