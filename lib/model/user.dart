class UserModel {
  String idUser;
  String name;
  String emailAddress;
  String password;
  String phoneNumber;
  String profilePicture;
  String documentsFound;
  String rewardsGained;

  UserModel({
    required this.idUser,
    required this.name,
    required this.emailAddress,
    required this.password,
    required this.phoneNumber,
    required this.profilePicture,
    required this.documentsFound,
    required this.rewardsGained,
  });

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'name': name,
      'emailAddress': emailAddress,
      'password': password,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'documentsFound': documentsFound,
      'rewardsGained': rewardsGained,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        idUser: json['idUser'],
        name: json['name'],
        emailAddress: json['emailAddress'],
        password: json['password'],
        phoneNumber: json['phoneNumber'],
        profilePicture: json['profilePicture'],
        documentsFound: json['documentsFound'],
        rewardsGained: json['rewardsGained']


    );
  }
}
