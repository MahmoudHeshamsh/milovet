import 'package:flutter/material.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Notifications',style: TextStyle(color: Colors.amber),),),
    );
  }
}