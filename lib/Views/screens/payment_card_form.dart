import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ViewModel/Payment_controller.dart';
import '../../ViewModel/login_controller.dart';
import '../../ViewModel/signup_controller.dart';
import '../../utils/shared_preferences.dart';
import '../widgets/app_bar.dart';
import '../widgets/loading_button.dart';

final loginController = Get.put(LoginController());
final signupController = Get.put(SignupScreenController());

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
              _buildTextField(controller: cardHolderNameController, label: "Cardholder Name", validator: (v) => v!.isEmpty ? "Required" : null),
              const SizedBox(height: 12),
              _buildTextField(
                controller: cardNumberController,
                label: "Card Number",
                keyboardType: TextInputType.number,
                validator: (v) => v!.length != 16 ? "Must be 16 digits" : null,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                controller: expiryDateController,
                label: "Expiry Date (MM/YY)",
                validator: (v) => v!.isEmpty ? "Enter expiry date" : null,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                controller: cvvController,
                label: "CVV",
                keyboardType: TextInputType.number,
                obscureText: true,
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
