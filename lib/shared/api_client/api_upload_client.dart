import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../index.dart';


class ApiUploadClient {
  final LocalStorage localStorage;
  final Dio dio;
  late DioInterceptors _interceptors;

  ApiUploadClient(this.dio, this.localStorage) {
    dio.options.baseUrl = dotenv.get('BASE_URL_UPLOAD');
    dio.options.connectTimeout = const Duration(minutes: 5);
    dio.options.receiveTimeout = const Duration(minutes: 5);

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
    final alice = AliceUtils().alice;
    dio.interceptors.add(alice!.getDioInterceptor());
    _interceptors = DioInterceptors(localStorage, PrefKeys.token);
    dio.interceptors.add(_interceptors);
  }

  Future<Response<Map<String, dynamic>>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final res = await dio.post<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return res;
  }

  Future<Response<Map<String, dynamic>>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    final res = await dio.put<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: query,
    );
    return res;
  }

  Future<Response<Map<String, dynamic>>> delete(
    String path, {
    Map<String, dynamic>? param,
    Map<String, dynamic>? data,
  }) async {
    final res = await dio.delete<Map<String, dynamic>>(
      path,
      queryParameters: param,
      data: data,
    );
    return res;
  }

  Future<Response<Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic>? param,
  }) async {
    final res =
        await dio.get<Map<String, dynamic>>(path, queryParameters: param);
    return res;
  }

  //download
  Future<String> download(
    String url, {
    Map<String, dynamic>? param,
  }) async {
    // get file name
    final fileName = url.split('/').last;
    final path = (await getTemporaryDirectory()).path + fileName;
    await dio.download(
      url,
      path,
      queryParameters: param,
    );
    return path;
  }
}