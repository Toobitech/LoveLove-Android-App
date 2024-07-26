import 'DiscoverModel.dart';

class FilterModel {
  FilterModel({
    required this.data,
    required this.success,
  });
  late final List<UserData> data;
  late final bool success;

  FilterModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => UserData.fromJson(e)).toList();
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['success'] = success;
    return _data;
  }
}
