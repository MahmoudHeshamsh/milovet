import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/app_theme.dart';
import 'package:milovet/shared/color_manager.dart';

class RecievedMessage extends StatelessWidget {
  final String text;

  const RecievedMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            '3:12',
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
              text,
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
