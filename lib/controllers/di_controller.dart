import 'package:get_it/get_it.dart';
import 'package:machine_task/controllers/auth_controller.dart';
import 'package:machine_task/controllers/storage_controller.dart';
import 'package:machine_task/services/firebase_servicde.dart';
import 'package:machine_task/services/firebase_storage_service.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  getIt.registerLazySingleton<FirebaseStorageService>(
    () => FirebaseStorageService(),
  );

  getIt.registerLazySingleton<AuthController>(
    () => AuthController(firebaseAuthService: getIt<FirebaseAuthService>()),
  );

  getIt.registerLazySingleton<StorageController>(
    () => StorageController(
      firebaseStorageService: getIt<FirebaseStorageService>(),
    ),
  );
}
