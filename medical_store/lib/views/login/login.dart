import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_store/constant/color.dart';
import 'package:medical_store/views/dashboard/dashboard.dart';
import 'package:medical_store/views/login/signup.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  login(context) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardView(),
        ),
      );
      // final snackBar = SnackBar(
      //   backgroundColor: Colors.green,
      //   content: const Text('User Login Successfully...'),
      //   action: SnackBarAction(
      //     label: '',
      //     onPressed: () {},
      //   ),
      // );
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      emailController.clear();
      passController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: const Text('No user found for that email.'),
          action: SnackBarAction(
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        emailController.clear();
        passController.clear();
      } else if (e.code == 'wrong-password') {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: const Text('Wrong password provided for that user.'),
          action: SnackBarAction(
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        emailController.clear();
        passController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/icon.png"),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: greyBigBoxBgColor,
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Quick Medical",
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w100,
                    color: primaryTxtColor,
                  ),
                ),
                const SizedBox(height: 5),
                const SizedBox(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: secondaryTxtColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Please Sign In to continue.",
                    style: TextStyle(
                      color: secondaryTxtColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: blueBtnColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: blueBtnColor),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      hintText: 'Enter Email Address',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: secondaryTxtColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    obscureText: true,
                    controller: passController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: blueBtnColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: blueBtnColor),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      hintText: 'Enter Password',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: secondaryTxtColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: blueBtnColor,
                  ),
                  width: MediaQuery.of(context).size.width * .9,
                  height: 45,
                  child: TextButton(
                    onPressed: () async {
                      await login(context);
                    },
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: primaryBgColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: secondaryTxtColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpView(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: blueBtnColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}