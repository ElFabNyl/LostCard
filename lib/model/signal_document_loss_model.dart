class SignalDocumentLossModel {
  String idUser;
  String idDocumentLost;
  String yourName;
  String addressWhereLost;
  String documentType;
  String registrationDate;
  String documentState;

  List<String> listOfAuthenticationFiles = [];


  SignalDocumentLossModel({
    required this.idUser,
    required this.idDocumentLost,
    required this.listOfAuthenticationFiles,
    required this.yourName,
    required this.addressWhereLost,
    required this.documentType,
    required this.registrationDate,
    required this.documentState,

  });

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'idDocumentLost': idDocumentLost,
      'listOfAuthenticationFiles': listOfAuthenticationFiles,
      'yourName':yourName,
      'addressWhereLost': addressWhereLost,
      'documentType': documentType,
      'registrationDate': registrationDate,
      'documentState': documentState,


    };
  }

  factory SignalDocumentLossModel.fromJson(Map<String, dynamic> json) {
    return SignalDocumentLossModel(
      idUser: json['idUser'],
      idDocumentLost: json['idDocumentLost'],
      listOfAuthenticationFiles: json['listOfAuthenticationFiles'].cast<String>(),
        yourName: json['yourName'],
        addressWhereLost: json['addressWhereLost'],
        documentType: json['documentType'],
        registrationDate: json['registrationDate'],
        documentState: json['documentState'],

    );
  }
}
