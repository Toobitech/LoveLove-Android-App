// class MyProfileModel {
//   bool? success;
//   UserData? data;

//   MyProfileModel({this.success, this.data});

//   MyProfileModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class UserData {
//   var id;
//   String? firstName;
//   String? midName;
//   String? lastName;
//   String? preferredName;
//   String? phone;
//   var age;
//   String? education;
//   String? gender;
//   String? accountForId;
//   String? email;
//   var address;
//   String? type;
//   String? profile;
//   String? city;
//   String? country;
//   var status;
//   var referenceLink;
//   String? description;
//   String? about;
//   var verifiedByNumber;
//   var otp;
//   var emailVerifiedAt;
//   var isBlock;
//   var forgetPasswordCode;
//   String? roleId;
//   String? automation;
//   String? createdAt;
//   String? updatedAt;
//   String? lon;
//   String? lat;
//   List<UserIntrest>? userIntrest;
//   List<UserMedicalCondition>? userMedicalCondition;

//   UserData(
//       {this.id,
//       this.firstName,
//       this.midName,
//       this.lastName,
//       this.preferredName,
//       this.phone,
//       this.age,
//       this.education,
//       this.gender,
//       this.accountForId,
//       this.email,
//       this.address,
//       this.type,
//       this.profile,
//       this.city,
//       this.country,
//       this.status,
//       this.referenceLink,
//       this.description,
//       this.about,
//       this.verifiedByNumber,
//       this.otp,
//       this.emailVerifiedAt,
//       this.isBlock,
//       this.forgetPasswordCode,
//       this.roleId,
//       this.automation,
//       this.createdAt,
//       this.updatedAt,
//       this.lon,
//       this.lat,
//       this.userIntrest,
//       this.userMedicalCondition});

//   UserData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     midName = json['mid_name'];
//     lastName = json['last_name'];
//     preferredName = json['preferred_name'];
//     phone = json['phone'];
//     age = json['age'];
//     education = json['education'];
//     gender = json['gender'];
//     accountForId = json['account_for_id'];
//     email = json['email'];
//     address = json['address'];
//     type = json['type'];
//     profile = json['profile'];
//     city = json['city'];
//     country = json['country'];
//     status = json['status'];
//     referenceLink = json['reference_link'];
//     description = json['description'];
//     about = json['about'];
//     verifiedByNumber = json['verified_by_number'];
//     otp = json['otp'];
//     emailVerifiedAt = json['email_verified_at'];
//     isBlock = json['is_block'];
//     forgetPasswordCode = json['forget_password_code'];
//     roleId = json['role_id'];
//     automation = json['automation'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     lon = json['lon'];
//     lat = json['lat'];
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
//     data['id'] = this.id;
//     data['first_name'] = this.firstName;
//     data['mid_name'] = this.midName;
//     data['last_name'] = this.lastName;
//     data['preferred_name'] = this.preferredName;
//     data['phone'] = this.phone;
//     data['age'] = this.age;
//     data['education'] = this.education;
//     data['gender'] = this.gender;
//     data['account_for_id'] = this.accountForId;
//     data['email'] = this.email;
//     data['address'] = this.address;
//     data['type'] = this.type;
//     data['profile'] = this.profile;
//     data['city'] = this.city;
//     data['country'] = this.country;
//     data['status'] = this.status;
//     data['reference_link'] = this.referenceLink;
//     data['description'] = this.description;
//     data['about'] = this.about;
//     data['verified_by_number'] = this.verifiedByNumber;
//     data['otp'] = this.otp;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['is_block'] = this.isBlock;
//     data['forget_password_code'] = this.forgetPasswordCode;
//     data['role_id'] = this.roleId;
//     data['automation'] = this.automation;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['lon'] = this.lon;
//     data['lat'] = this.lat;
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

// class MyProfileModel {
//   bool? success;
//   UserData? data;

//   MyProfileModel({this.success, this.data});

