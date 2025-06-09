import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:milovet/chat_tab/data/models/message_model.dart';
import 'package:milovet/models/user_model.dart';
import 'package:milovet/shared/app_theme.dart';
import 'package:milovet/shared/color_manager.dart';

class RecievedMessage extends StatelessWidget {
  final MessageModel message;
  final UserModel currentUser;

  const RecievedMessage({required this.message, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            DateFormat.jm().format(message.dateTime),
            style: TextStyle(fontSize: 10),
          ),
        ),
        const SizedBox(width: 20),
        //Expanded
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(12),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7, // تمنع القص
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            //child: const Text('Hello, How can I help you?'),
            child: Text(
              //text,
              message.content,
              style: const TextStyle(color: Colors.black),
              softWrap: true, // يتلف صح
              overflow: TextOverflow.visible, // ميقصش الكلام
            ),
          ),
        ),
      ],
    );
  }
}
