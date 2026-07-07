import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:machine_task/models/user_profile_model.dart';

class FirebaseStorageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? get _userId => FirebaseAuth.instance.currentUser?.uid;

  Future<void> storeData(UserProfileModel userProfile) async {
    try {
      final uid = _userId;
      if (uid == null) throw Exception('User not authenticated');
      await _firestore
          .collection('user_profiles')
          .doc(uid)
          .set(userProfile.toMap());
    } catch (e) {
      print('Storage error: $e');
      rethrow;
    }
  }

  Future<UserProfileModel?> getData() async {
    try {
      final uid = _userId;
      if (uid == null) throw Exception('User not authenticated');
      final doc =
          await _firestore.collection('user_profiles').doc(uid).get();
      if (!doc.exists || doc.data() == null) return null;
      return UserProfileModel.fromJson(doc.data()!, id: doc.id);
    } catch (e) {
      print('Storage error: $e');
      rethrow;
    }
  }

  Future<void> updateData(UserProfileModel userProfile) async {
    try {
      final uid = _userId;
      if (uid == null) throw Exception('User not authenticated');
      await _firestore
          .collection('user_profiles')
          .doc(uid)
          .update(userProfile.toMap());
    } catch (e) {
      print('Storage error: $e');
      rethrow;
    }
  }

  Future<void> deleteData() async {
    try {
      final uid = _userId;
      if (uid == null) throw Exception('User not authenticated');
      await _firestore.collection('user_profiles').doc(uid).delete();
    } catch (e) {
      print('Storage error: $e');
      rethrow;
    }
  }
}
