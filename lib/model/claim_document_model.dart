class ClaimDocumentModel {
  String idClaimDocument;
  String idUser;
  String idDocument;
  String documentState;

  List<String> listOfAuthenticationFiles = [];


  ClaimDocumentModel({
    required this.idClaimDocument,
    required this.idUser,
    required this.idDocument,
    required this.listOfAuthenticationFiles,
    required this.documentState,

  });

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'iDocument': idDocument,
      'listOfAuthenticationFiles': listOfAuthenticationFiles,
      'idClaimDocument': idClaimDocument,
      'documentState': documentState,

    };
  }

  factory ClaimDocumentModel.fromJson(Map<String, dynamic> json) {
    return ClaimDocumentModel(
        idUser: json['idUser'],
        idDocument: json['idDocument'],
        listOfAuthenticationFiles: json['listOfAuthenticationFiles'],
        idClaimDocument: json['idClaimDocument'],
        documentState: json['documentState'],

    );
  }
}
