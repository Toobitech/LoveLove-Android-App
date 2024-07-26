// class DiscoverViewModel {
//   List<IdData>? data;
//   bool? success;

//   DiscoverViewModel({this.data, this.success});

//   DiscoverViewModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <IdData>[];
//       json['data'].forEach((v) {
//         data!.add(new IdData.fromJson(v));
//       });
//     }
//     success = json['success'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['success'] = this.success;
//     return data;
//   }
// }

// class IdData {
//   String? firstName;
//   String? lastName;
//   String? midName;
//   var age;
//   String? description;
//   String? roleId;
//   String? email;
//   var id;
//   bool? isFriend;
//   List<UserIntrest>? userIntrest;
//   List<UserMedicalCondition>? userMedicalCondition;
//   dynamic images;

//   IdData(
//       {this.firstName,
//       this.lastName,
//       this.midName,
//       this.age,
//       this.description,
//       this.roleId,
//       this.email,
//       this.id,
//       this.isFriend,
//       this.userIntrest,
//       this.userMedicalCondition,
//       this.images});

//   IdData.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     midName = json['mid_name'];
//     age = json['age'];
//     description = json['description'];
//     roleId = json['role_id'];
//     email = json['email'];
//     id = json['id'];
//     isFriend = json['is_friend'];
//     images = json['images'];
//     if (json['user_intrest'] != null) {
//       userIntrest = <UserIntrest>[];
//       json['user_intrest'].forEach((v) {
//         userIntrest!.add(new UserIntrest.fromJson(v));
//       });
//     }
//     if (json['user_medical_condition'] != null) {
//       userMedicalCondition = <UserMedicalCondition>[];
//       json['user_medical_condition'].forEach((v) {
//         userMedicalCondition!.add(new UserMedicalCondition.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['mid_name'] = this.midName;
//     data['age'] = this.age;
//     data['description'] = this.description;
//     data['role_id'] = this.roleId;
//     data['email'] = this.email;
//     data['id'] = this.id;
//     data['is_friend'] = this.isFriend;
//     data['images'] = images;
//     if (this.userIntrest != null) {
//       data['user_intrest'] = this.userIntrest!.map((v) => v.toJson()).toList();
//     }
//     if (this.userMedicalCondition != null) {
//       data['user_medical_condition'] =
//           this.userMedicalCondition!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class UserIntrest {
//   var intrestId;
//   var userId;
//   Intrest? intrest;

//   UserIntrest({this.intrestId, this.userId, this.intrest});

//   UserIntrest.fromJson(Map<String, dynamic> json) {
//     intrestId = json['intrest_id'];
//     userId = json['user_id'];
//     intrest =
//         json['intrest'] != null ? new Intrest.fromJson(json['intrest']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['intrest_id'] = this.intrestId;
//     data['user_id'] = this.userId;
//     if (this.intrest != null) {
//       data['intrest'] = this.intrest!.toJson();
//     }
//     return data;
//   }
// }

// class Intrest {
//   var id;
//   String? name;

//   Intrest({this.id, this.name});

//   Intrest.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class UserMedicalCondition {
//   var medicalConditionId;
//   var userId;
//   Intrest? medicalCondition;

//   UserMedicalCondition(
//       {this.medicalConditionId, this.userId, this.medicalCondition});

//   UserMedicalCondition.fromJson(Map<String, dynamic> json) {
//     medicalConditionId = json['medical_condition_id'];
//     userId = json['user_id'];
//     medicalCondition = json['medical_condition'] != null
//         ? new Intrest.fromJson(json['medical_condition'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['medical_condition_id'] = this.medicalConditionId;
//     data['user_id'] = this.userId;
//     if (this.medicalCondition != null) {
//       data['medical_condition'] = this.medicalCondition!.toJson();
//     }
//     return data;
//   }
// }
// class DiscoverViewModel {
//   List<IdData>? data;
//   bool? success;

//   DiscoverViewModel({this.data, this.success});

//   DiscoverViewModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <IdData>[];
//       json['data'].forEach((v) {
//         data!.add(new IdData.fromJson(v));
//       });
//     }
//     success = json['success'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['success'] = this.success;
//     return data;
//   }
// }

// class IdData {
//   String? firstName;
//   String? lastName;
//   String? midName;
//   var age;
//   String? about;
//   String? roleId;
//   String? email;
//   var id;
//   String? profile;
//   String? city;
//   String? country;
//   String? referenceLink;
//   bool? isFriend;
//   List<UserIntrest>? userIntrest;
//   List<UserMedicalCondition>? userMedicalCondition;
//   List<Images>? images;

