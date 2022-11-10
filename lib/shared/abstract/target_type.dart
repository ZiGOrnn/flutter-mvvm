import 'package:http/http.dart';

abstract class TargetType {
  String baseURL();
  String path();
  Future<Response> request(Uri uri);
}
