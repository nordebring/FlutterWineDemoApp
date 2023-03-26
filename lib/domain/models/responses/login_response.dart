import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String token;
  final String expiration;

  const LoginResponse({
    required this.token,
    required this.expiration,
  });

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      token: (map['token'] ?? '') as String,
      expiration: (map['expiration'] ?? '') as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [token, expiration];
}
