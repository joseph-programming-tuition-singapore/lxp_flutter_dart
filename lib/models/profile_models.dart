class UserDetails {
  String uid;
  String name;
  String email;
  String photoUrl;

  UserDetails(this.uid, this.name, this.email, this.photoUrl);

  UserDetails.fromJson(Map<String, dynamic> json)
      : uid = json['uid'].toString(),
        name = json['name'].toString(),
        email = json['email'].toString(),
        photoUrl = json['photoUrl'].toString();
}
