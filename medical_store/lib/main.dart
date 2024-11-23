import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical_store/firebase_options.dart';
import 'package:medical_store/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Medical Store App",
      theme: ThemeData(
        fontFamily: "Overpass",
      ),
      home: const SplashView(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const DashboardView(),
      //   '/profile': (context) => const ProfileView(),
      //   '/cart': (context) => const CartPage(),
      // },
    );
  }
}
