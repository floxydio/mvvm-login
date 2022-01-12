// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mvvmlogin/Cubit/AuthCubit/Auth_cubit.dart';
import 'package:mvvmlogin/Home/Home_page.dart';
import 'package:mvvmlogin/Widget/InputForm_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputForm(
                  textEditingController: emailController,
                  label: "Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                InputForm(
                  textEditingController: passwordController,
                  label: "Password",
                  isPassword: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().loginUser(
                          emailController.text, passwordController.text, () {
                        showDialog(
                            context: context,
                            builder: (_) => const AlertDialog(
                                  content: Text("Username Tidak Ditemukan"),
                                ));
                      }, () {
                        showDialog(
                            context: context,
                            builder: (_) => const AlertDialog(
                                  content: Text("Berhasil Login"),
                                ));
                      });
                    },
                    child: const Text("Sign Up"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
