import 'package:http/http.dart';

abstract class TargetType {
  String get baseURL;
  String get path;
  String get url;
  Future<Response> request();
}
