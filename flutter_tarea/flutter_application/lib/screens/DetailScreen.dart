import 'package:flutter/material.dart';
import '../models/email.dart';


class DetailScreen extends StatelessWidget {
  final Email emails;
  const DetailScreen({Key? key, required this.emails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Email'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 3, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "from: ${emails.from}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Row(children: <Widget>[
            Expanded(
                child: Divider(
              color: Colors.green,
            )),
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 3, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                emails.subject,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 3, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                emails.dateTime.toString(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                ),
              ),
            ),
          ),
          const Row(children: <Widget>[
            Expanded(
                child: Divider(
              color: Colors.green,
            )),
          ]),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                emails.body,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 13,
                  letterSpacing: 0.15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
