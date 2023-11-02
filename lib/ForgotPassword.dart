import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends StatefulWidget{


  @override
  _Forgot createState()=>_Forgot() ;

  
}
class _Forgot extends State<ForgotPassword>{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Forgot Password"),
      backgroundColor: Colors.lightBlue,
    ),
    body: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: 400,
              height: 100,
              child: SvgPicture.asset("assets/images/logo.svg"),

            ),
          ),
          Padding(padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your email",
              labelText: "Email"
            ),
          ),),

          Padding(padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Create  your password",
                  labelText: " Password"
              ),
            ),),

          Padding(padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Create  your Confirm password",
                  labelText: " Confirm Password"
              ),
            ),),

          Center(
            child: Container(


              width: 300,
              height: 50,

              margin: EdgeInsets.only(top: 40),
              color: Colors.orange,
              child: InkWell(
                onTap: (){

                },
                child: Center(
                  child: Text ("Forgot Password",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                )

              ),
            ),
          )
        ],
      ),

    ),
  );
  }

}