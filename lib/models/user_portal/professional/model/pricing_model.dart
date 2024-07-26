class PriceModel {
  List<PricingModel>? data;
  bool? success;

  PriceModel({this.data, this.success});

  PriceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PricingModel>[];
      json['data'].forEach((v) {
        data!.add(new PricingModel.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class PricingModel {
  int? id;
  final int userId;
  final String amount;
  final int mins;

  PricingModel({
    this.id,
    required this.userId,
    required this.amount,
    required this.mins,
  });
  factory PricingModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PricingModel(
      id: json['id'],
      userId: json['user_id'],
      amount: json['amount'],
      mins: json['mins'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'amount': amount,
      'mins': mins,
    };
  }
}
