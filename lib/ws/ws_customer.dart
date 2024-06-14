import 'dart:async';

import 'package:flutter_starter/model/api/response/customer.dart';
import 'package:flutter_starter/model/api/response/hydra_error.dart';
import 'package:flutter_starter/ws/api.dart';
import 'package:flutter_starter/ws/client/authorized_client.dart';
import 'package:flutter_starter/ws/client/unauthorized_client.dart';

/// Register a user
/// Return true if customer is created, false otherwise
Future<bool> registerCustomer(Customer customer) async {
  return UnauthorizedClient()
      .post(
        Api.customerRegister.apiEndpoint(),
        body: customer.toJson(),
      )
      .then((response) => true)
      .catchError(
        (onError) => throw Exception(
          onError is HydraError ? onError.displayError : null,
        ),
      );
}

Future<Customer?> getCustomerProfile() {
  return AuthorizedClient()
      .get(Api.customerProfile.apiEndpoint())
      .then(
        (data) => data == null
            ? null
            : Customer.fromJson(data as Map<String, dynamic>),
      )
      .catchError(
        (onError) => throw Exception(
          onError is HydraError ? onError.displayError : null,
        ),
      );
}

Future<Customer?> updateCustomerProfile(Customer customer) {
  return AuthorizedClient()
      .put(Api.customerProfile.apiEndpoint(), body: customer.toJson())
      .then((data) {
    return data == null
        ? null
        : Customer.fromJson(data as Map<String, dynamic>);
  }).catchError((onError) {
    throw Exception(onError is HydraError ? onError.displayError : null);
  });
}
