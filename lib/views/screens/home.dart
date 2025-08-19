import 'package:flutter/material.dart';
import 'package:simple_app/utils/components/custom_appbar.dart';
import 'package:simple_app/utils/components/custom_listtile.dart';
import 'package:simple_app/utils/components/custom_navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF6D4D),
      appBar: CustomAppbar(title: 'Kementerian Ekonomi'),
      body: Center(
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
                            ListView(
                              children: [
                                CustomListtile(
                                  title: 'Submit Application Form',
                                  subtitle: 'Form Sample ABC',
                                  trailing: '19/8/2025',
                                ),
                                CustomListtile(
                                  title: 'Attend Event ABC',
                                  subtitle: 'At PICC',
                                  trailing: '20/8/2025',
                                ),
                              ],
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
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
