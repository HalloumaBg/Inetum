import 'package:inetum_ws/models/address.dart';

class Author {
  int id;
  String name;
  String userName;
  String email;
  String avatarUrl;
  Address address;

  Author(
      {this.id,
      this.name,
      this.userName,
      this.email,
      this.avatarUrl,
      this.address});

  @override
  String toString() {
    return 'Author{'
        'id: $id, '
        'name: $name, '
        'userName: $userName, '
        'email: $email, '
        'avatarUrl: $avatarUrl, '
        'address: $address}';
  }

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
        id: json['id'],
        name: json['name'],
        userName: json['userName'],
        email: json['email'],
        avatarUrl: json['avatarUrl'],
        address:  Address.fromJson(json['address']));
  }
}
