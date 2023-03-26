import 'package:equatable/equatable.dart';

class ChatGptResponse extends Equatable {
  final String value;

  const ChatGptResponse({
    required this.value,
  });

  factory ChatGptResponse.fromMap(Map<String, dynamic> map) {
    return ChatGptResponse(
      value: (map['value'] ?? '') as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [value];
}
