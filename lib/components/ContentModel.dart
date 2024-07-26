class ContentModel {
  bool? success;
  ContentData? data;

  ContentModel({this.success, this.data});

  ContentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new ContentData.fromJson(json['data']) : null;
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

class ContentData {
  String? termAndCondition;
  String? privacyPolicy;
  String? helpSupport;

  ContentData({this.termAndCondition, this.privacyPolicy, this.helpSupport});

  ContentData.fromJson(Map<String, dynamic> json) {
    termAndCondition = json['term_and_condition'];
    privacyPolicy = json['privacy_policy'];
    helpSupport = json['help_support'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['term_and_condition'] = this.termAndCondition;
    data['privacy_policy'] = this.privacyPolicy;
    data['help_support'] = this.helpSupport;
    return data;
  }
}
