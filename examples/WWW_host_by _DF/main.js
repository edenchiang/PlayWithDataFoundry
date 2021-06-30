function showDialog(msg) {
  let str = "The best things in life are free";
  let patt = new RegExp("e");
  let res = patt.test(str);
  if (res) {
    alert("There is(are) 'e'(s) in the string: " + str);
  }
}