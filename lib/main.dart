// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_tech/firebase_options.dart';
import 'package:health_tech/providers/onboarding_provider.dart';
import 'package:health_tech/providers/userprovider.dart';
import 'package:health_tech/screens/on_boarding_view.dart';
import 'package:health_tech/services/firebase_auth_methods.dart';
// import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // MultiProvider(
      // providers: [
      //   ChangeNotifierProvider<OnboardingProvider>(create: (context) => OnboardingProvider()),
      //   Provider<FirebaseAuth >(create: (_) => FirebaseAuth.instance),
      //   StreamProvider(create: (context) => context.read<FirebaseAuthMethods>().authState,
      //    initialData: null,)
      //   // ChangeNotifierProvider(create: (context) => OtherProvider()),
      //   // Add other providers as needed
      // ],
      MyApp(),
    );
  
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Your App Name',
        theme: ThemeData(
            // Your theme data...
            ),
        home: const EdenOnboardingView(),
      );
  }
}
