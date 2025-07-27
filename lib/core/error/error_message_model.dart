import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String errorMessage;

  const ErrorModel({required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(errorMessage: json["data"]["error"]);
  }

  @override
  List<Object?> get props => [errorMessage];
}
