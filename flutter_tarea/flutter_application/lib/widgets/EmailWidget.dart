import 'package:flutter/material.dart';
import '../models/email.dart';
import '../screens/DetailScreen.dart';

class EmailWidget extends StatelessWidget {
  final Email email;

  EmailWidget({required this.email});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            trailing: Text(email.dateTime.toString()),
            title: Text(email.from),
            subtitle: Text(email.subject),
            onTap: () {
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
