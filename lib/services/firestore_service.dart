import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lxp_flutter_dart/models/profile_models.dart';

class FirestoreService {
  bool createProfile(UserDetails profile) {
    final db = FirebaseFirestore.instance;
    db.collection("users").add(<String, dynamic>{
      'uid': profile.uid,
      'name': profile.name,
      'email': profile.email,
      'photoUrl': profile.photoUrl
    }).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
    return true;
  }
}
