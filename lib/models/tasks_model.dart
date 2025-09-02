import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_app/utils/routes/api.dart';

Future<Map<String, dynamic>> getTasks() async {
  try {
    final response = await http.get(Uri.parse(Api.getTasksSteven));
    // print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {};
    }
  } catch (e) {
    return {};
  }
}
