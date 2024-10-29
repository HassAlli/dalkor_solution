import 'package:dalkor/features/auth/screens/confirm/confirm_screen.dart';
import 'package:dalkor/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeterScreen extends StatefulWidget {
  const MeterScreen({super.key});

  @override
  State<MeterScreen> createState() => _MeterScreenState();
}

class _MeterScreenState extends State<MeterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _meterController = TextEditingController();

  final List<String> _meterNumbers = [
    "ABC2024",
    "ABC2023",
  ];

  void _navigateToConfirmation(BuildContext context, String meterNumber) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationScreen(meterNumber: meterNumber),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Please enter your meter number"),
                SizedBox(height: AppSizes.sm),
                TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: "Meter Number",
                    hintText: "KMHJ781819919",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your meter number';
                    } else if (!_meterNumbers.contains(value)) {
                      return 'Invalid meter number';
                    }

                    return null;
                  },
                ),
                SizedBox(height: AppSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                       _navigateToConfirmation(context, _meterController.text);
                      }
                    },
                    child: const Text("Continue"),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
