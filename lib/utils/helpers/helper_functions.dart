import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

/// A class that contains various helper functions.
class KHelperFunctions {
  static Color? getColor(String value) {
    /// Define product specific colors here and it will
    ///  match the attribute colors and show specific colors.

    if (value == 'Green') return Colors.green;
    if (value == 'Red') return Colors.red;
    if (value == 'Blue') return Colors.blue;
    if (value == 'Yellow') return Colors.yellow;
    if (value == 'Black') return Colors.black;
    if (value == 'White') return Colors.white;
    if (value == 'Grey') return Colors.grey;
    if (value == 'Orange') return Colors.orange;
    if (value == 'Pink') return Colors.pink;
    if (value == 'Purple') return Colors.purple;
    if (value == 'Brown') return Colors.brown;
    if (value == 'Cyan') return Colors.cyan;
    if (value == 'Teal') return Colors.teal;
    if (value == 'Indigo') return Colors.indigo;

    return null;
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  static void showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              )
            ],
          );
        });
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() => MediaQuery.of(Get.context!).size;

  static double screenHeight() => screenSize().height;

  static double screenWidth() => screenSize().width;

  static String getFormattedDate(DateTime dateTime,
      {String format = 'dd MM yyyy'}) {
    return DateFormat(format).format(dateTime);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rawSize) {
    final wrappedWidgets = <Widget>[];
    for (var i = 0; i < widgets.length; i += rawSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rawSize > widgets.length ? widgets.length : i + rawSize,
      );
      wrappedWidgets.add(Row(children: rowChildren));
    }

    return wrappedWidgets;
  }

// Launch WhatsApp chat
  static Future<void> launchWhatsApp(
      {required String phone, String message = ''}) async {
    String androidUrl =
        "whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}";
    String iosUrl = "https://wa.me/$phone?text=${Uri.encodeComponent(message)}";

    String webUrl =
        'https://api.whatsapp.com/send/?phone=$phone&text=${Uri.encodeComponent(message)}';

    try {
      if (Platform.isIOS) {
        if (await canLaunchUrl(Uri.parse(iosUrl))) {
          await launchUrl(Uri.parse(iosUrl));
        } else {
          throw 'Could not launch iOS URL';
        }
      } else {
        if (await canLaunchUrl(Uri.parse(androidUrl))) {
          await launchUrl(Uri.parse(androidUrl));
        } else {
          throw 'Could not launch Android URL';
        }
      }
    } catch (e) {
      await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
    }
  }

  // Launch phone dialer with a specific phone number
  static Future<void> launchPhone({required String phone}) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch phone dialer for $phone';
    }
  }

  // Launch a URL
  static Future<void> launchURL({required String url}) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch URL: $url';
    }
  }

  static double stringToDouble(String numberString) {
    try {
      // Parse the string to a double
      double number = double.parse(numberString);
      return number;
    } catch (e) {
      return 0.0;
    }
  }
}