//   MyProfileModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class UserData {
//   int? id;
//   String? firstName;
//   String? midName;
//   String? lastName;
//   String? preferredName;
//   String? phone;
//   int? age;
//   String? education;
//   String? gender;
//   String? accountForId;
//   String? email;
//   var address;
//   String? type;
//   String? profile;
//   String? city;
//   String? country;
//   int? status;
//   String? referenceLink;
//   int? referenceId;
//   String? description;
//   String? about;
//   int? verifiedByNumber;
//   int? otp;
//   var emailVerifiedAt;
//   int? isBlock;
//   var forgetPasswordCode;
//   String? roleId;
//   String? createdAt;
//   String? updatedAt;
//   String? lon;
//   String? lat;
//   int? automation;
//   List<UserIntrest>? userIntrest;
//   List<UserMedicalCondition>? userMedicalCondition;

//   UserData(
//       {this.id,
//       this.firstName,
//       this.midName,
//       this.lastName,
//       this.preferredName,
//       this.phone,
//       this.age,
//       this.education,
//       this.gender,
//       this.accountForId,
//       this.email,
//       this.address,
//       this.type,
//       this.profile,
//       this.city,
//       this.country,
//       this.status,
//       this.referenceLink,
//       this.referenceId,
//       this.description,
//       this.about,
//       this.verifiedByNumber,
//       this.otp,
//       this.emailVerifiedAt,
//       this.isBlock,
//       this.forgetPasswordCode,
//       this.roleId,
//       this.createdAt,
//       this.updatedAt,
//       this.lon,
//       this.lat,
//       this.automation,
//       this.userIntrest,
//       this.userMedicalCondition});

//   UserData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     midName = json['mid_name'];
//     lastName = json['last_name'];
//     preferredName = json['preferred_name'];
//     phone = json['phone'];
//     age = json['age'];
//     education = json['education'];
//     gender = json['gender'];
//     accountForId = json['account_for_id'];
//     email = json['email'];
//     address = json['address'];
//     type = json['type'];
//     profile = json['profile'];
//     city = json['city'];
//     country = json['country'];
//     status = json['status'];
//     referenceLink = json['reference_link'];
//     referenceId = json['reference_id'];
//     description = json['description'];
//     about = json['about'];
//     verifiedByNumber = json['verified_by_number'];
//     otp = json['otp'];
//     emailVerifiedAt = json['email_verified_at'];
//     isBlock = json['is_block'];
//     forgetPasswordCode = json['forget_password_code'];
//     roleId = json['role_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     lon = json['lon'];
//     lat = json['lat'];
//     automation = json['automation'];
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
//     data['id'] = this.id;
//     data['first_name'] = this.firstName;
//     data['mid_name'] = this.midName;
//     data['last_name'] = this.lastName;
//     data['preferred_name'] = this.preferredName;
//     data['phone'] = this.phone;
//     data['age'] = this.age;
//     data['education'] = this.education;
//     data['gender'] = this.gender;
//     data['account_for_id'] = this.accountForId;
//     data['email'] = this.email;
//     data['address'] = this.address;
//     data['type'] = this.type;
//     data['profile'] = this.profile;
//     data['city'] = this.city;
//     data['country'] = this.country;
//     data['status'] = this.status;
//     data['reference_link'] = this.referenceLink;
//     data['reference_id'] = this.referenceId;
//     data['description'] = this.description;
//     data['about'] = this.about;
//     data['verified_by_number'] = this.verifiedByNumber;
//     data['otp'] = this.otp;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['is_block'] = this.isBlock;
//     data['forget_password_code'] = this.forgetPasswordCode;
//     data['role_id'] = this.roleId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['lon'] = this.lon;
//     data['lat'] = this.lat;
//     data['automation'] = this.automation;
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
//   int? intrestId;
//   int? userId;
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
//   int? id;
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
//   int? medicalConditionId;
//   int? userId;
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

class MyProfileModel {
  bool? success;
  UserData? data;

  MyProfileModel({this.success, this.data});

  MyProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? firstName;
  String? midName;
  String? lastName;
  String? preferredName;
  String? phone;
  int? age;
  String? education;
  String? gender;
  String? accountForId;
  String? email;
  var address;
  String? type;
  String? profile;
  String? city;
  String? country;
  int? status;
  var referenceLink;
  int? referenceId;
  String? description;
  String? about;
  int? verifiedByNumber;
  int? otp;
  var emailVerifiedAt;
  int? isBlock;
  var forgetPasswordCode;
  String? roleId;
  String? createdAt;
  String? updatedAt;
  String? lon;
  String? lat;
  String? walletBalance;
  int? automation;
  int? isMedicalCondition;

