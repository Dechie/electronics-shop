

class User {
  final String name;
  final String phone;
  final String cardNumber;
  final String? password;
  final String token;

  User({
    required this.name,
    required this.phone,
    required this.cardNumber,
    this.password,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      phone: json['phone'],
      cardNumber: json['cardNumber'],
      token: json['token'],
    );
  }
}
