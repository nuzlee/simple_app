import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/models/tasks_model.dart';
import 'package:simple_app/utils/components/custom_appbar.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Map<String, dynamic> result = {};
  TextEditingController userIdController = TextEditingController();
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescController = TextEditingController();
  bool isLoading = false;

  Future<void> submitForm() async {
    setState(() {
      isLoading = true;
    });

    result = await postFormCreateTask(
      userIdController.text,
      taskTitleController.text,
      taskDescController.text,
    );

    if (result["success"] == true) {
      // Handle successful form submission
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Success"),
          content: Text(result["message"]),
          actions: [
            TextButton(
              child: Text('Return'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF6D4D),
      appBar: CustomAppbar(title: 'Form Create Task'),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //Kotak "Form Create Task"
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Form Create Task',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10), //gap text dengan icon
                          Icon(Icons.note),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Kotak "Input Field"
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: userIdController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User ID',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: taskTitleController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Title',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: taskDescController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task Description',
                          ),
                          maxLines: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Button "Submit"
                  ElevatedButton(
                    onPressed: () {
                      submitForm();
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: Center(
              child: CircularProgressIndicator(
                color: CupertinoColors.activeGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
