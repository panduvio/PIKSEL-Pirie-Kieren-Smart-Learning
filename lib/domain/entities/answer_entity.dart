import 'package:cloud_firestore/cloud_firestore.dart';

class AnswerEntity {
  final int userLevel;
  final int kubusLevel;
  final int balokLevel;
  final bool isPretest;
  final String id;
  final String kubusImageMaking;
  final String balokImageMaking;
  final String kubusImageHaving;
  final String balokImageHaving;
  final String kubusPropertyNoticing;
  final String balokPropertyNoticing;
  final String kubusFormalizing;
  final String balokFormalizing;
  final String balokInvestising1;
  final String balokInvestising2;
  final String balokInvestising3;
  final String balokIHPN1;
  final String balokIHPN2;
  final String balokIHPN3;
  final String balokIHPN4;
  final String balokIHPN5;
  final String balokIHPN6;
  final String balokIHPN7;
  final String balokIHPN8;
  final String balokIHPN9;
  final String balokIHPN10;
  final String balokIHPN11;
  final String balokIHPN12;
  final String balokIHPN13;
  final String balokIHPN14;
  final String balokIHPN15;
  final String balokIHPN16;
  final String balokIHPN17;
  final String balokIHPN18;
  final String balokIHPN19;
  final String balokIHPN20;

  AnswerEntity({
    this.userLevel = 1,
    this.kubusLevel = 1,
    this.balokLevel = 1,
    this.isPretest = false,
    this.id = '',
    this.balokFormalizing = '',
    this.kubusFormalizing = '',
    this.balokImageHaving = '',
    this.kubusImageHaving = '',
    this.balokImageMaking = '',
    this.kubusImageMaking = '',
    this.balokPropertyNoticing = '',
    this.kubusPropertyNoticing = '',
    this.balokInvestising1 = '',
    this.balokInvestising2 = '',
    this.balokInvestising3 = '',
    this.balokIHPN1 = '',
    this.balokIHPN2 = '',
    this.balokIHPN3 = '',
    this.balokIHPN4 = '',
    this.balokIHPN5 = '',
    this.balokIHPN6 = '',
    this.balokIHPN7 = '',
    this.balokIHPN8 = '',
    this.balokIHPN9 = '',
    this.balokIHPN10 = '',
    this.balokIHPN11 = '',
    this.balokIHPN12 = '',
    this.balokIHPN13 = '',
    this.balokIHPN14 = '',
    this.balokIHPN15 = '',
    this.balokIHPN16 = '',
    this.balokIHPN17 = '',
    this.balokIHPN18 = '',
    this.balokIHPN19 = '',
    this.balokIHPN20 = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'userLevel': userLevel,
      'kubusLevel': kubusLevel,
      'balokLevel': balokLevel,
      'isPretest': isPretest,
      'id': id,
      'kubusImageMaking': kubusImageMaking,
      'balokImageMaking': balokImageMaking,
      'kubusImageHaving': kubusImageHaving,
      'balokImageHaving': balokImageHaving,
      'kubusPropertyNoticing': kubusPropertyNoticing,
      'balokPropertyNoticing': balokPropertyNoticing,
      'kubusFormalizing': kubusFormalizing,
      'balokFormalizing': balokFormalizing,
      'balokInvestising1': balokInvestising1,
      'balokInvestising2': balokInvestising2,
      'balokInvestising3': balokInvestising3,
      'balokIHPN1': balokIHPN1,
      'balokIHPN2': balokIHPN2,
      'balokIHPN3': balokIHPN3,
      'balokIHPN4': balokIHPN4,
      'balokIHPN5': balokIHPN5,
      'balokIHPN6': balokIHPN6,
      'balokIHPN7': balokIHPN7,
      'balokIHPN8': balokIHPN8,
      'balokIHPN9': balokIHPN9,
      'balokIHPN10': balokIHPN10,
      'balokIHPN11': balokIHPN11,
      'balokIHPN12': balokIHPN12,
      'balokIHPN13': balokIHPN13,
      'balokIHPN14': balokIHPN14,
      'balokIHPN15': balokIHPN15,
      'balokIHPN16': balokIHPN16,
      'balokIHPN17': balokIHPN17,
      'balokIHPN18': balokIHPN18,
      'balokIHPN19': balokIHPN19,
      'balokIHPN20': balokIHPN20,
    };
  }

