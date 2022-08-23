import 'package:flutter/material.dart';

import '../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  List<Map<String, String>> notifications = [
    {
      'title': 'Joy Arnold left 6 comments on Your Post',
      'subTitle': 'Yesterday at 11:42 PM',
      'subject': '',
    },
    {
      'title':
          'Dennis Nedry commented on Isla Nublar SOC2 compliance report    ',
      'subTitle': 'Yesterday at 5:42 PM',
      'subject':
          '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”',
    },
    {
      'title': 'John Hammond created Isla Nublar SOC2 compliance report  ',
      'subTitle': 'Wednesday at 11:15 AM',
      'subject': '',
    },
    {
      'title': 'Joy Arnold left 6 comments on Your Post',
      'subTitle': 'Yesterday at 11:42 PM',
      'subject': '',
    },
    {
      'title':
          'Dennis Nedry commented on Isla Nublar SOC2 compliance report    ',
      'subTitle': 'Yesterday at 5:42 PM',
      'subject':
          '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”',
    },
    {
      'title': 'John Hammond created Isla Nublar SOC2 compliance report  ',
      'subTitle': 'Wednesday at 11:15 AM',
      'subject': '',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Notification",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  NotifiactionItem(
                    title: notifications[index]['title'].toString(),
                    subTitle: notifications[index]['subTitle'].toString(),
                    subject: notifications[index]['subject'].toString(),
                  ),
                  const Divider(thickness: 1),
                ],
              );
            }),
      ),
    );
  }
}
