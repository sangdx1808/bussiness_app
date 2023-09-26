import 'package:dio/dio.dart';

import '../../index.dart';

abstract class IUploadRepository {
  Future<BaseDataDynamic> uploadFile(String filePath);
  Future<String?> downloadFile(String url);
}

class UploadRepository implements IUploadRepository {
  final ApiUploadClient _apiClient;

  UploadRepository(this._apiClient);

  @override
  Future<BaseDataDynamic> uploadFile(String filePath) async {
    final response = await _apiClient.post(
      // Check again when api
      "",
      data: FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
      }),
    );
    final BaseDataDynamic result = BaseDataDynamic.fromJson(response.data!);
    return result;
  }

  @override
  Future<String?> downloadFile(String url) async {
    final response = await _apiClient.download(
      url,
    );
    return response;
  }
}
