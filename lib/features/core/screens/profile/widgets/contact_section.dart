import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return contactSection();
  }
}

Column contactSection() {
  return Column(
    children: [
      contactDetail(),
      contactStatus(),
    ],
  );
}

Card contactStatus() {
  return const Card(
    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
    color: Colors.white,
    child: Column(
      children: [
        ListTile(
          iconColor: Colors.blueGrey,
          textColor: Colors.blueGrey,
          title: Text(
            "Status",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Available",
            style: TextStyle(color: Colors.black),
          ),
          dense: true,
        ),
      ],
    ),
  );
}

Card contactDetail() {
  return Card(
    margin: const EdgeInsets.all(20),
    color: Colors.white,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      child: const Column(
        children: [
          ListTile(
            iconColor: Colors.blueGrey,
            textColor: Colors.blueGrey,
            leading: Icon(Icons.phone_android),
            title: Text(
              "Mobile",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "+252 615000000",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
          ListTile(
            iconColor: Colors.blueGrey,
            textColor: Colors.blueGrey,
            leading: Icon(Icons.mail),
            title: Text(
              "Email",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "jama.guled@gmail.com",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
          ListTile(
            iconColor: Colors.blueGrey,
            textColor: Colors.blueGrey,
            leading: Icon(Icons.location_city),
            title: Text(
              "Address",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "KM4, Hodan, Mogadishu, Somalia",
              style: TextStyle(color: Colors.black),
            ),
            dense: true,
          ),
        ],
      ),
    ),
  );
}