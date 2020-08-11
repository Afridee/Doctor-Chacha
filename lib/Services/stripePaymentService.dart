import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({this.message, this.success});
}

class StripeService{
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String secret = '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';
  /*static String secret = 'sk_test_51Gs3X0LPvQisfAE0era9KXzMFzLZlXuIfmkivK5nlgkYiPwtEwXeZQELcpetozXAjehqruPJQDvmUkJKk6pwb6na003nNHx8XW';*/
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  static init() {
    StripePayment.setOptions(
        StripeOptions(
            publishableKey: "pk_live_PwLvcr4ktDJQfTl7qnsrR9iq00T48wCUef",
            /*publishableKey: "pk_test_51Gs3X0LPvQisfAE0p0h3IXdwXaBvLO4Lio64F5vkpjqn8npdMJ0aa8VimkbavyqdknWCkPUML2SSGsjsUJJPhQax00dxq1zdi9",*/
            merchantId: "gingergarlicadmn@gmail.com",
            androidPayMode: 'live'
        )
    );
  }

  static Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async{
    try{

      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          StripeService.paymentApiUrl,
          body: body,
          headers: StripeService.headers
      );

      return jsonDecode(response.body);
    }catch(err){
      print('err charging user: ${err.toString()}');
    }
    return null;
  }

  static Future<StripeTransactionResponse> payWithNewCard({String amount, String currency}) async {
    try{

      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest()
      );

      var paymentIntent = await StripeService.createPaymentIntent(
          amount,
          currency
      );

      var response = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent['client_secret'],
              paymentMethodId: paymentMethod.id
          )
      );

      if (response.status == 'succeeded') {
        return new StripeTransactionResponse(
            message: 'Transaction successful',
            success: true
        );
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed 1',
            success: false
        );
      }

    }catch(err){
      return new StripeTransactionResponse(
          message: 'Transaction failed 2: ${err.toString()}',
          success: false
      );
    }
  }




  static Future<StripeTransactionResponse> payViaExistingCard({String amount, String currency, CreditCard card}) async{
    try {
      var paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: card)
      );
      var paymentIntent = await StripeService.createPaymentIntent(
          amount,
          currency
      );
      var response = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent['client_secret'],
              paymentMethodId: paymentMethod.id
          )
      );
      if (response.status == 'succeeded') {
        return new StripeTransactionResponse(
            message: 'Transaction successful',
            success: true
        );
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed',
            success: false
        );
      }
    } on PlatformException catch(err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction failed: ${err.toString()}',
          success: false
      );
    }
  }

  static getPlatformExceptionErrorResult(err) {
    String message = 'Something went wrong';
    if (err.code == 'cancelled') {
      message = 'Transaction cancelled';
    }

    return new StripeTransactionResponse(
        message: message,
        success: false
    );
  }

}