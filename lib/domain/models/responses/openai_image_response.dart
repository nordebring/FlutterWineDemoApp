import 'package:equatable/equatable.dart';

class OpenAiImageResponse extends Equatable {
  final String result;
  final String value;

  const OpenAiImageResponse({
    required this.result,
    required this.value,
  });

  factory OpenAiImageResponse.fromMap(Map<String, dynamic> map) {
    return OpenAiImageResponse(
      result: (map['result'] ?? '') as String,
      value: (map['value'] ?? '') as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [result, value];
}
