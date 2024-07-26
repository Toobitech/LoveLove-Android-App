class DataCallLogsModel {
  List<CallLogsModel>? data;
  bool? success;

  DataCallLogsModel({this.data, this.success});

  DataCallLogsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CallLogsModel>[];
      json['data'].forEach((v) {
        data!.add(CallLogsModel.fromJson(v));
      });
    }
    success = json['success'];
  }
}

class CallLogsModel {
  final int id;
  final int userId;
  final int timeDuration;
  final int remainingTime;
  final String callType;
  final DateTime createdAt;
  final ProfessionUser professionUser;

  CallLogsModel({
    required this.id,
    required this.userId,
    required this.timeDuration,
    required this.remainingTime,
    required this.callType,
    required this.createdAt,
    required this.professionUser,
  });

  factory CallLogsModel.fromJson(Map<String, dynamic> json) {
    return CallLogsModel(
      id: json['id'],
      userId: json['user_id'],
      timeDuration: json['time_duration'],
      remainingTime: json['remaining_time'],
      callType: json['type'],
      createdAt: DateTime.parse(json['created_at']),
      professionUser: ProfessionUser.fromJson(json['profession_user']),
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['user_id'] = this.userId;
  //   data['time_duration'] = this.timeDuration;
  //   data['remaining_time'] = this.remainingTime;
  //   data['type'] = this.callType;
  //   data['created_at'] = this.createdAt;
  //   return data;
  // }
}

class ProfessionUser {
  final int id;
  final String firstName;
  final String lastName;
  final String profile;

  ProfessionUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profile,
  });

  factory ProfessionUser.fromJson(Map<String, dynamic> json) {
    return ProfessionUser(
      id: json['id'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      profile: json['profile'] ?? '',
    );
  }
}
