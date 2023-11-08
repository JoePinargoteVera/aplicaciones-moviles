import 'package:flutter/material.dart';
import '../models/email.dart';
import '../screens/DetailScreen.dart';


class EmailWidget extends StatelessWidget {
  final Email email;
  final Function markAsRead;

  const EmailWidget({super.key, required this.email, required this.markAsRead});

  @override
  Widget build(BuildContext context) {
    // print('${email.read}');
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            trailing: Text(email.dateTime.toString()),
            title: Text(email.from),
            // title: Text(email.read.toString()),
            subtitle: Text(email.subject),

            leading: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: email.read ? Colors.transparent : Colors.blue,
              ),
            ),
            onTap: () {
               if (!email.read) {
                markAsRead(); 
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(emails: email)));
            },
          ),
        ],
      ),
    );
  }
}
