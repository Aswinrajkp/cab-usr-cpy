mobileValidation(value) {
  String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}

validateEmail(value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
