class ClaimFoundDocumentModel {
  String idClaimFoundDocument;
  String idUser;
  String idFoundDocument;

  List<String> listOfAuthenticationFiles = [];


  ClaimFoundDocumentModel({
    required this.idClaimFoundDocument,
    required this.idUser,
    required this.idFoundDocument,
    required this.listOfAuthenticationFiles,

  });

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'idFoundDocument': idFoundDocument,
      'listOfAuthenticationFiles': listOfAuthenticationFiles,
      'idClaimFoundDocument': idClaimFoundDocument,

    };
  }

  factory ClaimFoundDocumentModel.fromJson(Map<String, dynamic> json) {
    return ClaimFoundDocumentModel(
        idUser: json['idUser'],
        idFoundDocument: json['idFoundDocument'],
        listOfAuthenticationFiles: json['listOfAuthenticationFiles'],
        idClaimFoundDocument: json['idClaimFoundDocument'],);
  }
}
