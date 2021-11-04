/// Returns the number as string without decimals if it ends with '.0', otherwise returns the double as normal.
String doubleToIntString(double number) {
  var numString = number.toString();
  if (numString.endsWith('.0')) {
    return numString.replaceRange(numString.length - 2, null, '');
  }
  return numString;
}
