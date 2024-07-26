class InterestModel {
  InterestModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<InterestData> data;

  InterestModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data =
        List.from(json['data']).map((e) => InterestData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class InterestData {
  InterestData({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  InterestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
