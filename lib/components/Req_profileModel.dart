// class Req_profileModel {
//   bool success;
//   List<VerifiedData>? data;

//   Req_profileModel({required this.success, required this.data});

//   Req_profileModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['data'] != null) {
//       data = <VerifiedData>[];
//       json['data'].forEach((v) {
//         data!.add(new VerifiedData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
class Req_profileModel {
  Req_profileModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<VerifiedData> data;

  Req_profileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data =
        List.from(json['data']).map((e) => VerifiedData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class VerifiedData {
  int? id;
  String? firstName;
  String? midName;
  String? lastName;
  String? preferredName;
  String? age;
  String? education;
  String? intrest;
  String? accCreatedBy;
  var gender;
  String? description;
  String? phoneNumber;
  String? email;
  var emailVerifiedAt;
  var address;
  var type;
  String? roleId;
  var profile;
  var status;
  String? createdAt;
  String? updatedAt;
  String? lon;
  String? lat;
  String? forgetPasswordCode;
  List<Images>? images;

  VerifiedData(
      {this.id,
      this.firstName,
      this.midName,
      this.lastName,
      this.preferredName,
      this.age,
      this.education,
      this.intrest,
      this.accCreatedBy,
      this.gender,
      this.description,
      this.phoneNumber,
      this.email,
      this.emailVerifiedAt,
      this.address,
      this.type,
      this.roleId,
      this.profile,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.lon,
      this.lat,
      this.forgetPasswordCode,
      this.images});

  VerifiedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    midName = json['mid_name'];
    lastName = json['last_name'];
    preferredName = json['preferred_name'];
    age = json['age'];
    education = json['education'];
    intrest = json['intrest'];
    accCreatedBy = json['acc_created_by'];
    gender = json['gender'];
    description = json['description'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    address = json['address'];
    type = json['type'];
    roleId = json['role_id'];
    profile = json['profile'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lon = json['lon'];
    lat = json['lat'];
    forgetPasswordCode = json['forget_password_code'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['mid_name'] = this.midName;
    data['last_name'] = this.lastName;
    data['preferred_name'] = this.preferredName;
    data['age'] = this.age;
    data['education'] = this.education;
    data['intrest'] = this.intrest;
    data['acc_created_by'] = this.accCreatedBy;
    data['gender'] = this.gender;
    data['description'] = this.description;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['address'] = this.address;
    data['type'] = this.type;
    data['role_id'] = this.roleId;
    data['profile'] = this.profile;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['forget_password_code'] = this.forgetPasswordCode;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
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
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
