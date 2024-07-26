class DateTimeModel {
  List<Dates>? data;
  bool? success;

  DateTimeModel({this.data, this.success});

  DateTimeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Dates>[];
      json['data'].forEach((v) {
        data!.add(new Dates.fromJson(v));
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

class Dates {
  int? id;
  final String date;
  final String startTime;
  final String endTime;
  final bool isBooked;

  Dates({
    this.id,
    required this.isBooked,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
  factory Dates.fromJson(
    Map<String, dynamic> json,
  ) {
    return Dates(
        id: json['id'],
        date: json['date'],
        startTime: json['from'],
        endTime: json['to'],
        isBooked: json['is_booked']);
  }

  Map<String, dynamic> toJson() {
    // String formattedStartTime = startTime.hour.toString().padLeft(2, '0') +
    //     ":" +
    //     startTime.minute.toString().padLeft(2, '0');
    // String formattedEndTime = endTime.hour.toString().padLeft(2, '0') +
    //     ":" +
    //     endTime.minute.toString().padLeft(2, '0');
    return {
      'date': date,
      'from': startTime,
      'to': endTime,
    };
  }
}
