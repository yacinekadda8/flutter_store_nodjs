import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:flutter_store_nodjs/components/myconstans.dart';
import 'package:gap/gap.dart';

import '../../home/widgets/costum_btn.dart';

class PaymentBottomSheet extends StatelessWidget {
  final int totalPrice;
  final String productName;
  const PaymentBottomSheet(
      {super.key, required this.productName, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    //final homeProvider = Provider.of<HomeProvider>(context);
    var myWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: myWidth,
      //height: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Choose Payment Method'),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: CusstomBtn(
              text: 'Pay with PayPal',
              color: MyConstans.lightBlueSecondary,
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckout(
                    sandboxMode: true,
                    clientId:
                        "AbmttXAOomwNzlANIV2o1Kii6Fo4DqXHUen2gD2hTKENMn0csynR8SK1fAe3Hw8_7IpPk1w2SW4EKPPZ",
                    secretKey:
                        "EMan8fXU8NGNDJZDdvaamMNE7pH_ueaR6I6kpoPSeGTYdwpoPRWfKz_JQUF5PGRuQ5IPvZfLZAy5RmTf",
                    returnURL: "success.snippetcoder.com",
                    cancelURL: "cancel.snippetcoder.com",
                    transactions: [
                      {
                        "amount": {
                          "total": totalPrice.toString(),
                          "currency": "USD",
                          "details": {
                            "subtotal": totalPrice.toString(),
                            "shipping": '0',
                            "shipping_discount": 0.toString()
                          }
                        },
                        "description": "The payment transaction description.",
                        // "payment_options": {
                        //   "allowed_payment_method":
                        //       "INSTANT_FUNDING_SOURCE"
                        // },
                        "item_list": {
                          "items": [
                            {
                              "name": productName,
                              "quantity": 1.toString(),
                              "price": totalPrice.toString(),
                              "currency": "USD"
                            },
                          ],

                          // shipping address is not required though
                          //   "shipping_address": {
                          //     "recipient_name": "Raman Singh",
                          //     "line1": "Delhi",
                          //     "line2": "",
                          //     "city": "Delhi",
                          //     "country_code": "IN",
                          //     "postal_code": "11001",
                          //     "phone": "+00000000",
                          //     "state": "Texas"
                          //  },
                        }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      debugPrint("onSuccess: $params");
                    },
                    onError: (error) {
                      debugPrint("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      debugPrint('cancelled:');
                    },
                  ),
                ));
              },
            ),
          ),
          const Gap(16.0),
          SizedBox(
            width: 300,
            height: 50,
            child: CusstomBtn(
              text: 'Pay with Credit Card',
              color: MyConstans.yellowPrimary,
              onPressed: () {
                // Handle Credit Card payment
                debugPrint('Processing Credit Card Payment');
                Navigator.pop(context); // Close the bottom sheet
              },
            ),
          )
        ],
      ),
    );
  }
}
