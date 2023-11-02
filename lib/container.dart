
import 'package:flutter/material.dart';

class ContainerApp extends StatelessWidget  {
  const ContainerApp({Key? key}):super(key :key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: const Text("Container Example"),
       ),
       body: Center(
         child: Container(
           height: 300,
           width: double.infinity,
          // color: Colors.pink,
           alignment: Alignment.center,
           padding: EdgeInsets.all(20),
           margin: EdgeInsets.all(30),
           transform: Matrix4.rotationZ(0.1),
           decoration: BoxDecoration(
             border: Border.all(color: Colors.black,width: 3)
           ),
           child: Stack(
             fit: StackFit.passthrough,
             alignment: Alignment.topCenter,
             children: [
               Container(
                 height: 300,
                 width: 400,
                 color: Colors.lightBlue,
                 child: Center(
                   child: Text("Top Widget Green",style: TextStyle(color: Colors.white,fontSize: 20),
                   ),






                 ),


               ),
               Positioned(
                 top: 30,
                   right: 20,
                   child: Container(
                     height: 100,
                     width: 150,
                     color: Colors.blue,
                     child: Center(
                       child: Text(
                         "Middle Widgets",style: TextStyle(color:Colors.white,fontSize: 20),
                       ),
                     ),

                   ),
               ),
               Positioned(
                 top: 30
                   ,left: 20,
                   child: Container(
                     height: 100,
                     width: 150,
                     color: Colors.orange,
                     child: Center(
                       child: Container(
                         child: Text(
                           "Third Widgets",style: TextStyle(color: Colors.yellowAccent,fontSize: 20),
                         ),

                       ),
                     ),
                   ))



             ],
           ) //Text("Hello I am inside a Container",style: TextStyle(fontSize: 20),),



         ),
       ),



     ),

   );
  }
}
