import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task/blocs/bloc/auth_bloc.dart';
import 'package:machine_task/blocs/bloc/profile_bloc/profile_bloc.dart';
import 'package:machine_task/controllers/di_controller.dart';
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
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            firebaseAuthService: getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            storageController: getIt(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
