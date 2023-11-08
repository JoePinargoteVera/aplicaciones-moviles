import 'package:flutter/material.dart';
import '../models/backend.dart';
import '../models/email.dart';
import '../widgets/EmailWidget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ListScreenPageState();
  }
}

class _ListScreenPageState extends State<ListScreen> {
  final List<Email> emails = Backend().getEmails();

  Widget _buildEmailList() {
    return Container(
      child: emails.isNotEmpty
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
                    color: Colors.brown,
                    child: const Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  background: Container(),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  child: EmailWidget(email: emails[index], markAsRead: () {
                    // Backend().markEmailAsRead(emails[index].id);
                    setState(() {
                      emails[index].read = true;
                    });
                  }),
                );
              },
            )
          : const Center(child: Text('No Items')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mail List'),
        backgroundColor: Colors.blue,
      ),
      body: _buildEmailList(),
    );
  }
}
