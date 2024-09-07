class AuthController {
  loginController() {}
  signupController(model) {}

  isEmptyValidation(String value) {
    if (value.isEmpty) {
      return "Field cannot be Empty";
    }
    return null;
  }

  passwordValidation(String value) {
    if (value.isEmpty) {
      return "Field cannot be Empty";
    } else if (value.length < 8) {
      return "Password Should be at least 8 characters";
    }
  }

  emailValidation(String value) {
    if (value.isEmpty) {
      return "Empty Field";
    } else if (value.contains('@')) {
      return "Email Should Contain @ ";
    } else if (value.contains('.com')) {
      return "Email Should Contain .com";
    }
  }

  //username validation
  usernameValidation(String value) {
    if (value.isEmpty) {
      return "Empty Field";
    } else if (!value.contains('/')) {
      return "Email Should Contain / ";
    }
  }
}
