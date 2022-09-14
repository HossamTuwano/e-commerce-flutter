import 'package:flutter/material.dart';
import '../widgets/button.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(62, 62, 62, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Create Account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    wordSpacing: 5,
                    letterSpacing: 3.3,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'create new account',
                  style: TextStyle(color: Color.fromARGB(255, 179, 172, 172)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                width: 350,
                child: Form(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 179, 172, 172)),
                        decoration: const InputDecoration(
                            hintText: 'name',
                            hintStyle: TextStyle(
                                letterSpacing: 1.0,
                                color: Color.fromARGB(255, 179, 172, 172)),
                            fillColor: Color.fromRGBO(52, 52, 52, 1),
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _phoneController,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 179, 172, 172)),
                        decoration: const InputDecoration(
                            hintText: 'phone ',
                            hintStyle: TextStyle(
                                letterSpacing: 1.0,
                                color: Color.fromARGB(255, 179, 172, 172)),
                            fillColor: Color.fromRGBO(52, 52, 52, 1),
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 179, 172, 172)),
                        decoration: const InputDecoration(
                            hintText: 'email',
                            hintStyle: TextStyle(
                                letterSpacing: 1.0,
                                color: Color.fromARGB(255, 179, 172, 172)),
                            fillColor: Color.fromRGBO(52, 52, 52, 1),
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          onEditingComplete: () {
                            userProvider.login(
                                email: _emailController.text,
                                password: _emailController.text);
                          },
                          controller: _passwordController,
                          textInputAction: TextInputAction.send,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 179, 172, 172)),
                          decoration: const InputDecoration(
                            hintText: 'password',
                            hintStyle: TextStyle(
                                letterSpacing: 1.0,
                                color: Color.fromARGB(255, 179, 172, 172)),
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
                            'forgot password ?',
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartButton(
                            addCart: () {
                              userProvider
                                  .register(
                                      name: _nameController.text,
                                      phone: _phoneController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text)
                                  .then((Map<String, dynamic> response) {
                                Navigator.of(context).pushNamed('/home');
                              });
                            },
                            buttonText: 'Create account',
                            btnColor: Colors.red,
                            isCart: false)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have account?',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                          const SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: const Text(
                              'create new account',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 15.0),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
