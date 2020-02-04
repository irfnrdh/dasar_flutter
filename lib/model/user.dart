class User {
  String uid;
  String email;
  String name;
  String address;

  User({this.uid, this.email, this.name, this.address});

  User.empty() {
    this.email = '';
    this.name = '';
    this.address = '';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "address": address,
      };

  @override
  String toString() => toJson().toString();
}
