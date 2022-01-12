// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvmlogin/Cubit/AuthCubit/Auth_state.dart';
import 'package:mvvmlogin/Services/Services.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());

   loginUser(String username, String password, VoidCallback onFailed,
      VoidCallback onSuccess) async {
    var response = await ApiService().loginUser(username, password);
    emit(CheckLogin(response));
    if (response["status"] != 200) {
      onFailed();
    } else if (response["status"] == 200) {
      onSuccess();
    }
  }
}
