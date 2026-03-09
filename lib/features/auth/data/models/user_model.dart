class UserModel {
  final String nut;
  final String token;

  const UserModel({
    required this.nut,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String nut) {
    return UserModel(
      nut: nut,
      token: json['token'] as String,
    );
  }
}