  factory AnswerEntity.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return AnswerEntity(
      userLevel: data['userLevel'] ?? 0,
      kubusLevel: data['kubusLevel'] ?? 0,
      balokLevel: data['balokLevel'] ?? 0,
      isPretest: data['isPretest'] ?? true,
      id: data['id'] ?? '',
      kubusImageMaking: data['kubusImageMaking'] ?? '',
      balokImageMaking: data['balokImageMaking'] ?? '',
      kubusImageHaving: data['kubusImageHaving'] ?? '',
      balokImageHaving: data['balokImageHaving'] ?? '',
      kubusPropertyNoticing: data['kubusPropertyNoticing'] ?? '',
      balokPropertyNoticing: data['balokPropertyNoticing'] ?? '',
      kubusFormalizing: data['kubusFormalizing'] ?? '',
      balokFormalizing: data['balokFormalizing'] ?? '',
      balokInvestising1: data['balokInvestising1'] ?? '',
      balokInvestising2: data['balokInvestising2'] ?? '',
      balokInvestising3: data['balokInvestising3'] ?? '',
      balokIHPN1: data['balokIHPN1'] ?? '',
      balokIHPN2: data['balokIHPN2'] ?? '',
      balokIHPN3: data['balokIHPN3'] ?? '',
      balokIHPN4: data['balokIHPN4'] ?? '',
      balokIHPN5: data['balokIHPN5'] ?? '',
      balokIHPN6: data['balokIHPN6'] ?? '',
      balokIHPN7: data['balokIHPN7'] ?? '',
      balokIHPN8: data['balokIHPN8'] ?? '',
      balokIHPN9: data['balokIHPN9'] ?? '',
      balokIHPN10: data['balokIHPN10'] ?? '',
      balokIHPN11: data['balokIHPN11'] ?? '',
      balokIHPN12: data['balokIHPN12'] ?? '',
      balokIHPN13: data['balokIHPN13'] ?? '',
      balokIHPN14: data['balokIHPN14'] ?? '',
      balokIHPN15: data['balokIHPN15'] ?? '',
      balokIHPN16: data['balokIHPN16'] ?? '',
      balokIHPN17: data['balokIHPN17'] ?? '',
      balokIHPN18: data['balokIHPN18'] ?? '',
      balokIHPN19: data['balokIHPN19'] ?? '',
      balokIHPN20: data['balokIHPN20'] ?? '',
    );
  }

  AnswerEntity copyWith({
    int? userLevel,
    int? kubusLevel,
    int? balokLevel,
    bool? isPretest,
    String? id,
    String? kubusImageMaking,
    String? balokImageMaking,
    String? kubusImageHaving,
    String? balokImageHaving,
    String? kubusPropertyNoticing,
    String? balokPropertyNoticing,
    String? kubusFormalizing,
    String? balokFormalizing,
    String? balokInvestising1,
    String? balokInvestising2,
    String? balokInvestising3,
    String? balokIHPN1,
    String? balokIHPN2,
    String? balokIHPN3,
    String? balokIHPN4,
    String? balokIHPN5,
    String? balokIHPN6,
    String? balokIHPN7,
    String? balokIHPN8,
    String? balokIHPN9,
    String? balokIHPN10,
    String? balokIHPN11,
    String? balokIHPN12,
    String? balokIHPN13,
    String? balokIHPN14,
    String? balokIHPN15,
    String? balokIHPN16,
    String? balokIHPN17,
    String? balokIHPN18,
    String? balokIHPN19,
    String? balokIHPN20,
  }) {
    return AnswerEntity(
      userLevel: userLevel ?? this.userLevel,
      kubusLevel: kubusLevel ?? this.kubusLevel,
      balokLevel: balokLevel ?? this.balokLevel,
      isPretest: isPretest ?? this.isPretest,
      id: id ?? this.id,
      kubusImageMaking: kubusImageMaking ?? this.kubusImageMaking,
      balokImageMaking: balokImageMaking ?? this.balokImageMaking,
      kubusImageHaving: kubusImageHaving ?? this.kubusImageHaving,
      balokImageHaving: balokImageHaving ?? this.balokImageHaving,
      kubusPropertyNoticing:
          kubusPropertyNoticing ?? this.kubusPropertyNoticing,
      balokPropertyNoticing:
          balokPropertyNoticing ?? this.balokPropertyNoticing,
      kubusFormalizing: kubusFormalizing ?? this.kubusFormalizing,
      balokFormalizing: balokFormalizing ?? this.balokFormalizing,
      balokInvestising1: balokInvestising1 ?? this.balokInvestising1,
      balokInvestising2: balokInvestising2 ?? this.balokInvestising2,
      balokInvestising3: balokInvestising3 ?? this.balokInvestising3,
      balokIHPN1: balokIHPN1 ?? this.balokIHPN1,
      balokIHPN2: balokIHPN2 ?? this.balokIHPN2,
      balokIHPN3: balokIHPN3 ?? this.balokIHPN3,
      balokIHPN4: balokIHPN4 ?? this.balokIHPN4,
      balokIHPN5: balokIHPN5 ?? this.balokIHPN5,
      balokIHPN6: balokIHPN6 ?? this.balokIHPN6,
      balokIHPN7: balokIHPN7 ?? this.balokIHPN7,
      balokIHPN8: balokIHPN8 ?? this.balokIHPN8,
      balokIHPN9: balokIHPN9 ?? this.balokIHPN9,
      balokIHPN10: balokIHPN10 ?? this.balokIHPN10,
      balokIHPN11: balokIHPN11 ?? this.balokIHPN11,
      balokIHPN12: balokIHPN12 ?? this.balokIHPN12,
      balokIHPN13: balokIHPN13 ?? this.balokIHPN13,
      balokIHPN14: balokIHPN14 ?? this.balokIHPN14,
      balokIHPN15: balokIHPN15 ?? this.balokIHPN15,
      balokIHPN16: balokIHPN16 ?? this.balokIHPN16,
      balokIHPN17: balokIHPN17 ?? this.balokIHPN17,
      balokIHPN18: balokIHPN18 ?? this.balokIHPN18,
      balokIHPN19: balokIHPN19 ?? this.balokIHPN19,
      balokIHPN20: balokIHPN20 ?? this.balokIHPN20,
    );
  }
}
