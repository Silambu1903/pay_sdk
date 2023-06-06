import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:payapp/pay_platform_interface.dart';

/// An implementation of [PayPlatform] that uses method channels.
class MethodChannelPay extends PayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mediumExplain/battery');

  @override
  Future<String?> makePayment() async {
    final makePayment = await methodChannel.invokeMethod<String>('getAndroid1');
    return makePayment;
  }
}
