import 'package:flutter/material.dart';
import '../styles/text_style.dart';

class TermsOfUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Use'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Last Updated: September 9, 2024',
                  style: CustomTextStyle.primaryBlack
              ),
              SizedBox(height: 16.0),
              Text(
                'Welcome to JMakers. By accessing or using our application, you agree to comply with and be bound by the following Terms of Use. Please read these terms carefully before using our services.',
                  style: CustomTextStyle.primaryBlack
              ),
              SizedBox(height: 24.0),
              _buildSectionTitle('1. Acceptance of Terms'),
              _buildSectionContent(
                'By creating an account and using JMakers, you agree to these Terms of Use and our Privacy Policy. If you do not agree with any of these terms, please do not use our application.',
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('2. Account Registration and Authentication'),
              _buildSectionContent(
                'To use JMakers, you must register an account and provide accurate, complete, and current information. You are responsible for maintaining the confidentiality of your login credentials and for all activities that occur under your account. Notify us immediately if you suspect any unauthorized use of your account.',
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('3. Collection and Use of Personal Information'),
              _buildSectionContent(
                'We collect personal information from users during registration and while using the application. This may include:\n\n'
                    '• Identification Information: Name, email address, and other contact details.\n'
                    '• Usage Data: Information about your use of the application, including attendance records, and other interactions.\n\n'
                    'We use this information to:\n\n'
                    '• Provide and improve our services.\n'
                    '• Communicate with you regarding your account and updates.\n'
                    '• Ensure compliance with our terms and policies.',
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('4. Data Storage and Protection'),
              _buildSectionContent(
                'Firebase: We use Firebase to store and manage user data online. Firebase provides secure cloud-based data storage and real-time synchronization.\n\n'
                    'Hive: We use Hive for offline data storage to ensure the availability and integrity of your data when you are not connected to the internet.\n\n'
                    'We implement measures to protect your data and ensure it is handled in accordance with our Privacy Policy.',
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('5. Privacy and Data Protection'),
              _buildSectionContent(
                'We are committed to protecting your privacy and handling your personal information securely. Our Privacy Policy outlines how we collect, use, and protect your data. By using JMakers, you consent to our Privacy Policy.',
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('6. Intellectual Property'),
              _buildSectionContent(
                'App Materials: The content within JMakers, including video tutorials, text, graphics, and other materials, is owned by JMakers or its licensors. All rights are reserved.\n\n'
                    'Trademarks: The JMakers logo and any related trademarks are the property of JMakers and are protected by applicable trademark laws. You may not use these trademarks without prior written consent.',
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('7. Usage Restrictions'),
              _buildSectionContent(
                'You agree not to:\n\n'
                    '• Use the application for any unlawful purposes or in violation of these Terms of Use.\n'
                    '• Attempt to interfere with or disrupt the functionality of the application.\n'
                    '• Copy, modify, distribute, or create derivative works based on the application or its content without authorization.',
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('8. Termination'),
              _buildSectionContent(
                'We reserve the right to suspend or terminate your account if you violate these Terms of Use or for any other reason deemed necessary. Upon termination, your right to use the application will cease immediately.',
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('9. Limitation of Liability'),
              _buildSectionContent(
                'JMakers is not liable for any indirect, incidental, or consequential damages arising from your use of the application or inability to use the application. Our total liability is limited to the maximum extent permitted by law.',
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('10. Changes to Terms'),
              _buildSectionContent(
                'We may update these Terms of Use from time to time. Any changes will be posted on this page with an updated effective date. Your continued use of the application after any changes constitutes your acceptance of the revised terms.',
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('11. Governing Law'),
              _buildSectionContent(
                'These Terms of Use are governed by and construed in accordance with the laws of the Philippines, without regard to its conflict of law principles.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
        style: CustomTextStyle.primaryBold
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
        style: CustomTextStyle.primaryBlack
    );
  }
}
