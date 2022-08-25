import 'package:flutter/material.dart';
import '../widgets/button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(62, 62, 62, 1),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Welcome Back',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  wordSpacing: 5,
                  letterSpacing: 3.3,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'login to continue',
                style: TextStyle(color: Color.fromARGB(255, 179, 172, 172)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 350,
              child: Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 179, 172, 172)),
                      decoration: const InputDecoration(
                          hintText: 'email',
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Color.fromRGBO(52, 52, 52, 1),
                          filled: true,
                          border: InputBorder.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        style: const TextStyle(
                            color: Color.fromARGB(255, 179, 172, 172)),
                        decoration: const InputDecoration(
                          hintText: 'password',
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Color.fromRGBO(52, 52, 52, 1),
                          filled: true,
                          border: InputBorder.none,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'forgot passwrod ?',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CartButton(
                          addCart: () {},
                          buttonText: 'Login',
                          btnColor: Colors.red,
                          isCart: false))
                ],
              )),
            )
          ]),
        ),
      ),
    );
  }
}
