import 'dart:convert';

Map<String, dynamic> jsonDecodeOnCompute(dynamic data) {
  final result = data is String ? json.decode(data) : null;
  return result is Map<String, dynamic> ? result : {};
}
