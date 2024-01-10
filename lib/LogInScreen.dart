
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/ForgotPassword.dart';
import 'package:flutter_demo_project/SignUpScreen.dart';
import 'package:flutter_demo_project/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
/*import 'package:fluttertoast/fluttertoast.dart';*/



class LogInScreen  extends StatefulWidget{
  const LogInScreen({Key? key}) : super(key: key);
  @override
  _LoginScreen createState()=>_LoginScreen();

}

class _LoginScreen extends State<LogInScreen>{
  final scafoldkey=new GlobalKey<ScaffoldState>();
  final formkey=new GlobalKey<FormState>();
  _showSnackbar(BuildContext context,String msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }


String emailController="";
String passwordController="";
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       key: scafoldkey,
       appBar: AppBar(
         title: const Text("LogIn Screen"),

       ),
       body: Form(
         key: formkey,
        // margin: const EdgeInsets.only(top: 20),
         child: SingleChildScrollView(
           child: Column(

             children: [

               Padding(padding: const EdgeInsets.only(top: 10),
               child: Center(
                 child: Container(
                   width: 150,
                   height: 150,
                   child: Image.asset('assets/images/img_login.png'),
                 ),


               ),
               ),
                Container(margin: const EdgeInsets.all(20),
               child:  TextFormField(
                 validator:(val)=>!val!.contains("@")?"Email Id is not valid":null ,
                 onSaved: (val)=>emailController=val??"",

                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: "Email",
                   hintText: "Enter your Email",
                   prefixIcon: Icon(Icons.email)

                 ),
               ),
                ),

                Container(margin: const EdgeInsets.all(20),


                 child:  TextFormField(
                   validator: (val)=>val!.length<6?"Password length should be greater than 6":null,
                   onSaved: (val)=>passwordController=val??"",

                   obscureText: true,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: "Password",
                     hintText: "Enter your Secure Password",
                       suffixIcon: Icon(Icons.visibility_off),
                     prefixIcon: Icon(Icons.lock),



                   ),
                 ),),

               FilledButton(onPressed: (){
                 //Fluttertoast.showToast(msg: "Forgot password1");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));

               }, child: const Text("Forgot Password ")),
               ElevatedButton(
                 onPressed: (){


                   if(formkey.currentState!.validate()){
                     formkey.currentState?.save();

                     showDialog(
                         context: context,
                         builder: (BuildContext context) {
                           return AlertDialog(
                             title: Text("AlerDialog"),
                             content: Text("Are you sure you want login this app"),
                             actions: <Widget>[
                               ElevatedButton(
                                 child: Text("ok"),
                                 onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomePage(title: 'Notepad App')));
                                 },
                               )
                             ],
                           );
                         }
                     );
                   }else{
                     _showSnackbar(context,"Wrong Valid");
                   }
                   var value=emailController+" "+passwordController.toString();
                  // Fluttertoast.showToast(msg: "outPutValue:$value");
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