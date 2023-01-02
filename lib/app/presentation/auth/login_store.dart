import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:kayou_cards/app/data/datasources/auth_datasource.dart';
import 'package:kayou_cards/app/data/models/dtos/sign_in_dto.dart';
import 'package:kayou_cards/core/service_locator.dart';
import 'package:kayou_cards/core/sources/local_storage_source.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final authDatasource = serviceLocator<AuthDatasource>();

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

      authDatasource.reset();

      formSignIn.username = "lua";
      formSignIn.password = "Lfldl!23se#es\$Nasj@";
      // cardService.reset();
      // collectionService.reset();
    } catch (err) {
      print(err);
    }
  }

  Future<bool> signIn() async {
    setLoading(true);

    try {
      if (authDatasource.validateFormSignIn(formSignIn) != null) {
        _setErrorMessage(authDatasource.validateFormSignIn(formSignIn)!);

        return false;
      }

      LocalStorageSource.setString('user_username', formSignIn.username);
      LocalStorageSource.setString('user_password', formSignIn.password);

      await authDatasource.signIn(formSignIn);

      return true;
    } catch (err) {
      rethrow;
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
