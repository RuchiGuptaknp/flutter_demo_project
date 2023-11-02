import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Signup extends StatefulWidget  {
  @override
  _Signup createState()=>_Signup();

}
class _Signup extends State<Signup>{
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
       title: const Text("Signup"),
     backgroundColor: Colors.lightBlue,

     /* leading: const Icon(Icons.arrow_back,
      ),*/



     ),
     body: Container(


       margin: const EdgeInsets.all(20),

       child: Column(


         children: [
           Padding(padding: const EdgeInsets.all(10),
             child:Container(
               width: 200,
               height: 100,
               child: SvgPicture.asset("assets/images/logo.svg"),


             ),
           ),
const Padding(padding: EdgeInsets.all(10),
child: TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: "Name",
    hintText: "Enter Your Name",

  ),

),
),
           const Padding(padding: EdgeInsets.all(10),
             child: TextField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Email",
                 hintText: "Enter your  email "

               ),



             ),
           ),


           const Padding(padding: EdgeInsets.all(10),
             child: TextField(
               decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: " Passord",
                   hintText: "Enter your  password "

               ),


             ),
           ),

           Container(
             width: 200,
             height: 50,
             margin: EdgeInsets.only(top: 40),



             child: FilledButton(


               onPressed: () {

               },
               child: Center(


                 child: (
                     Text("SignUP",style: TextStyle(
                         fontSize: 10,color: Colors.white
                     ),)
                 ),
               )


             ),
             ),



           Container(
             margin: const EdgeInsets.only(top: 20),
             child: const Text(
               "Already User SignIn?"
             ),
           ),

         ],

       ),


     ),
   );
  }

}