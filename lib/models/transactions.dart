// ignore: file_names
class Transactions {
  late int? id;
  String pid;
  String name;
  String gender;
  String phone;
  String emailAdd;
  String date;

  Transactions(
      {this.id,
      required this.pid,
      required this.name,
      required this.gender,
      required this.phone,
      required this.emailAdd,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pid': pid,
      'name': name,
      'gender': gender,
      'phone': phone,
      'emailAdd': emailAdd,
      'date': date
    };
  }
}
