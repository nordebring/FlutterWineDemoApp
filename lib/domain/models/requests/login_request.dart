class LoginRequest {
  final String userName;
  final String password;

  LoginRequest({
    this.userName = '',
    this.password = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['password'] = password;
    return data;
  }
}
