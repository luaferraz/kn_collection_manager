// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_datasource.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthDatasource on _AuthDatasourceBase, Store {
  late final _$currentUserAtom =
      Atom(name: '_AuthDatasourceBase.currentUser', context: context);

  @override
  UserModel get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$_AuthDatasourceBaseActionController =
      ActionController(name: '_AuthDatasourceBase', context: context);

  @override
  dynamic setCurrentUser(UserModel value) {
    final _$actionInfo = _$_AuthDatasourceBaseActionController.startAction(
        name: '_AuthDatasourceBase.setCurrentUser');
    try {
      return super.setCurrentUser(value);
    } finally {
      _$_AuthDatasourceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateFormSignIn(SignInDto signInDTO) {
    final _$actionInfo = _$_AuthDatasourceBaseActionController.startAction(
        name: '_AuthDatasourceBase.validateFormSignIn');
    try {
      return super.validateFormSignIn(signInDTO);
    } finally {
      _$_AuthDatasourceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser}
    ''';
  }
}
