class ChatGptRequest {
  final String token;
  final String question;

  ChatGptRequest({
    this.token = '',
    this.question = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['question'] = question;
    return data;
  }
}
