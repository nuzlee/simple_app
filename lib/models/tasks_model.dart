import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_app/utils/routes/api.dart';

Future<Map<String, dynamic>> getTasks() async {
  try {
    final response = await http.get(Uri.parse(Api.getTasksSteven));
    // final response = await http.get(Uri.parse(Api.getTasksMicheal));
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

Future<Map<String, dynamic>> postFormCreateTask(
  userId,
  taskTitle,
  taskDesc,
) async {
  try {
    Uri url = Uri.parse(Api.postFormCreateTask);

    final response = await http.post(
      url,
      body: {'user_id': userId, 'task_title': taskTitle, 'task_desc': taskDesc},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {};
    }
  } catch (e) {
    return {};
  }
}
