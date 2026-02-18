import 'dart:async';
import 'dart:io';

import 'package:flutter_starter/core/network/client/base_client.dart';
import 'package:flutter_starter/core/utils/app_logger.dart';
import 'package:http/http.dart' as http;

/// Callback that returns the current authorization header value (e.g. "Bearer xxx").
typedef GetAuthorizationHeader = Future<String?> Function();

/// Callback that attempts to refresh the token.
/// Returns `true` if the refresh succeeded.
typedef RefreshTokenCallback = Future<bool> Function();

class AuthorizedClient extends BaseClient {
  AuthorizedClient({
    required GetAuthorizationHeader getAuthorizationHeader,
    required RefreshTokenCallback refreshToken,
  }) {
    client = _AuthorizedBaseClient(
      this,
      getAuthorizationHeader: getAuthorizationHeader,
      refreshToken: refreshToken,
    );
  }
}

class _AuthorizedBaseClient extends BaseHttpClient {
  _AuthorizedBaseClient(
    this.baseClient, {
    required this.getAuthorizationHeader,
    required this.refreshToken,
  }) : super();

  final BaseClient baseClient;
  final GetAuthorizationHeader getAuthorizationHeader;
  final RefreshTokenCallback refreshToken;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    await baseClient.setHeaders(request);
    request.headers['Authorization'] = await getAuthorizationHeader() ?? '';
    final response = await super.send(request);

    if ([
      HttpStatus.unauthorized,
      HttpStatus.forbidden,
    ].contains(response.statusCode)) {
      logger.w(
        // ignore: lines_longer_than_80_chars
        '${request.method} ${request.url} returned 401, refreshing token if possible',
      );

      final refreshed = await refreshToken();

      if (!refreshed) {
        return response;
      }

      logger.w('Token refreshed, retrying initial request');
      request.headers['Authorization'] = await getAuthorizationHeader() ?? '';
      final retryResponse = await client.send(baseClient.copyRequest(request));
      return retryResponse;
    } else {
      return response;
    }
  }
}
