import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 150.h,),
        Image.asset('assets/images/notifications.png',height: 163.h,width: 163.w,),
        SizedBox(height: 20.h,),
        Center(child: Text('No New Notifications Right Now',style: Theme.of(context).textTheme.bodyLarge,))
      ],
    );
  }
}
