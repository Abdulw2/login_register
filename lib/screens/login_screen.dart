import 'package:flutter/material.dart';
import 'package:login_register/model/person.dart';
import 'package:login_register/screens/register.dart';
import 'package:login_register/util/db_handler.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
final TextEditingController _txtname = TextEditingController();
// it monitors changes made within
final TextEditingController _txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color.fromARGB(255, 149, 44, 44),
      //using color rgb is possible too.
      appBar: AppBar(
        title: const Text("Online cinema"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 198,
            color: Colors.white,
            //color codes are fine too.
            ),
             TextField(
              controller: _txtname,
              decoration: const InputDecoration(
                labelText: "Username/Account ID",
                hintText: "Enter Your Username/Account ID",
              ),
            ),
            
             TextField(
              controller:_txtpassword,
              decoration: const InputDecoration(
                labelText: "Password",
                hintText: "Enter Your Password",
                hoverColor: Colors.lightBlue,
                focusColor: Colors.black,
                
              ),
            ),
            TextButton(
              onPressed: () async{ 
               // Navigator.push(context, MaterialPageRoute(builder: ((context) => const RegisterScreen())));
               Person person = Person(name:_txtname.text, password: _txtpassword.text);
               Dbhandler db = Dbhandler();
               int result = await db.register(person);
               if (result >= 1 ) { 
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Successfully registered"),
    ));
               } else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("failed"),
    ));
               }


              },
              //be careful with brackets.
              // revisit navigation. 
              child: Container(
                width: 300,
                height: 60,
                decoration: const BoxDecoration(color: Colors.purpleAccent),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}