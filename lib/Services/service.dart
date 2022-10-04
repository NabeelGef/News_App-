import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Constant/constant.dart';
import '../model/data.dart';

class API {
  Future<Info> getEveryThing(String data) async {
    var url = Constant.EditUrl(data);
    var res = await http.get(url);
    Info info = Info.fromJson(json.decode(res.body));
    return info;
  }
}
