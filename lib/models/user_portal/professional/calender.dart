import 'package:LoveLove/components/custom_button.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/professional/controller/profession_controller.dart';
import 'package:LoveLove/models/user_portal/professional/model/datetime_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../global/snackbar.dart';
import 'model/pricing_model.dart';

class CalendarDialog extends StatefulWidget {
  final int professionUid;
  final String professioName;
  final PricingModel dataSet;

  CalendarDialog(
      {required this.professionUid,
      required this.professioName,
      required this.dataSet});

  @override
  _CalendarDialogState createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  String? selDate;
  String? formattedDate;
  final controller = Get.put(ProfessionController());
  DateTime _setDateTime = DateTime.now();

  DateTime _targetDateTime = DateTime.now();
  late CalendarCarousel<Event> _calendarCarouselNoHeader;
  late EventList<Event> _markedDateMap = EventList<Event>(events: {});
  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('yyyy-MM-dd').format(_setDateTime);
    controller.getProfessionaDates(
        widget.professionUid.toString(), formattedDate!);
  }

  @override
  Widget build(BuildContext context) {
    print('object Book Appointment ');
    print(
        'UserID ${widget.dataSet.userId} PlanID ${widget.dataSet.id.toString()} UserAmount${widget.dataSet.amount} UserMins${widget.dataSet.mins}');
    Map<DateTime, List<Event>> selectedDatesMap = {
      _setDateTime: [
        Event(
          date: _setDateTime,
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(1000)),
              border: Border.all(color: Colors.blue, width: 2.0),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.amber,
            ),
          ),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            color: AppColors.pink,
            height: 5.0,
            width: 5.0,
          ),
        ),
      ]
    };

    _markedDateMap = EventList<Event>(events: selectedDatesMap);
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: AppColors.pink,
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() {
          if (_setDateTime != null) {
            _setDateTime = date;
            formattedDate = DateFormat('yyyy-MM-dd').format(_setDateTime);
            controller.selectedsdateIndex.value = 0;
            print('Current Date ${formattedDate}');
            controller.getProfessionaDates(
                widget.professionUid.toString(), formattedDate!);

            Event event = Event(title: 'Your Event Title', date: date);
            events.add(event);
            events.forEach((event) => print("Event Title ${event.title}"));
          }
        });
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekdayTextStyle: TextStyle(
        color: AppColors.pink,
      ),
      weekendTextStyle: TextStyle(
        color: AppColors.pink,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: 250.0,
      selectedDateTime: _setDateTime,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: AppColors.pink, width: 3)),
      markedDateCustomTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: const TextStyle(
        color: Colors.black,
      ),
      todayButtonColor: AppColors.pink,
      selectedDayButtonColor: AppColors.pink,
      selectedDayTextStyle: TextStyle(
        color: AppColors.white,
      ),
      markedDatesMap: _markedDateMap,
      minSelectedDate:
          DateTime(_targetDateTime.year, _targetDateTime.month - 1, 20),
      maxSelectedDate:
          DateTime(_targetDateTime.year, _targetDateTime.month + 1, 20),
      prevDaysTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      inactiveDaysTextStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  widget.professioName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.pink),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      DateFormat.yMMM().format(_targetDateTime),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   child: const Text('NEXT'),
                  //   onPressed: () {
                  //     setState(() {
                  //       _targetDateTime = DateTime(
                  //           _targetDateTime.year, _targetDateTime.month + 1);
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _calendarCarouselNoHeader,
            ),
            vertical(20),
            SizedBox(
                height: 150,
                child: Obx(() => controller.clsisLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.pink,
                        ),
                      )
                    : controller.getDatesList.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.getDatesList
                                .where((p0) => p0.date == formattedDate)
                                .length,
                            itemBuilder: (context, index) {
                              Dates item = controller.getDatesList[index];
                              return Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    item.isBooked == true
                                        ? Checkbox(
                                            activeColor: AppColors.pink,
                                            value: true,
                                            onChanged: (value) {
                                              showInSnackBar(
                                                  'This is Already Booked....',
                                                  color: Colors.red);
                                            },
                                          )
                                        : Obx(() => Checkbox(
                                              activeColor: AppColors.pink,
                                              value: controller
                                                      .selectedsdateIndex
                                                      .value ==
                                                  item.id,
                                              onChanged: (value) {
                                                controller.selectDateSchedule(
                                                    value! ? item.id! : -1);
                                                print(item.id);
                                                print(controller
                                                    .selectedsdateIndex.value);
                                              },
                                            )),
                                    Text(
                                      "${item.startTime} to ${item.endTime}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: item.isBooked == true
                                              ? Colors.grey
                                              : AppColors.pink),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Center(
                            child: SizedBox(
                              height: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "$formattedDate",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.pink),
                                  ),
                                  Text(
                                    "Not Available",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ))),
            vertical(5),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(
                  title: 'Confirm',
                  tap: () {
                    print(controller.selectedsdateIndex.value);
                    if (controller.selectedsdateIndex.value != 0 &&
                        controller.selectedsdateIndex.value != -1) {
                      controller.postSelectSchedule(
                          widget.dataSet.amount,
                          widget.dataSet.mins.toString(),
                          widget.dataSet.id.toString() == 'null'
                              ? '0'
                              : widget.dataSet.id.toString(),
                          widget.professionUid.toString(),
                          controller.selectedsdateIndex.value.toString());
                    } else {
                      showInSnackBar('Please Select Correct Time.....',
                          color: Colors.red);
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
