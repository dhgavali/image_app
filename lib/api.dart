import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:image_picker/image_picker.dart';

String uploadUrl = "http://192.168.43.232:5000/api";
String downloadUrl = "http://192.168.43.232:5000/result";

FutureOr<Map> getData(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return jsonDecode(response.body);
}

FutureOr<Response> uploadImage(XFile imageFile, String url) async {
  List<int> bytes = await imageFile.readAsBytes();
  String base64Image = base64Encode(bytes);
  Response response = await Dio().post(url, data: base64Image);
  return response;
}
