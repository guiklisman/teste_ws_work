class Lead {
  final int? id;
  final int carId;
  final String userName;
  final String userContact;

  Lead({
    this.id,
    required this.carId,
    required this.userName,
    required this.userContact,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'carId': carId,
      'userName': userName,
      'userContact': userContact,
    };
  }

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      id: json['id'],
      carId: json['carId'],
      userName: json['userName'],
      userContact: json['userContact'],
    );
  }
}
