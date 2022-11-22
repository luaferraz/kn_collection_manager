import 'package:kayou_cards/app/auth/domain/models/dtos/sign_in_dto.dart';
import 'package:kayou_cards/app/auth/domain/models/dtos/sing_up_dto.dart';
import 'package:kayou_cards/app/auth/domain/models/dtos/sso_dto.dart';
import 'package:kayou_cards/core/http/http_service.dart';
import 'package:kayou_cards/core/sources/api_source.dart';

// import '../sources/api.source.dart' as endpoints;

class AuthRepository {
  Future<SsoDTO> signIn(SignInDto signInDto) async {
    String url = ApiSource().signIn;

    final dio = HttpService().instance;

    final retSignIn = await dio.post(url, data: signInDto.toJson());

    return SsoDTO.fromJson(retSignIn.data);
  }

  Future<bool> signUp(SignUpDto signUpDto) async {
    String url = ApiSource().signUp;

    final dio = HttpService().instance;

    await dio.post(url, data: signUpDto.toJson());

    return true;
  }
}
