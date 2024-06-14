import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_sizes/file_sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_starter/model/api/response/error_response.dart';
import 'package:flutter_starter/model/api/response/hydra_error.dart';
import 'package:flutter_starter/utils/app_logger.dart';
import 'package:flutter_starter/utils/user_agent.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';

class BaseHttpClient extends http.BaseClient {
  @protected
  final http.Client client = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    logger.d(
      // ignore: lines_longer_than_80_chars
      '---> ${request.method} ${request.url} \n\n HEADERS ${request.headers}',
    );

    return client.send(request).catchError((error) {
      logger.e('Failed to send ${request.method} ${request.url}: $error');
      throw Exception(error);
    });
  }
}

class BaseClient {
  BaseHttpClient client = BaseHttpClient();

  Future<void> setHeaders(
    http.BaseRequest request, {
    bool useCustomUserAgent = true,
  }) async {
    request.headers['Content-Type'] = 'application/json';
    request.headers['charset'] = 'utf-8';
    request.headers['Accept'] = 'application/ld+json';
    request.headers['_locale'] = Intl.getCurrentLocale();

    if (useCustomUserAgent && !kIsWeb) {
      request.headers['User-Agent'] = await customUserAgent();
    }
  }

  http.BaseRequest copyRequest(http.BaseRequest request) {
    http.BaseRequest requestCopy;

    if (request is http.Request) {
      requestCopy = http.Request(request.method, request.url)
        ..encoding = request.encoding
        ..bodyBytes = request.bodyBytes;
    } else if (request is http.MultipartRequest) {
      requestCopy = http.MultipartRequest(request.method, request.url)
        ..fields.addAll(request.fields)
        ..files.addAll(request.files);
    } else if (request is http.StreamedRequest) {
      throw Exception('copying streamed requests is not supported');
    } else {
      throw Exception('request type is unknown, cannot copy');
    }

    requestCopy
      ..persistentConnection = request.persistentConnection
      ..followRedirects = request.followRedirects
      ..maxRedirects = request.maxRedirects
      ..headers.addAll(request.headers);

    return requestCopy;
  }

  String _encodeIfNeeded(dynamic body) =>
      body is String ? body : jsonEncode(body);

  /// HEAD
  Future<dynamic> head(String url, {Map<String, String>? headers}) =>
      client.head(Uri.parse(url), headers: headers).then(_processResponse);

  /// GET
  Future<dynamic> get(String url, {Map<String, String>? headers}) =>
      client.get(Uri.parse(url), headers: headers).then(_processResponse);

  /// PUT
  Future<dynamic> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) =>
      client
          .put(Uri.parse(url), headers: headers, body: _encodeIfNeeded(body))
          .then(_processResponse);

  /// POST
  Future<dynamic> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) =>
      client
          .post(Uri.parse(url), headers: headers, body: _encodeIfNeeded(body))
          .then(_processResponse);

  /// PATCH
  Future<dynamic> patch(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) =>
      client
          .patch(Uri.parse(url), headers: headers, body: _encodeIfNeeded(body))
          .then(_processResponse);

  /// DELETE
  Future<dynamic> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) =>
      client
          .delete(Uri.parse(url), headers: headers, body: _encodeIfNeeded(body))
          .then(_processResponse);

  /// SEND FILES
  Future<dynamic> sendFiles(
    String url, {
    Map<String, String>? headers,
    Map<String, File>? files,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));

    if (files != null) {
      await Future.forEach(files.entries,
          (MapEntry<dynamic, dynamic> entry) async {
        final file = entry.value as File;
        final field = entry.key as String;
        logger
            .v('Adding field $field - ${FileSize.getSize(file.lengthSync())}');
        request.files.add(
          http.MultipartFile.fromBytes(
            field,
            await file.readAsBytes(),
            filename: 'image-$field.jpg',
            contentType: MediaType('image', 'jpeg'),
          ),
        );
      });
    }

    logger.v('Posting a binary file');
    return client.send(request).then(_processResponse);
  }

  /// PROCESS RESPONSE AND CHECK FOR ERROR
  Future<dynamic> _processResponse(dynamic response) async {
    Map<String, dynamic>? decodedBody;

    if (response.runtimeType == IOStreamedResponse) {
      response = await http.Response.fromStream(response as IOStreamedResponse);
    }

    if (response.runtimeType == http.Response) {
      final httpResponse = response as http.Response;

      final request = httpResponse.request;
      final body = httpResponse.body;
      final statusCode = httpResponse.statusCode;
      logger
        ..d('<--- ${request?.method ?? ''} returned code $statusCode')
        ..d('\n\n BODY $body');

      try {
        decodedBody = await compute(jsonDecodeOnCompute, body);
      } catch (e) {
        // do nothing
      }
      // Check for error
      if (statusCode < HttpStatus.ok ||
          statusCode >= HttpStatus.multipleChoices) {
        if (decodedBody == null) throw Exception(response);

        if (decodedBody[ResponseError.errorKey] != null) {
          throw ResponseException(ResponseError.fromJson(decodedBody));
        }

        if (decodedBody['hydra:title'] != null) {
          throw HydraException(HydraError.fromJson(decodedBody));
        }

        throw Exception(decodedBody.toString());
      }
    }

    // Success, return response body
    return decodedBody;
  }
}

Map<String, dynamic>? jsonDecodeOnCompute(String data) {
  final result = json.decode(data);
  return result is Map<String, dynamic> ? result : null;
}
