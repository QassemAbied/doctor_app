import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentService {
  static Future<void> initPaymentSheet({
    required String paymentIntentId,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentId,
        merchantDisplayName: 'Doctor App',
      ),
    );
  }

  static Future<void> disPlayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        throw Exception("Payment canceled");
      } else {
        throw Exception("Payment error");
      }
    } catch (e) {
      throw Exception("Payment error");
    }
  }

  static Future<void> makePayment({required int amount}) async {
    try {
      final response = await Supabase.instance.client.functions.invoke(
        'create-payment-intent',
        body: {'amount': amount},
      );

      final clientSecret = response.data['clientSecret'];

      await initPaymentSheet(paymentIntentId: clientSecret);

      await disPlayPaymentSheet();
    } catch (e) {
      rethrow;
    }
  }
}
