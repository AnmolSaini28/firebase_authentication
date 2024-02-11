import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/firebase_options.dart';
import 'package:firebase_authentication/screens/home_screen.dart';
import 'package:firebase_authentication/screens/login_email_password_screen.dart';
import 'package:firebase_authentication/screens/login_screen.dart';
import 'package:firebase_authentication/screens/phone_screen.dart';
import 'package:firebase_authentication/screens/signup_email_password_screen.dart';
import 'package:firebase_authentication/services/firebase_auth_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
             initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Auth Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthWrapper(),
        routes: {
          EmailPasswordSignup.routeName: (context) => const EmailPasswordSignup(),
          EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
          PhoneScreen.routeName: (context) => const PhoneScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if(firebaseUser != null){
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}

