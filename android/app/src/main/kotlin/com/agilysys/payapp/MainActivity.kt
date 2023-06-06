package com.agilysys.payapp

import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import android.widget.Toast

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.agilysys.payments.controller.PayController

class MainActivity: FlutterFragmentActivity() {

    private val CHANNEL = "mediumExplain/battery"

    lateinit var  _result: MethodChannel.Result

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            // This method is invoked on the main thread.
            // TODO
            _result = result
            if (call.method == "getAndroid1") {
                val payController = PayController(this)
                payController.executePayments("{\n" +
                        "    \"uri\": \"https://aks-pay-qa.hospitalityrevolution.com/pay-iframe-service/iFrame/tenants/0/62678ea396992f0de7c768ed?apiToken=7a68fb20-a72c-46c3-b31b-a804a48b9fae&submit=Pay&style=https://authorize.rguest.com/AuthorizeStyles/Authorize_Style.css&doVerify=false&version=3&payToken=4b9cbf654c064a73919634385db87f46&transactionType=sale&withToken=true\"\n" +
                        "}")

            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        try {
            super.onActivityResult(requestCode, resultCode, data)
            if (requestCode == 200 && resultCode == RESULT_OK) {
                val datas = data?.getStringExtra("response")
                //   Toast.makeText(activity,datas,Toast.LENGTH_LONG).show()
                _result.success(datas)
            }
        } catch (ex: Exception) {
            Toast.makeText(this.applicationContext,ex.message, Toast.LENGTH_LONG).show()
        }
    }
}
