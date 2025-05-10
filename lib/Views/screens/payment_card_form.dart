import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_ecommerce_meuble/Views/widgets/app_bar.dart';
import 'package:projet_ecommerce_meuble/Views/widgets/form_textfiled.dart';
import 'package:projet_ecommerce_meuble/Views/widgets/loading_button.dart';

import '../../ViewModel/Payment_controller.dart';
import '../../utils/sizes.dart';


class PaymentCardForm extends StatefulWidget {
  const PaymentCardForm({super.key});

  @override
  PaymentCardFormState createState() => PaymentCardFormState();
}

class PaymentCardFormState extends State<PaymentCardForm> {
  final PaymentController paymentController = Get.put(PaymentController());
  final _formKey = GlobalKey<FormState>();

  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();
  final cardHolderNameController = TextEditingController();

  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(_validateForm);
    expiryDateController.addListener(_validateForm);
    cvvController.addListener(_validateForm);
    cardHolderNameController.addListener(_validateForm);
  }

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isFormValid != isValid) {
      setState(() {
        isFormValid = isValid;
      });
    }
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    cardHolderNameController.dispose();
    super.dispose();
  }

  Future<void> handlePayment() async {
    if (_formKey.currentState!.validate()) {
      await paymentController.handlePayPress();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Card Information", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              FormTextFiled(
                controller: cardHolderNameController,
                label: "Cardholder Name",
                hintText: "Name LastName",
                validator: (v) => v!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 12),

              FormTextFiled(
                controller: cardNumberController,
                label: "Card Number",
                hintText: "1234 5678 9012 3456",
                typeInput: TextInputType.number,
                validator: (v) => v!.replaceAll(' ', '').length != 16 ? "Must be 16 digits" : null,
              ),
              const SizedBox(height: 12),

              FormTextFiled(
                controller: expiryDateController,
                label: "Expiry Date (MM/YY)",
                hintText: "08/25",
                validator: (v) => v!.isEmpty ? "Enter expiry date" : null,
              ),
              const SizedBox(height: 12),

              FormTextFiled(
                controller: cvvController,
                label: "CVV",
                hintText: "123",
                typeInput: TextInputType.number,
                validator: (v) => v!.length != 3 ? "Must be 3 digits" : null,
              ),
              const SizedBox(height: 30),

              LoadingButton(
                onPressed: isFormValid ? handlePayment : null,
                text: 'Pay',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
