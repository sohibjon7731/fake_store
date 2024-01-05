// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerExseption implements Exception {
  final String errorMassege;
  final String errorCode;
  ServerExseption({
    required this.errorMassege,
    required this.errorCode,
  });

  @override
  String toString() => 'ServerExseption(errorMassege: $errorMassege, errorCode: $errorCode)';
}
