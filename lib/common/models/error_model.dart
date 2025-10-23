class ErrorModel {
  final String? message;

  ErrorModel({this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(message: json['message']?.toString());
  }

  factory ErrorModel.fromString(String string) {
    return ErrorModel(message: string);
  }

  @override
  String toString() => message ?? 'Unknown error';
}
