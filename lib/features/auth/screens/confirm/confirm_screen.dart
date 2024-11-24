import 'package:dalkor/features/auth/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String meterNumber;

  const ConfirmationScreen({super.key, required this.meterNumber});

  void _navigateToOTP(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTPScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The provided meter number $meterNumber is registered with the phone number +252615****00.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'To confirm this, we will send an OTP to this number for verification.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _navigateToOTP(context),
                child: const Text('Send OTP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
