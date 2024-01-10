import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  void initState(){
    super.initState();
    // screenWidth = MediaQuery.of(context).size.width;
    //  screenHeight = MediaQuery.of(context).size.height;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              width: double.infinity,
              color: Colors.lightBlueAccent,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 50),
                          padding: const EdgeInsets.all(20)),
                      // Image(image: Image.asset("assets/images/ic_notification.svg"))
                      const Icon(Icons.notification_important_sharp),
                      const Icon(Icons.menu)
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hi Narendra",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Welcome to oakridge International School",
                          style: TextStyle(fontSize: 15),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(

              width: 380,
              height: 50,
              margin: EdgeInsets.all(10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Message For Nainaika ", style:  TextStyle(fontSize: 18,
                      color: Colors.black,fontWeight:FontWeight.bold ),),
                  Text("View All",style: TextStyle(fontSize: 18,
                      color: Colors.lightBlueAccent,fontWeight:FontWeight.bold ),),
                  Icon(Icons.arrow_forward_ios)
                ],

              ),




            ),
            SizedBox(
              height: 200,

              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,itemCount: 5,
                itemBuilder: ( context,  index) {
                  return    Row(
                    children: [

                    Container(width: 120,
                    height: 110,
                    margin: EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle
                    ),

                    child:

                    Image.network("https://picsum.photos/seed/picsum/200/300",fit: BoxFit.cover,),),


                    ],
                  );
                },
              ),

            ),



    // )

            Container(
              margin: const EdgeInsets.all(10),
              // width: ,
              height: 30,
              color: Colors.white,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "NoticeBoard",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    "ViewAll",
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
SizedBox(
  height: 350,
  child: ListView.builder(
  scrollDirection: Axis.horizontal,itemCount: 5,
    shrinkWrap: true,
    itemBuilder: (context,index){
    return Center(
      child: Row(
        children: [

          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: 250,

            // height: 300,
            // height: screenHeight,
            color: Colors.cyan,
            alignment: Alignment.center,

            child: Column(

            children: [
             Image.asset("assets/images/school_announcement.jpg",
               fit: BoxFit.contain,
             ),

              Text("Oakridge Book Fair"),
              Text("We are going to held a book fair on 16th july\n  at our school permisses from 10"),
              Text("10 July 2020")
            ],

            ),

          ),
        ],
      ),
    );




    }),




),
        ]
        ),
      ),
      //New
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home ",
              backgroundColor: Colors.lightBlueAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_for_education),
            label: "Education",
              backgroundColor: Colors.lightBlueAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: "Services",
              backgroundColor: Colors.lightBlueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            backgroundColor: Colors.lightBlueAccent,

            label: "Chat",
          )
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