//   IdData(
//       {this.firstName,
//       this.lastName,
//       this.midName,
//       this.age,
//       this.about,
//       this.roleId,
//       this.email,
//       this.id,
//       this.profile,
//       this.city,
//       this.country,
//       this.referenceLink,
//       this.isFriend,
//       this.userIntrest,
//       this.userMedicalCondition,
//       this.images});

//   IdData.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     midName = json['mid_name'];
//     age = json['age'];
//     about = json['about'];
//     roleId = json['role_id'];
//     email = json['email'];
//     id = json['id'];
//     profile = json['profile'];
//     city = json['city'];
//     country = json['country'];
//     referenceLink = json['reference_link'];
//     isFriend = json['is_friend'];
//     if (json['user_intrest'] != null) {
//       userIntrest = <UserIntrest>[];
//       json['user_intrest'].forEach((v) {
//         userIntrest!.add(new UserIntrest.fromJson(v));
//       });
//     }
//     if (json['user_medical_condition'] != null) {
//       userMedicalCondition = <UserMedicalCondition>[];
//       json['user_medical_condition'].forEach((v) {
//         userMedicalCondition!.add(new UserMedicalCondition.fromJson(v));
//       });
//     }
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['mid_name'] = this.midName;
//     data['age'] = this.age;
//     data['about'] = this.about;
//     data['role_id'] = this.roleId;
//     data['email'] = this.email;
//     data['id'] = this.id;
//     data['profile'] = this.profile;
//     data['city'] = this.city;
//     data['country'] = this.country;
//     data['reference_link'] = this.referenceLink;
//     data['is_friend'] = this.isFriend;
//     if (this.userIntrest != null) {
//       data['user_intrest'] = this.userIntrest!.map((v) => v.toJson()).toList();
//     }
//     if (this.userMedicalCondition != null) {
//       data['user_medical_condition'] =
//           this.userMedicalCondition!.map((v) => v.toJson()).toList();
//     }
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class UserIntrest {
//   var intrestId;
//   var userId;
//   Intrest? intrest;

//   UserIntrest({this.intrestId, this.userId, this.intrest});

//   UserIntrest.fromJson(Map<String, dynamic> json) {
//     intrestId = json['intrest_id'];
//     userId = json['user_id'];
//     intrest =
//         json['intrest'] != null ? new Intrest.fromJson(json['intrest']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['intrest_id'] = this.intrestId;
//     data['user_id'] = this.userId;
//     if (this.intrest != null) {
//       data['intrest'] = this.intrest!.toJson();
//     }
//     return data;
//   }
// }

// class Intrest {
//   var id;
//   String? name;

//   Intrest({this.id, this.name});

//   Intrest.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class UserMedicalCondition {
//   var medicalConditionId;
//   var userId;
//   Intrest? medicalCondition;

//   UserMedicalCondition(
//       {this.medicalConditionId, this.userId, this.medicalCondition});

//   UserMedicalCondition.fromJson(Map<String, dynamic> json) {
//     medicalConditionId = json['medical_condition_id'];
//     userId = json['user_id'];
//     medicalCondition = json['medical_condition'] != null
//         ? new Intrest.fromJson(json['medical_condition'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['medical_condition_id'] = this.medicalConditionId;
//     data['user_id'] = this.userId;
//     if (this.medicalCondition != null) {
//       data['medical_condition'] = this.medicalCondition!.toJson();
//     }
//     return data;
//   }
// }

// class Images {
//   var id;
//   var userId;
//   String? image;
//   var status;
//   String? createdAt;
//   String? updatedAt;

//   Images(
//       {this.id,
//       this.userId,
//       this.image,
//       this.status,
//       this.createdAt,
//       this.updatedAt});

//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     image = json['image'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['image'] = this.image;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

//////////////////////////////////////////////////////////
///
///
///
///

class DiscoverViewModel {
  List<IdData>? data;
  bool? success;

  DiscoverViewModel({this.data, this.success});

  DiscoverViewModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <IdData>[];
      json['data'].forEach((v) {
        data!.add(new IdData.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    return data;
  }
}

class IdData {
  String? firstName;
  String? lastName;
  String? midName;
  var age;
  String? about;
  String? roleId;
  String? email;
  var id;
  String? profile;
  String? city;
  String? country;
  String? referenceLink;
  int? isMedicalCondition;

  int? isSharableCondition;
  bool? isRecomended;
  bool? isFriend;

  int? healthScore;
  List<UserIntrest>? userIntrest;
  List<UserMedicalCondition>? userMedicalCondition;

  List<UserSharableCondition>? userSharableCondition;
  List<Images>? images;

  IdData(
      {this.firstName,
      this.lastName,
      this.midName,
      this.age,
      this.about,
      this.roleId,
      this.email,
      this.id,
      this.profile,
      this.city,
      this.country,
      this.referenceLink,
      this.isMedicalCondition,
      this.isRecomended,
      this.isFriend,
      this.healthScore,
      this.userIntrest,
      this.isSharableCondition,
      this.userMedicalCondition,
      this.userSharableCondition,
      this.images});

  IdData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    midName = json['mid_name'];
    age = json['age'];
    about = json['about'];
    roleId = json['role_id'];
    email = json['email'];
    id = json['id'];
    profile = json['profile'];
    city = json['city'];
    country = json['country'];
    referenceLink = json['reference_link'];
    isMedicalCondition = json['is_medical_condition'];
    isRecomended = json['is_recomended'];
    isSharableCondition = json['is_sharable_condition'];

    healthScore = json['health_score'];
    isFriend = json['is_friend'];
    if (json['user_intrest'] != null) {
      userIntrest = <UserIntrest>[];
      json['user_intrest'].forEach((v) {
        userIntrest!.add(new UserIntrest.fromJson(v));
      });
    }
    if (json['user_medical_condition'] != null) {
      userMedicalCondition = <UserMedicalCondition>[];
      json['user_medical_condition'].forEach((v) {
        userMedicalCondition!.add(new UserMedicalCondition.fromJson(v));
      });
    }
    if (json['user_sharable_condition'] != null) {
      userSharableCondition = <UserSharableCondition>[];
      json['user_sharable_condition'].forEach((v) {
        userSharableCondition!.add(new UserSharableCondition.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mid_name'] = midName;
    data['age'] = age;
    data['about'] = about;
    data['role_id'] = roleId;
    data['email'] = email;
    data['id'] = id;
    data['profile'] = profile;
    data['city'] = city;

    data['is_sharable_condition'] = isSharableCondition;
    data['health_score'] = healthScore;
    data['country'] = country;
    data['reference_link'] = referenceLink;
    data['is_medical_condition'] = isMedicalCondition;
    data['is_recomended'] = isRecomended;
    data['is_friend'] = isFriend;
    if (userIntrest != null) {
      data['user_intrest'] = userIntrest!.map((v) => v.toJson()).toList();
    }
    if (userMedicalCondition != null) {
      data['user_medical_condition'] =
          userMedicalCondition!.map((v) => v.toJson()).toList();
    }
    if (userMedicalCondition != null) {
      data['user_sharable_condition'] =
          userMedicalCondition!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserIntrest {
  var intrestId;
  var userId;
  Intrest? intrest;

  UserIntrest({this.intrestId, this.userId, this.intrest});

  UserIntrest.fromJson(Map<String, dynamic> json) {
    intrestId = json['intrest_id'];
    userId = json['user_id'];
    intrest =
        json['intrest'] != null ? new Intrest.fromJson(json['intrest']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intrest_id'] = intrestId;
    data['user_id'] = userId;
    if (intrest != null) {
      data['intrest'] = intrest!.toJson();
    }
    return data;
  }
}

class Intrest {
  var id;
  String? name;

  Intrest({this.id, this.name});

  Intrest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class UserMedicalCondition {
  var medicalConditionId;
  var userId;
  Intrest? medicalCondition;

  UserMedicalCondition(
      {this.medicalConditionId, this.userId, this.medicalCondition});

  UserMedicalCondition.fromJson(Map<String, dynamic> json) {
    medicalConditionId = json['medical_condition_id'];
    userId = json['user_id'];
    medicalCondition = json['medical_condition'] != null
        ? new Intrest.fromJson(json['medical_condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medical_condition_id'] = medicalConditionId;
    data['user_id'] = userId;
    if (medicalCondition != null) {
      data['medical_condition'] = medicalCondition!.toJson();
    }
    return data;
  }
}

class UserSharableCondition {
  int? sharableConditionId;
  int? userId;
  Intrest? sharableCondition;

  UserSharableCondition(
      {this.sharableConditionId, this.userId, this.sharableCondition});

  UserSharableCondition.fromJson(Map<String, dynamic> json) {
    sharableConditionId = json['sharable_conditions_id'];
    userId = json['user_id'];
    sharableCondition = json['sharable_condition'] != null
        ? new Intrest.fromJson(json['sharable_condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sharable_conditions_id'] = sharableConditionId;
    data['user_id'] = userId;
    if (sharableCondition != null) {
      data['sharable_condition'] = sharableCondition!.toJson();
    }
    return data;
  }
}

class Images {
  var id;
  var userId;
  String? image;
  var status;
  String? createdAt;
  String? updatedAt;

  Images(
      {this.id,
      this.userId,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
