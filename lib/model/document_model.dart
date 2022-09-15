class DocumentModel {
  String idUser;
  String idDocument;
  String name;
  String address;
 List<String> listOfFiles = [];
  String documentType;
  String registrationDate;
  String documentState;
  String transactionStatus;

  DocumentModel({
    required this.idUser,
    required this.idDocument,
    required this.name,
    required this.address,
    required this.listOfFiles,
    required this.documentType,
    required this.registrationDate,
    required this.documentState,
    required this.transactionStatus

  });

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'idDocument': idDocument,
      'name': name,
      'address': address,
      'listOfFiles':listOfFiles,
      'documentType': documentType,
      'registrationDate': registrationDate,
      'documentState': documentState,
      'transactionStatus': transactionStatus,
    };
  }

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
         idUser: json['idUser'],
        idDocument: json['idDocument'],
        name: json['name'],
        address: json['address'],
      listOfFiles: json['listOfFiles'].cast<String>(),
        documentType: json['documentType'],
        registrationDate: json['registrationDate'],
        documentState: json['documentState'],
      transactionStatus: json['transactionStatus'],

    );
  }
}
