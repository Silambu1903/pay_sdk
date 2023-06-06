import 'package:payapp/pay_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// import 'digitalkey_method_channel.dart';

abstract class PayPlatform extends PlatformInterface {
  /// Constructs a PayPlatform.
  PayPlatform() : super(token: _token);

  static final Object _token = Object();

  static PayPlatform _instance = MethodChannelPay();

  /// The default instance of [PayPlatform] to use.
  ///
  /// Defaults to [MethodChannelPay].
  static PayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PayPlatform] when
  /// they register themselves.
  static set instance(PayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<dynamic> makePayment() {
    throw UnimplementedError('Unable to pay');
  }
}
