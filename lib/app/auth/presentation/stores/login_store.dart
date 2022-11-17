import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:kayou_cards/app/auth/data/datasources/auth_datasource.dart';
import 'package:kayou_cards/app/auth/domain/models/dtos/sign_in_dto.dart';
import 'package:kayou_cards/core/service_locator.dart';
import 'package:kayou_cards/core/sources/local_storage_source.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final authService = serviceLocator<AuthDatasource>();

  @observable
  bool isLoading = false;

  @action
  setLoading(bool value) => isLoading = value;

  @observable
  String errorMessage = "";

  @action
  _setErrorMessage(String value) => errorMessage = value;

  @observable
  SignInDto formSignIn = SignInDto();

  @action
  setFormSignIn(SignInDto value) => formSignIn = value;

  @observable
  bool isPasswordHidden = true;

  Future<void> init(BuildContext context) async {
    try {
      setLoading(true);

      authService.reset();
      // cardService.reset();
      // collectionService.reset();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> signIn() async {
    setLoading(true);

    try {
      if (authService.validateFormSignIn(formSignIn) != null) {
        _setErrorMessage(authService.validateFormSignIn(formSignIn)!);

        return false;
      }

      LocalStorageSource.setString('user_username', formSignIn.username);
      LocalStorageSource.setString('user_password', formSignIn.password);

      await authService.signIn(formSignIn);

      return true;
    } on DioError catch (e) {
      _setErrorMessage(e.message);

      if (e.response != null) {
        _setErrorMessage(e.message);
      } else {
        _setErrorMessage(e.message);
      }

      return false;
    } finally {
      setLoading(false);
    }
  }

  @action
  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    print(isPasswordHidden);
    print("buttom clicked");
  }

  String? validateLogin(String? text) {
    if (text!.isEmpty) return "empty username";
    return null;
  }

  String? validatePassword(String? text) {
    if (text!.isEmpty) return "empty password";

    return null;
  }
}
