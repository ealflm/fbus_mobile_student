class Student {
  String? id;
  String? fullName;
  String? phone;
  String? email;
  String? address;
  String? photoUrl;
  bool? automaticScheduling;

  Student({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.address,
    this.photoUrl,
    this.automaticScheduling,
  });

  Student.fromJson(Map<String, dynamic> json) {
    id = json['StudentId'];
    fullName = json['FullName'];
    phone = json['Phone'];
    email = json['Email'];
    address = json['Address'];
    photoUrl = json['PhotoUrl'];
    automaticScheduling = json['AutomaticScheduling'] == 'True' ? true : false;
  }
}
