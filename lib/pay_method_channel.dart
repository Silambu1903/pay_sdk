import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:payapp/pay_platform_interface.dart';

/// An implementation of [PayPlatform] that uses method channels.
class MethodChannelPay extends PayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mediumExplain/battery');
  String? argument;
  @override
  Future<String?> makePayment({String? payTransactionUrl}) async {
    argument =payTransactionUrl;
    final makePayment = await methodChannel.invokeMethod<String>('getAndroid1',argument);
    return makePayment;
  }
}
