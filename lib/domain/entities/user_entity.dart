import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  late String id;
  late String username;
  late String classCode;
  late String evaluasiKubus1;
  late String evaluasiKubus2;
  late String evaluasiKubus3;
  late String evaluasiBalok1;
  late String evaluasiBalok2;
  late String evaluasiBalok3;
  late String preTest1;
  late String preTest2;
  late String preTest3;
  late String preTest4;
  late String preTest5;
  late String preTest6;
  late String postTest1;
  late String postTest2;
  late String postTest3;
  late String postTest4;
  late String postTest5;
  late String postTest6;
  late double leaderboardScore;
  late double challengeScore;

  UserEntity({
    this.username = '',
    this.id = '',
    this.classCode = 'geoapk2025',
    this.evaluasiKubus1 = '',
    this.evaluasiKubus2 = '',
    this.evaluasiKubus3 = '',
    this.evaluasiBalok1 = '',
    this.evaluasiBalok2 = '',
    this.evaluasiBalok3 = '',
    this.preTest1 = '',
    this.preTest2 = '',
    this.preTest3 = '',
    this.preTest4 = '',
    this.preTest5 = '',
    this.preTest6 = '',
    this.postTest1 = '',
    this.postTest2 = '',
    this.postTest3 = '',
    this.postTest4 = '',
    this.postTest5 = '',
    this.postTest6 = '',
    this.leaderboardScore = 0,
    this.challengeScore = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'classCode': this.classCode,
      'evaluasiKubus1': this.evaluasiKubus1,
      'evaluasiKubus2': this.evaluasiKubus2,
      'evaluasiKubus3': this.evaluasiKubus3,
      'evaluasiBalok1': this.evaluasiBalok1,
      'evaluasiBalok2': this.evaluasiBalok2,
      'evaluasiBalok3': this.evaluasiBalok3,
      'preTest1': this.preTest1,
      'preTest2': this.preTest2,
      'preTest3': this.preTest3,
      'preTest4': this.preTest4,
      'preTest5': this.preTest5,
      'preTest6': this.preTest6,
      'postTest1': this.postTest1,
      'postTest2': this.postTest2,
      'postTest3': this.postTest3,
      'postTest4': this.postTest4,
      'postTest5': this.postTest5,
      'postTest6': this.postTest6,
      'leaderboardScore': this.leaderboardScore,
      'challengeScore': this.challengeScore,
    };
  }

  factory UserEntity.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserEntity(
      id: doc.id,
      username: data['username'] ?? '',
      classCode: data['classCode'] ?? 'geoapk2025',
      evaluasiKubus1: data['evaluasiKubus1'] ?? '',
      evaluasiKubus2: data['evaluasiKubus2'] ?? '',
      evaluasiKubus3: data['evaluasiKubus3'] ?? '',
      evaluasiBalok1: data['evaluasiBalok1'] ?? '',
      evaluasiBalok2: data['evaluasiBalok2'] ?? '',
      evaluasiBalok3: data['evaluasiBalok3'] ?? '',
      preTest1: data['preTest1'] ?? '',
      preTest2: data['preTest2'] ?? '',
      preTest3: data['preTest3'] ?? '',
      preTest4: data['preTest4'] ?? '',
      preTest5: data['preTest5'] ?? '',
      preTest6: data['preTest6'] ?? '',
      postTest1: data['postTest1'] ?? '',
      postTest2: data['postTest2'] ?? '',
      postTest3: data['postTest3'] ?? '',
      postTest4: data['postTest4'] ?? '',
      postTest5: data['postTest5'] ?? '',
      postTest6: data['postTest6'] ?? '',
      leaderboardScore: (data['leaderboardScore'] ?? 0),
      challengeScore: (data['challengeScore'] ?? 0),
    );
  }

  UserEntity copyWith({
    String? id,
    String? username,
    String? classCode,
    String? evaluasiKubus1,
    String? evaluasiKubus2,
    String? evaluasiKubus3,
    String? evaluasiBalok1,
    String? evaluasiBalok2,
    String? evaluasiBalok3,
    String? preTest1,
    String? preTest2,
    String? preTest3,
    String? preTest4,
    String? preTest5,
    String? preTest6,
    String? postTest1,
    String? postTest2,
    String? postTest3,
    String? postTest4,
    String? postTest5,
    String? postTest6,
    double? leaderboardScore,
    double? challengeScore,
  }) {
    return UserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      classCode: classCode ?? this.classCode,
      evaluasiKubus1: evaluasiKubus1 ?? this.evaluasiKubus1,
      evaluasiKubus2: evaluasiKubus2 ?? this.evaluasiKubus2,
      evaluasiKubus3: evaluasiKubus3 ?? this.evaluasiKubus3,
      evaluasiBalok1: evaluasiBalok1 ?? this.evaluasiBalok1,
      evaluasiBalok2: evaluasiBalok2 ?? this.evaluasiBalok2,
      evaluasiBalok3: evaluasiBalok3 ?? this.evaluasiBalok3,
      preTest1: preTest1 ?? this.preTest1,
      preTest2: preTest2 ?? this.preTest2,
      preTest3: preTest3 ?? this.preTest3,
      preTest4: preTest4 ?? this.preTest4,
      preTest5: preTest5 ?? this.preTest5,
      preTest6: preTest6 ?? this.preTest6,
      postTest1: postTest1 ?? this.postTest1,
      postTest2: postTest2 ?? this.postTest2,
      postTest3: postTest3 ?? this.postTest3,
      postTest4: postTest4 ?? this.postTest4,
      postTest5: postTest5 ?? this.postTest5,
      postTest6: postTest6 ?? this.postTest6,
      leaderboardScore: leaderboardScore ?? this.leaderboardScore,
      challengeScore: challengeScore ?? this.challengeScore,
    );
  }
}

List<UserEntity> userList = [UserEntity(username: 'Pandu Violana Mulya')];
