class ChangePasswordParams {
  String userId;
  String otp;
  String password;

  ChangePasswordParams({
    required this.userId,
    required this.otp,
    required this.password,
  });

  factory ChangePasswordParams.fromJson(Map<String, dynamic> json) => ChangePasswordParams(
    userId: json["userId"],
    otp: json["otp"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "otp": otp,
    "password": password,
  };
}