import 'package:dalkor/features/core/screens/history/widgets/payment_card.dart';
import 'package:dalkor/utils/constants/app_colors.dart';
import 'package:dalkor/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  double _totalAmount = 0;

  final List _historyItems = [
    {
      "date": "Nov 17, 2024",
      "description": "Prepaid",
      "amount": 18.5,
      "imageUrl": "https://i.postimg.cc/28Ptx5PS/LOGOFOLIO-09.png"
    },
    {
      "date": "Oct 10, 2024",
      "description": "Prepaid",
      "amount": 21.75,
      "imageUrl": "https://i.postimg.cc/28Ptx5PS/LOGOFOLIO-09.png"
    },
    {
      "date": "Sep 21, 2024",
      "description": "Prepaid",
      "amount": 11.0,
      "imageUrl": "https://i.postimg.cc/28Ptx5PS/LOGOFOLIO-09.png"
    },
    {
      "date": "Sep 02, 2024",
      "description": "Prepaid",
      "amount": 8.25,
      "imageUrl": "https://i.postimg.cc/28Ptx5PS/LOGOFOLIO-09.png"
    },
    {
      "date": "Aug 06, 2024",
      "description": "Prepaid",
      "amount": 28.0,
      "imageUrl": "https://i.postimg.cc/28Ptx5PS/LOGOFOLIO-09.png"
    },
    {
      "date": "Jul 01, 2024",
      "description": "Prepaid",
      "amount": 28.0,
      "imageUrl": "https://i.postimg.cc/28Ptx5PS/LOGOFOLIO-09.png"
    },
    {
      "date": "Jun 04, 2024",
      "description": "Prepaid",
      "amount": 28.0,
      "imageUrl": "https://i.postimg.cc/28Ptx5PS/LOGOFOLIO-09.png"
    },
    {
      "date": "May 19, 2024",
      "description": "Prepaid",
      "amount": 13.25,
      "imageUrl": "https://i.postimg.cc/28Ptx5PS/LOGOFOLIO-09.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    // Set the total amount
    _totalAmount = 0;
    _historyItems.forEach((element) {
      _totalAmount += element["amount"];
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment History",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    label: const Text("Search.."),
                    border: const OutlineInputBorder(),
                    prefixIcon: Icon(PhosphorIcons.magnifyingGlass()),
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.md),

              // History Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "2024",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$$_totalAmount",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),

              // Cards
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => PaymentHistoryCard(
                  imageUrl: _historyItems[index]["imageUrl"],
                  date: _historyItems[index]["date"],
                  description: _historyItems[index]["description"],
                  amount: _historyItems[index]["amount"],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AppSizes.md),
                itemCount: _historyItems.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}

