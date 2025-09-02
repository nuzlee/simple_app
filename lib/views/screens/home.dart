import 'package:flutter/material.dart';
import 'package:simple_app/models/tasks_model.dart';
import 'package:simple_app/utils/components/custom_appbar.dart';
import 'package:simple_app/utils/components/custom_listtile.dart';
// import 'package:simple_app/utils/components/custom_navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> result = {};
  List<dynamic> tasksList = [];
  List<dynamic> activeTasksList = [];
  List<dynamic> incompletedTasksList = [];
  String userId = '';
  bool status = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    setState(() {
      isLoading = true;
    });

    result = await getTasks();

    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    status = result['success'];
    tasksList = result['tasks'];
    tasksList.forEach((task) {
      if (task['task_status'] == 'ACTIVE') {
        activeTasksList.add(task);
      } else if (task['task_status'] == 'INCOMPLETE') {
        incompletedTasksList.add(task);
      }
    });
    userId = result['user_id'];

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print('test');
          getTasks();
        },
      ),
      backgroundColor: Color(0xFFFF6D4D),
      appBar: CustomAppbar(title: 'Home'),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Kotak Welcome User
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
                            'Welcome, User!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10), //gap text dengan icon
                          Icon(Icons.account_circle),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20), //jarak antara widget
                  //Kotak Task List
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    height: 500,
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: Colors.yellow,
                            unselectedLabelColor: Colors.white,
                            indicatorColor: Colors.yellow,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(text: 'To Do'),
                              Tab(text: 'Missed'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                ListView.builder(
                                  itemCount: activeTasksList.length,
                                  itemBuilder: (context, index) {
                                    return CustomListtile(
                                      title:
                                          activeTasksList[index]['task_title'],
                                      subtitle:
                                          activeTasksList[index]['task_desc'],
                                      trailing:
                                          activeTasksList[index]['task_status'],
                                    );
                                  },
                                ),
                                Center(child: Text('Missed')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: Center(
              child: CircularProgressIndicator(color: Colors.green),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: CustomNavbar(),
    );
  }
}
