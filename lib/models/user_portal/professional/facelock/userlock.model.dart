import 'dart:convert';

class UserLockModel {
  String user;
  // String password;
  List modelData;

  UserLockModel({
    required this.user,
    // required this.password,
    required this.modelData,
  });

  static UserLockModel fromMap(Map<String, dynamic> user) {
    return new UserLockModel(
      user: user['user'],
      // password: user['password'],
      modelData: jsonDecode(user['model_data']),
    );
  }

  toMap() {
    return {
      'user': user,
      // 'password': password,
      'model_data': jsonEncode(modelData),
    };
  }
}
