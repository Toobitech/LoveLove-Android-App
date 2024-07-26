class RelationModel {
  RelationModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;

  RelationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];

    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Data.fromJson(Map<String, dynamic> json) {
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

List<Data>? relationDataList;
