import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/chat/messages.dart';
import '../widgets/chat/new_message.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterChat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Logout')
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (value) {
              if (value == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
