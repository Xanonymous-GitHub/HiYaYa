import 'dart:convert';

class UserToCreate {
  final String email;
  final String password;

  UserToCreate({
    required this.email,
    required this.password,
  });

  factory UserToCreate.fromJson(Map<String, dynamic> json) {
    return UserToCreate(
      email: json['email'],
      password: json['password'],
    );
  }

  String toJson() {
    return jsonEncode({
      'email': this.email,
      'password': this.password,
    });
  }
}

class UserData {
  final String uid;
  final String? userId;
  final String email;
  final bool emailVerified;
  final String displayName;
  final String? realName;
  final String? description;
  final String photoUrl;
  final bool? hasBlueVerify;
  final bool? hasGreyVerify;
  final DateTime? registerTime;

  UserData({
    required this.uid,
    this.userId,
    required this.email,
    required this.emailVerified,
    required this.displayName,
    this.realName,
    this.description,
    required this.photoUrl,
    this.hasBlueVerify,
    this.hasGreyVerify,
    this.registerTime,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      uid: json['uid'],
      email: json['email'],
      emailVerified: json['email_verified'],
      displayName: json['display_name'],
      realName: json['real_name'],
      description: json['description'],
      photoUrl: json['photo_url'],
      hasBlueVerify: json['has_blue_verify'],
      hasGreyVerify: json['has_grey_verify'],
      registerTime: DateTime.parse(json['register_time']),
    );
  }

  String toJson() {
    return jsonEncode({
      'uid': this.uid,
      'email': this.email,
      'emailVerified': this.emailVerified,
      'displayName': this.displayName,
      'realName': this.realName,
      'description': this.description,
      'photoUrl': this.photoUrl,
      'hasBlueVerify': this.hasBlueVerify,
      'hasGreyVerify': this.hasGreyVerify,
      'registerTime': this.registerTime,
    });
  }
}
