import 'package:flutter/material.dart';
import 'package:flutter_demo_project/HiveDBFun.dart';
import 'package:flutter_demo_project/HomePage.dart';
import 'package:flutter_demo_project/LogInScreen.dart';
import 'package:flutter_demo_project/container.dart';
import 'package:flutter_demo_project/listView.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';



Future main() async {
  // It is used so that void main function can
  // be intiated after successfully intialization of data
  WidgetsFlutterBinding.ensureInitialized();

  // To intialise the hive database
  await Hive.initFlutter();

  // To open the user hive box
   await Hive.openBox(userHiveBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LogInScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  const MyHomePage({super.key, required this.title});


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List myHiveData = [];

  // TextFields' controllers for adding  or updating data
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // To Update the data from Hive in local variable
  getHiveData() {
    myHiveData = HiveFunctions.getAllUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // Update the initial data
    // when page is loading
    getHiveData();
  }


 /* void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.lightBlue,
       // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),

        actions: [
          // To refreah the Data stored in Hive
          IconButton(
              onPressed: () {
                getHiveData();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myHiveData.isEmpty // To show when no data is stored
              ? const Center(
              child: Text(
                "No Data is Stored",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ))
          // To show when data is stored
              : Column(
              children: List.generate(myHiveData.length, (index) {
                final userData = myHiveData[index];
                return Card(
                  child: ListTile(
                    title: //Show Name of user stored in data base
                    Text("Title : ${userData["title"]}"),
                    subtitle: //Show Email of user stored in data base
                    Text("Description : ${userData["description"]}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // To edit the data stored
                        IconButton(
                            onPressed: () {
                              showForm(userData["key"]);
                            },
                            icon: const Icon(Icons.edit)),
                        // To delete the data stored
                        IconButton(
                            onPressed: () {
                              HiveFunctions.deleteUser(userData["key"]);
                              // To refreah the Data stored in Hive after deletion
                              getHiveData();
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              }).toList()),
        ),

    floatingActionButton: FloatingActionButton.extended(
          label: const Text("Add Data"),
          icon: const Icon(Icons.add),

          backgroundColor: Colors.lightBlue,
          onPressed: () {
            showForm(null);
          }),

      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(color: Colors.lightBlue),

                accountName: Text(
                  "Ruchi Gupta",
                  style: TextStyle(fontSize: 18),textAlign: TextAlign.center,
                ),
                accountEmail: Text("ruchi@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.yellowAccent,
                  child: Text(
                    "R",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>container()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
      //Drawer



    );

  }
// dialog box to create or update the data in hive
  void showForm(int? itemKey) async {
    // itemKey == null -> create new item
    // itemKey != null -> update an existing item

    if (itemKey != null) {
      // To find the existing item in our  local database
      final existingItem =
      myHiveData.firstWhere((element) => element['key'] == itemKey);
      titleController.text = existingItem['title'];
      descriptionController.text = existingItem['description'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 15,
              left: 15,
              right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                    itemKey == null ? 'Create New' : 'Update',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  )),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: descriptionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: 'Description'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Save new item
                  if (itemKey == null) {
                    HiveFunctions.createUser({
                      "description": descriptionController.text,
                      "title": titleController.text
                    });
                  }

                  // update an existing item
                  if (itemKey != null) {
                    HiveFunctions.updateUser(itemKey, {
                      "email": descriptionController.text,
                      "title": titleController.text
                    });
                  }

                  // Clear the text fields
                  titleController.text = '';
                  descriptionController.text = '';

                  Navigator.of(context).pop(); // Close the bottom sheet
                  // To refresh the Data stored in Hive after updation
                  getHiveData();
                },
                child: Text(itemKey == null ? 'Create New' : 'Update'),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ));
  }

}
