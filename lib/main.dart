import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task/blocs/bloc/auth_bloc.dart';
import 'package:machine_task/core/constants/colors.dart';
import 'package:machine_task/views/auth/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print(e);
  }
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthBloc())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
