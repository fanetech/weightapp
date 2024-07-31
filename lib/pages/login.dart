import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: SafeArea(child: _buildUi()),
    );
  }

   Widget _buildUi() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width, 
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _title(),
            _loginForm(),
          ],
      ),
    );
  }
 
  

  Widget _title() {
    return const Text(
      "Weight App",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              onSaved: (value) {
                setState(() {
                username = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a username";
                }
                return null;
              },
              initialValue: "kminchelle",
              decoration: const InputDecoration(
                hintText: "Username",
              ),
            ),
            TextFormField(
              onSaved: (value) {
                setState(() {
                password = value;
                });
              },
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a password";
                }
                return null;
              },
              initialValue: "0lelplR",
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(
        onPressed: ()  async {
          if (_loginFormKey.currentState!.validate()) {
            _loginFormKey.currentState!.save();
            print("Username: $username, Password: $password");
            // bool result = await AuthService().login(username!, password!);
            //   Navigator.pushReplacementNamed(context, '/home');
            // if(result){
            // } else {
            //   StatusAlert.show(context,
            //     duration: const Duration(seconds: 2),
            //     title: "Login Failed",
            //     subtitle: "Please check your credentials",
            //     configuration: const IconConfiguration(icon: Icons.error, size: 50),
            //     maxWidth: 260,
            //   );
            // }
          }
        },
        child: const Text("Login"),
      ),
    );
  }
}