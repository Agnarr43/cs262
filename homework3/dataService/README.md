# CS 262 Monopoly Webservice

This is the data service application for the [CS 262 homework 3]
and it is deployed here:
          
<https://cs262-lab09.herokuapp.com/>

It is based on the standard Heroku with Node.js tutorial.

<https://devcenter.heroku.com/articles/getting-started-with-nodejs>  

Lab Questions:
a. All the ones from lab09, plus cs262-lab09.herokuapp.com/dogbreathScores and cs262-lab09.herokuapp.com/dogbreathScores/:gameid
b. These are idempotent and nullipotent
c. Yes;
- It's stateless
- The client and server are separated
- I think heroku is caching some stuff, queries take less time the 2nd time I run them
d. I don't think so, the only potential thing is that the objects returned dont have an "id" field, they have a "gameid" field, so some code in the gamezone had to be changed.