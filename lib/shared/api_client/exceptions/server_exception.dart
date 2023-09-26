import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ServerExceptionError implements Exception {
  String _errorMessage = "";

  ServerExceptionError.withError({
    required DioException error,
  }) {
    _handleError(error);
  }

  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection timeout";
        break;
      case DioExceptionType.unknown:
        _errorMessage = "Connection failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioExceptionType.badResponse:
        // final code = error.response?.statusCode;
        EasyLoading.dismiss();
        // ToastUtil.showToast(
        //   error.response?.data['message']?.toString() ??
        //       error.response?.statusMessage ??
        //       "",
        // );
        throw error;
      case DioExceptionType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
      default:
        break;
    }
    return _errorMessage;
  }
}
