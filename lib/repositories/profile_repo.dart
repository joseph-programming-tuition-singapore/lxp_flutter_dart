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
  UserDetails? readProfile(UserDetails profile) {
    return null;
  }

// Update
  bool updateProfile(UserDetails profile) {
    return true;
  }

// Delete
  bool deleteProfile(UserDetails profile) {
    return true;
  }
}
