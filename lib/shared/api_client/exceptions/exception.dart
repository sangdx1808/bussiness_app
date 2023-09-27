import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rxdart/rxdart.dart';

import '../../../index.dart';

extension FutureExtensions<T> on Future<T> {
  Future<T?> onDioCatchError(BehaviorSubject<String> erbStr) async {
    return catchError((Object error) {
      EasyLoading.dismiss();
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.connectionTimeout:
            break;
          case DioExceptionType.sendTimeout:
            break;
          case DioExceptionType.receiveTimeout:
            break;
          case DioExceptionType.badCertificate:
            break;
          case DioExceptionType.badResponse:
            final data = error.response?.data;
            if (data is Map<String, dynamic>) {
              final response = BaseData.fromJson(data, (json) => json);
              erbStr.add(response.message ?? "");
            }
            break;
          case DioExceptionType.cancel:
            break;
          case DioExceptionType.connectionError:
            break;
          case DioExceptionType.unknown:
            break;
        }
      }
      throw Future<T?>.error(error);
    });
  }

  Future<T?> onApiError(BehaviorSubject<String> erbStr) {
    return then((T response) {
      if (!erbStr.isClosed) {
        if (response is BaseData) {
          if (response.status == NetworkStatus.successAccount ||
              response.status == NetworkStatus.successDeviga) {
            return response;
          }
          erbStr.add(response.message ?? 'Đã có lỗi xảy ra');
          EasyLoading.dismiss();
          throw Exception(response);
        } else if (response is BaseListData) {
          if (response.status == NetworkStatus.successAccount ||
              response.status == NetworkStatus.successDeviga) {
            return response;
          }
          erbStr.add(response.message ?? 'Đã có lỗi xảy ra');
          EasyLoading.dismiss();
          throw Exception(response);
        } else if (response is BaseDataDynamic) {
          if (response.status == NetworkStatus.successUpload) {
            return response;
          }
          erbStr.add(response.message ?? 'Đã có lỗi xảy ra');
          EasyLoading.dismiss();
          throw Exception(response);
        }
      }
      EasyLoading.dismiss();
      throw Exception(response);
    });
  }
}
