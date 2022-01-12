// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class LoginInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class CheckLogin extends AuthState {
  final Map<String, dynamic> data;

  CheckLogin(this.data);
  @override
  List<Object?> get props => [data];
}
