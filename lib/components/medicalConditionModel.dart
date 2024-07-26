class MedicalConditionModel {
  MedicalConditionModel({
    required this.success,
    required this.data1,
    required this.data2,
  });
  late final bool success;
  late final List<MedicalData1> data1;
  late final List<MedicalData2> data2;

  MedicalConditionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data1 =
        List.from(json['data1']).map((e) => MedicalData1.fromJson(e)).toList();
    data2 =
        List.from(json['data2']).map((e) => MedicalData2.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data1'] = data1.map((e) => e.toJson()).toList();
    _data['data2'] = data2.map((e) => e.toJson()).toList();
    return _data;
  }
}

class MedicalData1 {
  MedicalData1({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  MedicalData1.fromJson(Map<String, dynamic> json) {
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

class MedicalData2 {
  MedicalData2({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  MedicalData2.fromJson(Map<String, dynamic> json) {
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
