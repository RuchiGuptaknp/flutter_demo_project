
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/ForgotPassword.dart';
import 'package:flutter_demo_project/SignUpScreen.dart';
import 'package:flutter_demo_project/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';




class LogInScreen  extends StatefulWidget{
  const LogInScreen({Key? key}) : super(key: key);
  @override
  _LoginScreen createState()=>_LoginScreen();

}

class _LoginScreen extends State<LogInScreen>{


TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: const Text("LogIn Screen"),

       ),
       body: Container(
         margin: const EdgeInsets.only(top: 20),
         child: Column(

           children: [
             Padding(padding: const EdgeInsets.only(top: 10),
             child: Center(
               child: Container(
                 width: 200,
                 height: 150,
                 child: SvgPicture.asset('assets/images/logo.svg'),
               ),


             ),
             ),
              Container(margin: const EdgeInsets.all(20),
             child: const TextField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Email",
                 hintText: "Enter your Email",

               ),
             ),
              ),

              Container(margin: const EdgeInsets.all(20),


               child: const TextField(
                 obscureText: true,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: "Password",
                   hintText: "Enter your Secure Password",

                 ),
               ),),

             FilledButton(onPressed: (){
               Fluttertoast.showToast(msg: "Forgot password1");
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));

             }, child: const Text("Forgot Password ")),
             ElevatedButton(
               onPressed: (){
                 var value=emailController.text+" "+passwordController.text.toString();
                 Fluttertoast.showToast(msg: "outPutValue:$value");
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomePage(title: 'Home Page')));
               },child: const Text("LogIn" ,style: TextStyle(color: Colors.black,fontSize: 30,fontStyle: FontStyle.normal),

             ),
             ),
             Container(
               margin: const EdgeInsets.only(top: 30),
               child: SizedBox(



                   child:GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));

                     },
                     child: const Text("crete new User Account?",style: TextStyle(fontSize: 20),),
                   ),

               ),
             ),

           ],
         ),

       ),

     ),
   );
  }

}