import 'dart:async';
import 'dart:io';

import 'package:flutter_starter/managers/shared_preferences.dart';
import 'package:flutter_starter/model/api/response/bearer_token.dart';
import 'package:flutter_starter/utils/app_logger.dart';
import 'package:flutter_starter/ws/client/base_client.dart';
import 'package:flutter_starter/ws/ws_auth.dart';
import 'package:http/http.dart' as http;

class AuthorizedClient extends BaseClient {
  AuthorizedClient() {
    client = _AuthorizedBaseClient(this);
  }
}

class _AuthorizedBaseClient extends BaseHttpClient {
  _AuthorizedBaseClient(this.baseClient) : super();
  final BaseClient baseClient;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    await baseClient.setHeaders(request);
    request.headers['Authorization'] = (await loadBearerToken())?.header ?? '';
    final response = await super.send(request);

    if ([
      HttpStatus.unauthorized,
      HttpStatus.forbidden,
    ].contains(response.statusCode)) {
      logger.w(
        // ignore: lines_longer_than_80_chars
        '${request.method} ${request.url} returned 401, refreshing token if possible',
      );

      final result = await refreshToken();

      if (!result.isSuccess || result.data is! BearerToken) {
        return response;
      }

      logger.w('Token refreshed, retrying initial request');
      request.headers['Authorization'] = (await loadBearerToken())?.header ?? '';
      final retryResponse = await client.send(baseClient.copyRequest(request));
      return retryResponse;
    } else {
      return response;
    }
  }
}
