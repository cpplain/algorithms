var readlineSync = require('readline-sync');

var degrees = readlineSync.question('Enter degrees Fahrenheit: ');
var degreesNum = Number(degrees);
var degreesCelsius = (degreesNum - 32) / 1.8;
console.log(degreesNum + ' degrees Fahrenheit is ' + degreesCelsius + ' degrees Celsius!')
