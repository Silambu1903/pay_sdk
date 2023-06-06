
import 'package:payapp/pay_platform_interface.dart';

class PayApp {
  Future<dynamic> makePayment() {
    return PayPlatform.instance.makePayment();
  }
}



