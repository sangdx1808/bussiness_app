import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as prefix;

import '../../../index.dart';

class DioInterceptors extends InterceptorsWrapper {
  final LocalStorage _localStorage;
  bool? showLoading;
  final String tokenKey;

  DioInterceptors(this._localStorage, this.tokenKey);

  @override
  Future<RequestOptions> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    super.onRequest(options, handler);

    final String token = await _localStorage.get(tokenKey) ?? '';
    final headers = <String, dynamic>{};
    headers["locale"] = prefix.Get.locale?.languageCode;

    headers['ServiceName'] = 'Service ${Constants.baseServiceNameMetaWorld}';
    Xlogger.d('$tokenKey: $token');
    if (token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
      // headers["access_token"] = token;
    }
    options.headers.addAll(headers);
    options.queryParameters.addAll({'lang': prefix.Get.locale?.languageCode});

    if (kDebugMode) {
      /// Log CURL
      log('>>>>>>>>CURL:\n ${options.toCURL()}');
    }
    return options;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    ServerExceptionError.withError(error: err);
  }

  Future<Response> retryToken(Response response) async {
    return response;
  }
}
