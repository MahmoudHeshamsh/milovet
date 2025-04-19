// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class NotificationsTab extends StatelessWidget {
//   const NotificationsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         SizedBox(
//           height: 150.h,
//         ),
//         Image.asset(
//           'assets/images/notifications.png',
//           height: 163.h,
//           width: 163.w,
//         ),
//         SizedBox(
//           height: 20.h,
//         ),
//         Center(
//             child: Text(
//           'No New Notifications Right Now',
//           style: Theme.of(context).textTheme.bodyLarge,
//         ))
//       ],
//     );
//   }
// }

///////////////////////////////////////
///

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsTab extends StatelessWidget {
  final List<Map<String, String>> todayNotifications = [
    {
      'icon': 'assets/images/Vector.png',
      'message': 'Your checkup is successful'
    },
    {'icon': 'assets/images/fi_check.png', 'message': 'Request accepted'},
  ];

  final List<Map<String, String>> septemberNotifications = [
    {
      'icon': 'assets/images/Frame 2095.png',
      'message': 'Vaccinate your pet timely'
    },
  ];

  NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasNotifications =
        todayNotifications.isNotEmpty || septemberNotifications.isNotEmpty;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(color: Color(0xFF6D1FCB)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bachgroundimage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 80.h, 16.w, 16.h),
          child: hasNotifications
              ? ListView(
                  children: [
                    if (todayNotifications.isNotEmpty) ...[
                      Text(
                        "Today",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      ...todayNotifications
                          .map((notif) => NotificationCard(
                              imagePath: notif['icon']!,
                              message: notif['message']!))
                          .toList(),
                      SizedBox(height: 20.h),
                    ],
                    if (septemberNotifications.isNotEmpty) ...[
                      Text(
                        "25 September",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      ...septemberNotifications
                          .map((notif) => NotificationCard(
                              imagePath: notif['icon']!,
                              message: notif['message']!))
                          .toList(),
                    ]
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/notifications.png',
                        height: 163.h,
                        width: 163.w,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'No New Notifications Right Now',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String imagePath;
  final String message;

  const NotificationCard({
    required this.imagePath,
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFE2D1EE),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Image.asset(
                imagePath,
                width: 24.w,
                height: 24.h,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
