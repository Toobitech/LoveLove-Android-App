class ProfessionCategory {
  List<ProfessionModel>? data;
  bool? success;

  ProfessionCategory({this.data, this.success});

  ProfessionCategory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProfessionModel>[];
      json['data'].forEach((v) {
        data!.add(ProfessionModel.fromJson(v));
      });
    }
    success = json['success'];
  }
}

class ProfessionModel {
  int id;
  String name;
  String slug;
  int status;
  String? createdAt;
  String? updatedAt;

  ProfessionModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfessionModel.fromJson(Map<String, dynamic> json) {
    return ProfessionModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
    );
  }
}
