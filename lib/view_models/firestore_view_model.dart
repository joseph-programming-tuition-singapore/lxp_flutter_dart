import 'package:flutter/material.dart';
import 'package:lxp_flutter_dart/models/profile_models.dart';
import 'package:lxp_flutter_dart/models/weather_models.dart';
import 'package:lxp_flutter_dart/repositories/profile_repo.dart';

class FirestoreViewModel extends ChangeNotifier {
  FirestoreViewModel({required ProfileRepo}) : _profileRepo = ProfileRepo;

  final ProfileRepo _profileRepo;

  UserDetails? _userDetails;
  UserDetails? get userDetails => _userDetails;

  void addUserDetails(UserDetails userDetails) {
    bool success = _profileRepo.createProfile(userDetails);
    notifyListeners();
  }

  void readUserDetails(String uid) async {
    UserDetails? userDetails = await _profileRepo.readProfile(uid);
    print(userDetails?.name);
    _userDetails = userDetails;
    notifyListeners();
  }

  void updateUserDetails(String name, String uid) async {
    bool success = await _profileRepo.updateProfileName(name, uid);
    print(success);
    notifyListeners();
  }

  void deleteUserDetails(String uid) {
    _profileRepo.deleteProfile(uid);
    notifyListeners();
  }
}
