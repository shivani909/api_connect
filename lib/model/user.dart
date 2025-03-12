class User {
  final String name;
  final String email;
  final String phone;
  final String imageUrl;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name']['first'] + ' ' + json['name']['last'],
      email: json['email'],
      phone: json['phone'],
      imageUrl: json['picture']['thumbnail'],
    );
  }
}