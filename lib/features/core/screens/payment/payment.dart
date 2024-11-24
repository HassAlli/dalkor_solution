import 'package:dalkor/utils/constants/app_colors.dart';
import 'package:dalkor/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';


class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<PurchaseScreen> {
  final double ratePerKw = 0.41;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController kwController = TextEditingController();
  bool isAmountSelected = true;

  void calculateEquivalent({bool fromAmount = true}) {
    if (fromAmount) {
      double amount = double.tryParse(amountController.text) ?? 0;
      kwController.text = (amount / ratePerKw).toStringAsFixed(2);
    } else {
      double kw = double.tryParse(kwController.text) ?? 0;
      amountController.text = (kw * ratePerKw).toStringAsFixed(2);
    }
  }

  void handleSuggestion(double value, {bool isAmount = true}) {
    if (isAmount) {
      amountController.text = value.toString();
      calculateEquivalent(fromAmount: true);
    } else {
      kwController.text = value.toString();
      calculateEquivalent(fromAmount: false);
    }
  }

  void handlePayment() {
    String amount = amountController.text;
    String kw = kwController.text;

    if (amount.isNotEmpty && kw.isNotEmpty) {
      // Add payment processing logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment of \$${amount} for $kw KW processed!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid amount or KW.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text(
          "Purchase",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.md),
        child: Column(
          children: [
            ToggleButtons(
              isSelected: [isAmountSelected, !isAmountSelected],
              onPressed: (index) {
                setState(() {
                  isAmountSelected = index == 0;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Amount (\$)"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("KW (kiloWatt)"),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount (\$)",
                hintText: "Enter amount",
                border: OutlineInputBorder(),
              ),
              enabled: isAmountSelected,
              onChanged: (_) => calculateEquivalent(fromAmount: true),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [5, 10, 15, 20]
                  .map((e) => ChoiceChip(
                        label: Text("\$$e"),
                        onSelected: (_) => handleSuggestion(e.toDouble(), isAmount: true),
                        selected: false,
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: kwController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Kilowatts (KW)",
                hintText: "Enter kilowatts",
                border: OutlineInputBorder(),
              ),
              enabled: !isAmountSelected,
              onChanged: (_) => calculateEquivalent(fromAmount: false),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [10, 25, 50, 100]
                  .map((e) => ChoiceChip(
                        label: Text("${e}KW"),
                        onSelected: (_) => handleSuggestion(e.toDouble(), isAmount: false),
                        selected: false,
                      ))
                  .toList(),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: handlePayment,
                child: const Text("Process"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
