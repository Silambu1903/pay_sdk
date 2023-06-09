
import 'package:payapp/pay_platform_interface.dart';

class PayApp {
  Future<dynamic> makePayment({String?  payTransactionUrl}) {
    return PayPlatform.instance.makePayment(payTransactionUrl: payTransactionUrl);
  }
}



