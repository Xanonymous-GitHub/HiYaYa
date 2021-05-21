import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetX;

import '../types/user.dart';

final dioOptions = BaseOptions(
  baseUrl: "https://asia-northeast1-hiyaya-msg.cloudfunctions.net",
);

final dio = Dio(dioOptions).obs;

Future<UserData> requestCreateUser(UserToCreate userToCreate) async {
  final Response<String> response = await dio.value.post<String>(
    '/Users',
    data: userToCreate.toJson(),
  );
  return UserData.fromJson(json.decode(response.data!));
}