  int? isShareableCondition;
  int? freeCall;
  List<Images>? images;
  List<UserIntrest>? userIntrest;
  List<UserMedicalCondition>? userMedicalCondition;
  List<UserSharableCondition>? userSharableCondition;
  UserData(
      {this.id,
      this.firstName,
      this.midName,
      this.lastName,
      this.preferredName,
      this.phone,
      this.age,
      this.walletBalance,
      this.education,
      this.gender,
      this.accountForId,
      this.email,
      this.address,
      this.type,
      this.profile,
      this.city,
      this.country,
      this.status,
      this.referenceLink,
      this.referenceId,
      this.description,
      this.about,
      this.verifiedByNumber,
      this.otp,
      this.emailVerifiedAt,
      this.isBlock,
      this.forgetPasswordCode,
      this.roleId,
      this.freeCall,
      this.createdAt,
      this.updatedAt,
      this.lon,
      this.lat,
      this.automation,
      this.isMedicalCondition,
      this.images,
      this.userIntrest,
      this.isShareableCondition,
      this.userSharableCondition,
      this.userMedicalCondition});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    midName = json['mid_name'];
    lastName = json['last_name'];
    preferredName = json['preferred_name'];
    phone = json['phone'];
    age = json['age'];
    education = json['education'];
    gender = json['gender'];
    accountForId = json['account_for_id'];
    email = json['email'];
    address = json['address'];
    type = json['type'];
    profile = json['profile'];
    city = json['city'];
    walletBalance = json['wallet_balance'];
    country = json['country'];
    status = json['status'];
    referenceLink = json['reference_link'];
    referenceId = json['reference_id'];
    description = json['description'];
    about = json['about'];
    verifiedByNumber = json['verified_by_number'];
    otp = json['otp'];
    emailVerifiedAt = json['email_verified_at'];
    isBlock = json['is_block'];
    forgetPasswordCode = json['forget_password_code'];
    roleId = json['role_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lon = json['lon'];
    lat = json['lat'];
    automation = json['automation'];
    freeCall = json['free_call'];
    isShareableCondition = json['is_sharable_condition'];

    isMedicalCondition = json['is_medical_condition'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['first_name'] = firstName;
    data['mid_name'] = midName;
    data['last_name'] = lastName;
    data['preferred_name'] = preferredName;
    data['phone'] = phone;
    data['age'] = age;
    data['education'] = education;
    data['gender'] = gender;
    data['account_for_id'] = accountForId;
    data['email'] = email;
    data['address'] = address;
    data['type'] = type;
    data['profile'] = profile;
    data['city'] = city;
    data['country'] = country;
    data['status'] = status;
    data['wallet_balance'] = walletBalance;
    data['reference_link'] = referenceLink;
    data['reference_id'] = referenceId;
    data['description'] = description;
    data['about'] = about;
    data['verified_by_number'] = verifiedByNumber;
    data['otp'] = otp;
    data['email_verified_at'] = emailVerifiedAt;
    data['is_block'] = isBlock;
    data['forget_password_code'] = forgetPasswordCode;
    data['role_id'] = roleId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['lon'] = lon;
    data['lat'] = lat;
    data['automation'] = automation;
    data['free_call'] = freeCall;
    data['is_sharable_condition'] = isShareableCondition;

    data['is_medical_condition'] = isMedicalCondition;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (userIntrest != null) {
      data['user_intrest'] = userIntrest!.map((v) => v.toJson()).toList();
    }
    if (userMedicalCondition != null) {
      data['user_medical_condition'] =
          userMedicalCondition!.map((v) => v.toJson()).toList();
    }
    if (userSharableCondition != null) {
      data['user_sharable_condition'] =
          userSharableCondition!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  int? userId;
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

class UserIntrest {
  int? intrestId;
  int? userId;
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

class Intrest {
  int? id;
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
  int? medicalConditionId;
  int? userId;
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
