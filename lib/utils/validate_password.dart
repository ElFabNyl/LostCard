

class ValidatePassword{

  bool isStrongPassword(String password) {

    print(RegExp(
        r'(( ^(?=.*\W)))$')
        .hasMatch(password));

    return RegExp(r"(?=.*\W)")
        .hasMatch(password);
  }


  //*[!@#&()–[{}]:;',?/*~$^+=<>])

}

