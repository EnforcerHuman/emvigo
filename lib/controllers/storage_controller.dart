import 'package:machine_task/models/user_profile_model.dart';
import 'package:machine_task/services/firebase_storage_service.dart';

class StorageController {
  final FirebaseStorageService _storageService;

  StorageController({required FirebaseStorageService firebaseStorageService})
    : _storageService = firebaseStorageService;

  Future<bool> storeData(UserProfileModel userProfile) async {
    try {
      await _storageService.storeData(userProfile);
      return true;
    } catch (e) {
      print('Storage error: $e');
      return false;
    }
  }

  Future<UserProfileModel?> getData() async {
    try {
      return await _storageService.getData();
    } catch (e) {
      print('Storage error: $e');
      return null;
    }
  }

  Future<bool> updateData(UserProfileModel userProfile) async {
    try {
      await _storageService.updateData(userProfile);
      return true;
    } catch (e) {
      print('Storage error: $e');
      return false;
    }
  }

  Future<bool> deleteData() async {
    try {
      await _storageService.deleteData();
      return true;
    } catch (e) {
      print('Storage error: $e');
      return false;
    }
  }
}
