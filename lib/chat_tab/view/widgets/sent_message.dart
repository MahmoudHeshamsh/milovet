import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milovet/chat_tab/data/models/message_model.dart';
import 'package:milovet/models/user_model.dart';
import 'package:milovet/shared/color_manager.dart';

class SentMessage extends StatelessWidget {
  final MessageModel message;
  final UserModel currentUser;

  const SentMessage({required this.message, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //Expanded
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(12),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7, // تمنع القص
            ),
            decoration: const BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            //child: const Text('Hello, How can I help you?'),
            child: Text(
              message.content,
              style: const TextStyle(
                color: Colors.white,
              ),
              softWrap: true, // يتلف صح
              overflow: TextOverflow.visible, // ميقصش الكلام
            ),
          ),
        ),
        const SizedBox(width: 20),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            DateFormat.jm().format(message.dateTime),
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
