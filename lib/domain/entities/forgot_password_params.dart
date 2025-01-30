class ForgotPasswordParams {

  final String email;

  ForgotPasswordParams({required this.email,});

  factory ForgotPasswordParams.fromJson(Map<String, dynamic> json) => ForgotPasswordParams(
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
