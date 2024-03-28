import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/log.png', // Adjust the path to your image
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            // Privacy Policy text
            '1. Privacy\n\n'
            'We at QFX Cinemas take our customers’ data seriously. '
            'The data we collect through mobile App and websites are '
            'property of QFX Cinemas only. The protection of your '
            'personal information and all the content you store on our '
            'service are well secured and are not disclosed to any third party. '
            'This privacy policy explains our practices for gathering, using, '
            'and disclosing the personal data of App and website visitors.\n\n'
            'Your personal information is only used by us to operate, maintain '
            'and improve the App/website. You consent to the collection and use '
            'of information in line with this policy by using the App/website. '
            'We may ask you for personal information that can be used to contact '
            'or identify you while you are using our App/website or during your '
            'visit to our theatre locations. We also particularly use the data '
            'collected to better serve our customers.\n\n'
            'Your data will be handled securely and in accordance with our privacy '
            'policy, and QFX Cinemas takes all reasonable measures to guarantee that.'
            '\n\n'
            // Add the rest of the policy text here...
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PrivacyPolicyPage(),
  ));
}
