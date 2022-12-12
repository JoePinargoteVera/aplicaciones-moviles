import 'package:flutter/material.dart';
import '../models/backend.dart';
import '../models/email.dart';
import '../widgets/EmailWidget.dart';

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListScreenPageState();
  }
}

class _ListScreenPageState extends State<ListScreen> {
  final List<Email> emails = Backend().getEmails();

  Widget _buildEmailList() {
    return Container(
      child: emails.length > 0
          ? ListView.builder(
              itemCount: emails.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      emails.removeAt(index);
                    });
                  },
                  secondaryBackground: Container(
                    child: Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.brown,
                  ),
                  background: Container(),
                  child: EmailWidget(email: emails[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('No Items')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mail List'),
        backgroundColor: Colors.red,
      ),
      body: _buildEmailList(),
    );
  }
}
