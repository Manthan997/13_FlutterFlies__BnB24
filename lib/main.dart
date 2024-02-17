import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_tech/firebase_options.dart';
import 'package:health_tech/providers/onboarding_provider.dart';
import 'package:health_tech/screens/on_boarding_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      child: MaterialApp(
        title: 'Your App Name',
        theme: ThemeData(
            // Your theme data...
            ),
        home: EdenOnboardingView(),
      ),
    );
  }
}
