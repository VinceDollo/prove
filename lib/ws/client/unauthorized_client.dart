import 'dart:async';

import 'package:flutter_starter/ws/client/base_client.dart';
import 'package:http/http.dart' as http;

class UnauthorizedClient extends BaseClient {
  UnauthorizedClient() {
    client = _UnauthorizedClient(this);
  }
}

class _UnauthorizedClient extends BaseHttpClient {
  _UnauthorizedClient(this.baseClient) : super();
  final BaseClient baseClient;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    await baseClient.setHeaders(request);

    final response = await super.send(request);
    return response;
  }
}
