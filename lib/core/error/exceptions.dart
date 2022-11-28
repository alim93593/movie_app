import 'package:movie_app/core/network/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  const ServerException({required  this.errorMessageModel});
}
class LocalDatabaseException implements Exception{
  final ErrorMessageModel errorMessageModel;

  const LocalDatabaseException({required  this.errorMessageModel});
}