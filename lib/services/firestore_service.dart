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

  Future<UserDetails?> readProfile(String uid) async {
    final db = FirebaseFirestore.instance;
    final DocumentSnapshot doc = await db.collection("users").doc(uid).get();
    if (doc.exists) {
      final userDoc = doc.data() as Map<String, dynamic>;
      return UserDetails(userDoc['uid'], userDoc['name'], userDoc['email'],
          userDoc['photoUrl']);
    } else {
      print('No such document!');
      return null;
    }
  }

  Future<UserDetails?> updateProfile(String name, String uid) async {
    final db = FirebaseFirestore.instance;
    await db
        .collection("users")
        .doc(uid)
        .update({'name': name}).catchError((error) => print('Failed: $error'));
    UserDetails? details = await readProfile(uid);
    print(details?.name);
    return details;
  }

  void deleteProfile(String uid) async {
    final db = FirebaseFirestore.instance;
    await db.collection("users").doc(uid).delete();
  }

  Future<List<UserDetails>> readProfileWithFilter(String name) async {
    final db = FirebaseFirestore.instance;
    final QuerySnapshot snapshot =
        await db.collection("users").where('name', isEqualTo: name).get();
    List<UserDetails> userDetailsList = [];
    if (snapshot.docs.isNotEmpty) {
      snapshot.docs.forEach((doc) {
        final userDoc = doc.data() as Map<String, dynamic>;
        userDetailsList.add(UserDetails(userDoc['uid'], userDoc['name'],
            userDoc['email'], userDoc['photoUrl']));
      });
      return userDetailsList;
    } else {
      return [];
    }
  }
}
