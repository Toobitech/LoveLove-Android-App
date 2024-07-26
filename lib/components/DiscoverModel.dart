// class DiscoverModel {
//   List<UserData>? data;
//   bool? success;

//   DiscoverModel({this.data, this.success});

//   DiscoverModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <UserData>[];
//       json['data'].forEach((v) {
//         data!.add(new UserData.fromJson(v));
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
//   String? referenceLink;
//   var referenceId;
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
//   bool? isFriend;
//   List<Images>? images;

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
//       this.automation,
//       this.createdAt,
//       this.updatedAt,
//       this.lon,
//       this.lat,
//       this.isFriend,
//       this.images});

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
//     automation = json['automation'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     lon = json['lon'];
//     lat = json['lat'];
//     isFriend = json['is_friend'];
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
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
//     data['automation'] = this.automation;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['lon'] = this.lon;
//     data['lat'] = this.lat;
//     data['is_friend'] = this.isFriend;
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
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

///////oldmodels////////////////////////////////////

// class DiscoverModel {
//   List<UserData>? data;
//   bool? success;

//   DiscoverModel({this.data, this.success});

//   DiscoverModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <UserData>[];
//       json['data'].forEach((v) {
//         data!.add(new UserData.fromJson(v));
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
//   String? referenceLink;
//   var referenceId;
//   String? description;
//   String? about;
//   var verifiedByNumber;
//   var otp;
//   var emailVerifiedAt;
//   var isBlock;
//   var forgetPasswordCode;
//   String? roleId;
//   String? createdAt;
//   String? updatedAt;
//   String? lon;
//   String? lat;
//   var automation;
//   bool? isFriend;
//   List<Images>? images;

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
//       this.isFriend,
//       this.images});

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
//     isFriend = json['is_friend'];
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
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
//     data['is_friend'] = this.isFriend;
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
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

/////////////////////////////////////////////////////////////
///
///

class DiscoverModel {
  List<UserData>? data;
  bool? success;

  DiscoverModel({this.data, this.success});

  DiscoverModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(new UserData.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class UserData {
  var id;
  String? firstName;
  String? midName;
  String? lastName;
  String? preferredName;
  String? phone;
  int? isLogin;
  var age;
  String? education;
  String? gender;
  String? accountForId;
  String? email;
  String? address;
  String? type;
  String? profile;
  String? city;
  String? country;
  var status;
  String? referenceLink;
  var referenceId;
  String? userLink;
  var userId;
  String? description;
  String? about;
  var verifiedByNumber;
  var otp;
  var emailVerifiedAt;
  var isBlock;
  var forgetPasswordCode;
  String? roleId;
  String? createdAt;
  String? updatedAt;
  String? lon;
  String? lat;
  String? deviceToken;
  var automation;
  bool? isRecomended;
  bool? isFriend;
  int? healthScore;
  String? profession;
  List<DiscoverImages>? images;

  UserData(
      {this.id,
      this.firstName,
      this.midName,
      this.lastName,
      this.preferredName,
      this.phone,
      this.age,
      this.isLogin,
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
      this.userLink,
      this.userId,
      this.description,
      this.about,
      this.deviceToken,
      this.verifiedByNumber,
      this.otp,
      this.emailVerifiedAt,
      this.isBlock,
      this.forgetPasswordCode,
      this.roleId,
      this.healthScore,
      this.createdAt,
      this.updatedAt,
      this.lon,
      this.lat,
      this.automation,
      this.isRecomended,
      this.isFriend,
      this.profession,
      this.images});

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
    isLogin = json['is_login'];
    address = json['address'];
    type = json['type'];
    profile = json['profile'];
    city = json['city'];
    country = json['country'];
    status = json['status'];
    referenceLink = json['reference_link'];
    referenceId = json['reference_id'];
    userLink = json['user_link'];
    userId = json['user_id'];
    description = json['description'];
    about = json['about'];
    deviceToken = json['device_token'];
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
    isRecomended = json['is_recomended'];
    isFriend = json['is_friend'];
    healthScore = json['health_score'];
    profession =
        json.containsKey('profession') ? json['profession']['name'] : '';
    if (json['images'] != null) {
      images = <DiscoverImages>[];
      json['images'].forEach((v) {
        images!.add(new DiscoverImages.fromJson(v));
      });
    }
  }
  // if (json['profession']['name'] != null) {
  //     profession = json['profession']['name'];
  //   }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['mid_name'] = this.midName;
    data['last_name'] = this.lastName;
    data['preferred_name'] = this.preferredName;
    data['phone'] = this.phone;
    data['age'] = this.age;
    data['education'] = this.education;
    data['gender'] = this.gender;
    data['account_for_id'] = this.accountForId;
    data['email'] = this.email;
    data['address'] = this.address;
    data['type'] = this.type;
    data['profile'] = this.profile;
    data['city'] = this.city;
    data['health_score'] = healthScore;
    data['is_login'] = this.isLogin;
    data['country'] = this.country;
    data['status'] = this.status;
    data['reference_link'] = this.referenceLink;
    data['reference_id'] = this.referenceId;
    data['user_link'] = this.userLink;
    data['user_id'] = this.userId;
    data['description'] = this.description;
    data['about'] = this.about;
    data['verified_by_number'] = this.verifiedByNumber;
    data['otp'] = this.otp;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['is_block'] = this.isBlock;
    data['forget_password_code'] = this.forgetPasswordCode;
    data['role_id'] = this.roleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['automation'] = this.automation;
    data['is_recomended'] = this.isRecomended;
    data['is_friend'] = this.isFriend;
    data['device_token'] = this.deviceToken;
    data['profession'] = this.profession;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DiscoverImages {
  int? id;
  int? userId;
  String? image;
  var status;
  String? createdAt;
  String? updatedAt;

  DiscoverImages(
      {this.id,
      this.userId,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  DiscoverImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
