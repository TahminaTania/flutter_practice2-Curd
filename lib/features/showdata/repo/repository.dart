import 'dart:convert';

import 'package:flutter_p2/core/constant/constant_apis.dart';
import 'package:flutter_p2/features/showdata/model/usermode.dart';
import 'package:http/http.dart';

class UserRepository {
  String userUrl = apiConstants.BaseUrl + apiConstants.user;

  Future<List<UserModel>> getdata() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}
