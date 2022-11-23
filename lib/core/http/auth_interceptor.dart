import 'package:dio/dio.dart';
import 'package:kayou_cards/core/sources/local_storage_source.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final bearer =
        await LocalStorageSource.getString(LocalStorageKeys.access_token);

    options.headers.addAll({'Authorization': 'Bearer $bearer'});

    print(options.headers);

    return super.onRequest(options, handler);
  }
}
