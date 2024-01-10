import 'package:flutter/material.dart';
import 'package:flutter_demo_project/WebViewContainer.dart';
import 'package:flutter_demo_project/listView.dart';

class container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Tabs Demo'),
            bottom: TabBar(

              tabs: [
                Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
                Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
             Home(),
              WebViewExample(),
            ],
          ),
        ),
      ),
    );
  }
}

class WebViewExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: WebViewContainer(),


   );
  }
}


