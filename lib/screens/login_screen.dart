
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';






class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _email = TextEditingController();
  // to receive email
  var _phone = TextEditingController();

  var _password = TextEditingController();

  bool _isVisible = false;

  final _formKey =GlobalKey<FormState>();

  login(){
    if(_formKey.currentState!.validate()){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: SingleChildScrollView(
            child: Form(key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  SizedBox(width: 350,
                    child: TextFormField(validator: (value){
                      if (value!.isEmpty || !value.contains("@")){
                        return"invalid Email";
                      }
                    },
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
//.phone for numbers
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.mail))),
                  ),
                  SizedBox(height: 20),

                  SizedBox(width: 350,
                    child: TextFormField(validator: (value){
                      if(value!.isEmpty) return "please enter your password";
                    },
                        controller: _password,
                        obscureText: _isVisible ? false : true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: Icon(_isVisible
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye)))),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          login();
                          setData();


                        });
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ));
  }

  setData()async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString("email", _email.text);
    preferences.setString("password", _password.text);
    print(preferences.getString("email"));
    print(preferences.getString("password"));

  }
}