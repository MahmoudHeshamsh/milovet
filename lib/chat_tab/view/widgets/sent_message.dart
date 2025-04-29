import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/app_theme.dart';
import 'package:milovet/shared/color_manager.dart';

class SentMessage extends StatelessWidget {
  final String text;

  const SentMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        text, style: const TextStyle(color: Colors.white),
        softWrap: true, // يتلف صح
        overflow: TextOverflow.visible, // ميقصش الكلام
      ),
    );
  }
}
