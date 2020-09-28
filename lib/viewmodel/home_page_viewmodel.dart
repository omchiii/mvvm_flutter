import 'package:flutter/material.dart';

class HomePageViewModel extends ChangeNotifier {
  bool _isEnabled = false;
  String _errorText = "Please enter a valid email";

  void checkEmail(String email) {
    //you would have logic for email validation, this is just a "placeholder"
    if (email.length >= 5 && _isEnabled == false) {
      _isEnabled = true;
      notifyListeners();
    } else if (email.length < 5 && _isEnabled == true) {
      _isEnabled = false;
      notifyListeners();
    }
  }

  checkError() {
    return _isEnabled ? null : _errorText;
  }

  checkIsValid() {
    return !_isEnabled ? null : () {};
  }
}
