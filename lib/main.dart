import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvmlogin/Cubit/AuthCubit/Auth_cubit.dart';
import 'AuthPages/Login_Page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => AuthCubit())],
        child: const LoginPage(),
      ),
    ));
