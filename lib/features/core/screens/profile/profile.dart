import 'package:dalkor/features/core/screens/profile/widgets/about_section.dart';
import 'package:dalkor/features/core/screens/profile/widgets/contact_section.dart';
import 'package:dalkor/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Tab> tabs = [
    Tab(
      text: "Contact",
      icon: Icon(
        Icons.account_box,
        color: Colors.white.withOpacity(0.5),
      ),
    ),
    Tab(
      text: "About Provider",
      icon: Icon(
        Icons.info,
        color: Colors.white.withOpacity(0.5),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          titleTextStyle: const TextStyle(
            color: Colors.white,
          ),
          toolbarHeight: 275,
          title: Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Column(
              children: [
                profilePhotos(),
                profileName(),
                hobbies(),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: stats(),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            tabs: tabs,
            indicatorColor: Colors.white,
            labelColor: Colors.white.withOpacity(0.5),
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: contactSection(),
            ),
            const SingleChildScrollView(
              child: AboutSection(),
            ),
          ],
        ),
      ),
    );
  }

  Padding hobbies() {
    return const Padding(
      padding: EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
      ),
      child: Text(
        "KM4 - Hodan - Mogadishu",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }

  Padding profileName() {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Jama Guled",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Row stats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Meter No",
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "ABC2024",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Usage",
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "1657Kw",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Total Amount",
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "\$156.75",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }

  Container profilePhotos() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.secondary,
      ),
      width: 105,
      height: 105,
      alignment: Alignment.center,
      child: const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(
          "https://picsum.photos/300/300",
        ),
      ),
    );
  }
}
