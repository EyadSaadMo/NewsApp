import 'package:flutter/material.dart';
import 'package:test1/shared/components/components.dart';
var emailController = TextEditingController();
var passwordController = TextEditingController();
bool isPassword = true;
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                defaultformfield(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    lable: 'Email',
                    prefix: Icons.email,
                    validate: (String value){
                        if(value.isEmpty){
                          return 'Required';
                        }
                      return null;
                    }
                ),
                SizedBox(
                  height: 15,
                ),
                defaultformfield(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    lable: 'Password',
                    suffix: isPassword ? Icons.visibility_off:Icons.visibility ,
                    prefix: Icons.lock,
                    isPassword: isPassword,
                    suffixPressed: (){
                      setState(() {
                        isPassword = ! isPassword;
                      });
                    },
                    validate: (String value){
                      if(value.isEmpty){
                        return 'Required';
                      }
                      return null;
                    }
                ),
                SizedBox(
                  height: 15,
                ),
                defaultButtons(
                    text: "login",
                    raduis: 0.0,
                    isUppercase: true,
                    function: () {

                      print(emailController.text);
                      print(passwordController.text);


                    }),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account'),
                    TextButton(onPressed: () {}, child: Text('Register Now'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
