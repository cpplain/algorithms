var readlineSync = require('readline-sync');

var ordinal = function(input) {
  var number = Number(input);
  var lastDigit = number % 10;
  var lastTwoDigits = number % 100;
  if (lastTwoDigits > 10 && lastTwoDigits < 14) {
    return input + 'th';
  }
  else if(lastDigit === 1) {
    return input + 'st';
  }
  else if (lastDigit === 2) {
    return input + 'nd';
  }
  else if (lastDigit === 3) {
    return input + 'rd';
  }
  else {
    return input + 'th';
  }
};

var input = readlineSync.question('Enter a whole number greater than zero: ');

var value = ordinal(input);
console.log(value);
