import 'package:lxp_flutter_dart/models/profile_models.dart';
import 'package:lxp_flutter_dart/services/firestore_service.dart';

class ProfileRepo {
  FirestoreService _firestoreService = FirestoreService();

// Create
  bool createProfile(UserDetails profile) {
    _firestoreService.createProfile(profile);
    return true;
  }

// Read
  Future<UserDetails?> readProfile(String uid) async {
    final profile = await _firestoreService.readProfile(uid);
    return profile;
  }

// Update
  Future<bool> updateProfileName(String name, String uid) async {
    final details = await _firestoreService.updateProfile(name, uid);
    return details != null && details.name == name;
  }

// Delete
  void deleteProfile(String uid) {
    _firestoreService.deleteProfile(uid);
  }
}
