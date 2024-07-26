class UserSupportModel {
  bool? success;
  AdminData? data;

  UserSupportModel({this.success, this.data});

  UserSupportModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new AdminData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AdminData {
  int? id;
  String? firstName;
  var midName;
  String? lastName;
  var preferredName;
  var phone;
  var age;
  var education;
  var gender;
  String? accountForId;
  String? email;
  var address;
  String? type;
  String? profile;
  var city;
  var country;
  int? status;
  String? referenceLink;
  int? referenceId;
  var description;
  var about;
  int? verifiedByNumber;
  var otp;
  var emailVerifiedAt;
  int? isBlock;
  var forgetPasswordCode;
  String? roleId;
  String? createdAt;
  String? updatedAt;
  String? lon;
  String? lat;
  int? automation;

  AdminData(
      {this.id,
      this.firstName,
      this.midName,
      this.lastName,
      this.preferredName,
      this.phone,
      this.age,
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
      this.createdAt,
      this.updatedAt,
      this.lon,
      this.lat,
      this.automation});

  AdminData.fromJson(Map<String, dynamic> json) {
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
  }

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
    data['country'] = this.country;
    data['status'] = this.status;
    data['reference_link'] = this.referenceLink;
    data['reference_id'] = this.referenceId;
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
    return data;
  }
}
