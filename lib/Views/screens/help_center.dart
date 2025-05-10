import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xFFFF7742);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Help Center'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            const SizedBox(height: 24),

            _buildQuestionAnswer(
              question: 'How can I contact customer support?',
              answer:
                  'If you have any questions or need assistance, please contact our customer support team at arkea.contact@gmail.com.',
            ),

            _buildQuestionAnswer(
              question: 'Can I return or exchange products?',
              answer:
                  'Yes, we have a hassle-free return and exchange policy. If you are not satisfied with your purchase, you can initiate a return or exchange within 30 days of the purchase date.',
            ),

            _buildQuestionAnswer(
              question: 'What payment methods do you accept?',
              answer:
                  'We accept major credit cards, debit cards, and PayPal for secure and convenient payments.',
            ),

            _buildQuestionAnswer(
              question: 'How long does delivery take?',
              answer:
                  'Delivery times vary depending on your location, but typically it takes between 3 to 7 business days.',
            ),

            _buildQuestionAnswer(
              question: 'Can I track my order?',
              answer:
                  'Yes, once your order is shipped, you will receive a tracking number via email to follow your package.',
            ),

            const SizedBox(height: 40),

            // Nouvelle section contact téléphonique
            Text(
              'En cas de problème, vous pouvez nous appeler sur ces numéros :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '📞 92 629 301\n📞 22 829 515',
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionAnswer({
    required String question,
    required String answer,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.question_answer,
                color: Color(0xFFFF7742), // ta couleur dominante
                size: 24,
              ),
              const SizedBox(width: 8), // Proper spacing between icon and text
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ), // Proper spacing between question and answer
          Text(
            answer,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
