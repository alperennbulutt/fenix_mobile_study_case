// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'package:fenix_mobile_study_case/src/constants/endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MyApiClient {
  final http.Client httpClient;
  MyApiClient({required this.httpClient});

  searchMovie(String movieName) async {
    try {
      var response = await httpClient
          .get(Uri.parse(EndPoint.base_url + EndPoint.apiKey + movieName));
      if (response.statusCode == 200) {
        final results = json.decode(response.body);

        return results;
      } else
        print('error');

      Get.snackbar('Error', 'Something went wrong!');
    } catch (_) {}
  }
}
