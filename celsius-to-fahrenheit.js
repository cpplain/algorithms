var readlineSync = require('readline-sync');

var degrees = readlineSync.question('Enter degrees Celsius: ');
var degreesNum = Number(degrees);
var degreesFahrenheit = 1.8 * degreesNum + 32;
console.log(degreesNum + ' degrees Celsius is ' + degreesFahrenheit + ' degrees Fahrenheit!');
