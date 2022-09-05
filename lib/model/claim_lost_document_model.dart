class ClaimLostDocumentModel {
  String idClaimLostDocument;
  String idUser;
  String idLostDocument;

  List<String> listOfAuthenticationFiles = [];


  ClaimLostDocumentModel({
    required this.idClaimLostDocument,
    required this.idUser,
    required this.idLostDocument,
    required this.listOfAuthenticationFiles,

  });

  Map<String, dynamic> toJson() {
    return {
      'idClaimLostDocument': idClaimLostDocument,
      'idUser': idUser,
      'idLostDocument': idLostDocument,
      'listOfAuthenticationFiles': listOfAuthenticationFiles,


    };
  }

  factory ClaimLostDocumentModel.fromJson(Map<String, dynamic> json) {
    return ClaimLostDocumentModel(
      idClaimLostDocument: json['idClaimLostDocument'],
      idUser: json['idUser'],
      idLostDocument: json['idLostDocument'],
      listOfAuthenticationFiles: json['listOfAuthenticationFiles'],);
  }
}
