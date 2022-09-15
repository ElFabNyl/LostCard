
class RewardModel{
  String idReward;
  String idUser;
  String idDocument;
  String location;
  String date;


  RewardModel({
    required this.idReward,
    required this.idUser,
    required this.idDocument,
    required this.location,
    required this.date,

  });

  Map<String, dynamic> toJson() {
    return {
      'idReward': idReward,
      'idUser': idUser,
      'idDocument': idDocument,
      'location': location,
      'date': date,


    };
  }

  factory RewardModel.fromJson(Map<String, dynamic> json) {
    return RewardModel(
      idReward: json['idReward'],
      idUser: json['idUser'],
      idDocument: json['idDocument'],
      location: json['location'],
      date: json['date'],


    );
  }
}