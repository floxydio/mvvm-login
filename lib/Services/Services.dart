// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmlogin/Services/Services_Url.dart';

class ApiService {
  Future<dynamic> loginUser(String username, String password) async {
    var formData = FormData.fromMap({
      "username": username,
      "password": password,
    });

    try {
      Response response =
          await Dio().post(ServicesURL.BASE_URL + ServicesURL.LOGIN,
              data: formData,
              options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
              ));
      if (kDebugMode) {
        print(response.data);

        return response.data;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      } else {
        throw Exception(e);
      }
    }
  }
}
