import 'package:flutter/material.dart';
import 'package:flutter_demo_project/PostResponse.dart';
import 'package:flutter_demo_project/api_service.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Welcome>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getPost());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    print(_userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
        backgroundColor: Colors.blue,
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _userModel!.length,
        itemBuilder: (context, index) {
          return Card(


            child: Column(
              children: [
                Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text(_userModel![index].id.toString(),style: TextStyle(fontSize: 20,color: Colors.black)),
                   // Text(_userModel![index].userId.toString()),
                    Text(_userModel![index].title ?? ""),
                    //Text(_userModel![index].body ?? ""),
                  ],
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}