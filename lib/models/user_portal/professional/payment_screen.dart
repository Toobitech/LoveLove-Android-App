import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../components/custom_backbutton.dart';
import '../../../components/custombutton_wigdet.dart';
import '../../../global/alertboxes.dart';
import '../../../global/snackbar.dart';
import '../../../helpers/keys.dart';
import '../profile/controller/profileDataController.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'controller/profession_controller.dart';
import 'user_profile_screen.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({
    super.key,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final myprofileIncontroller = Get.put(MyProfileController());

  final professionalcontroller = Get.put(ProfessionController());

  double selectAmount = 0.0;
  List<double> amountlist = [100, 250, 500, 1000, 1250, 1500];
  bool loading = false;
  Map<String, dynamic>? paymentIntentData;

  @override
  void initState() {
    super.initState();
  }

  int selectedAmountIndex = -1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                vertical(125),
                Center(
                    child: Image.asset(
                  'assets/images/icons/payment_heart.png',
                  height: 100,
                  width: 100,
                )),
                const SizedBox(height: 20),
                Container(
                  height: Get.height * 0.1,
                  width: 200,
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/icons/balance_group.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Center(
                      child: FittedBox(
                    child: Text(
                      '\$${myprofileIncontroller.UserDataList!.walletBalance!}',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                  )),
                ),
                vertical(25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Amount',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                    ),
                  ),
                ),
                vertical(15),
                Wrap(
                  children: amountlist
                      .asMap()
                      .entries
                      .map(
                        (entry) => GestureDetector(
                          onTap: () {
                            print('Selected Amount: ${entry.value}');
                            setState(() {
                              selectedAmountIndex = entry.key;
                              selectAmount = entry.value;
                            });
                          },
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: selectedAmountIndex == entry.key
                                  ? AppColors.pink
                                  : AppColors.white,
                              border: Border.all(
                                color: selectedAmountIndex == entry.key
                                    ? AppColors.white
                                    : AppColors.amount,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                // '\$ ${entry.value.toStringAsFixed(1)}',
                                '\$ ${entry.value}',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: selectedAmountIndex == entry.key
                                        ? AppColors.white
                                        : AppColors.amount),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                vertical(25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: CustomButtonWidget(
                      imageonly: 'assets/images/icons/payment_button.png',
                      isLoading: loading,
                      title: 'Top up',
                      tap: () async {
                        print('Make Payment');
                        if (selectAmount != 0.0) {
                          makePayment();
                        } else {
                          print('Please Select Amount');

                          showInSnackBar('Please Select Amount',
                              color: Colors.red);
                        }
                        // await showDialog<DateTime>(
                        //   context: context,
                        //   builder: (context) => CalendarDialog(
                        //     professionUid: widget.professionData.id,
                        //     professioName:
                        //         widget.professionData.firstName!,
                        //   ),
                        // );
                        // Get.to(ProfessionListScreen());
                      }),
                ),
              ],
            ),
            BottomSmallStyle(
                body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  vertical(Get.height * 0.16),
                ],
              ),
            )),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: CustomBackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      setState(() {
        loading = true;
      });
      print('your Amount $selectAmount');
      paymentIntentData = await createPaymentIntent(
        selectAmount,
        'USD',
      );

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        setupIntentClientSecret: AppKeys.sk_live,
        paymentIntentClientSecret: paymentIntentData!['client_secret'],
        customFlow: false,
        style: ThemeMode.light,
        customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
        customerId: paymentIntentData!['customer'],
        merchantDisplayName: 'Lovelove',
      ));

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      setState(() {
        loading = false;
      });
      print('Payment exception:$e$s');
    }
  }

  createPaymentIntent(double selectAmount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(selectAmount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ${AppKeys.sk_live}',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
      // return response.body;
    } catch (err) {
      print('Create Payment Intent Error: ${err.toString()}');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        Stripe.instance.confirmPaymentSheetPayment();
        print('payment intent ID' + paymentIntentData!['id'].toString());
        print('payment intent client_secret' +
            paymentIntentData!['client_secret'].toString());
        print(
            'payment intent amount' + paymentIntentData!['amount'].toString());
        // print('payment intent' + paymentIntentData.toString());
        // orderPlaceApi(paymentIntentData!['id'].toString());
        showLoadingDialog();
        showInSnackBar('Paid Successfully', color: Colors.green);
        professionalcontroller.postTopUp(paymentIntentData!['id'].toString(),
            paymentIntentData!['amount'].toString());
        Get.to(() => UserProfileScreen());
        // hideLoadingDialog();

        paymentIntentData = null;
      }).whenComplete(() {
        setState(() {
          loading = false;
        });
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      setState(() {
        loading = false;
      });
      print('Exception/DISPLAYPAYMENTSHEETS==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      setState(() {
        loading = false;
      });
      print('$e');
    }
  }

  calculateAmount(double amount) {
    final a = ((amount) * 100).toInt();
    return a.toString();
  }

  // calculateAmount(String amount) {
  //   final a = (int.parse(amount)) * 100;
  //   return a.toString();
  // }
}
