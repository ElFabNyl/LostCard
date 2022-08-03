

class ValidateNumber{

  bool isNumber(String phoneNumber) {
    return double.tryParse(phoneNumber) != null;
  }

}

