import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/chat_tab/view/widgets/chat_tab.dart';
import 'package:milovet/home_tab/view/widgets/home_tab_owner.dart';
import 'package:milovet/home_tab/view/widgets/home_tab_veterinarian.dart';
import 'package:milovet/notificarions_tab/view/widgets/notifications_tab.dart';
import 'package:milovet/profile_tab/view/widgets/profile_tab_owner.dart';
import 'package:milovet/profile_tab/view/widgets/profile_tab_veterinarian.dart';
import 'package:milovet/shared/color_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  void _selectedScreen(int index) {
    _selectedScreenIndex = index;
    setState(() {});
  }

  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as bool?;
    bool isPetOwner = args ?? true;
    List<Widget> screens = isPetOwner
        ? [
            HomeTabOwner(),
            const ChatTab(),
            const NotificationsTab(),
            const ProfileTabOwner(),
          ]
        : [
            HomeTabVeterinarian(),
            const ChatTab(),
            const NotificationsTab(),
            const ProfileTabVeterinarian(),
          ];
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 88.h,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.white,
                      image: DecorationImage(
                          image: isPetOwner? const AssetImage('assets/images/user_image.png') : const AssetImage('assets/images/doctor_image.png'),)),
                  margin: EdgeInsets.only(bottom: 2.0.h, left: 35.0.w),
                  width: 48.5.w,
                  height: 48.5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17.0.w),
                  child: Column(
                    children: [
                      Text(
                        isPetOwner ? 'Hi Mostafa' : 'Hi Dr: Mostafa',
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        'Have a nice day',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: ColorManager.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(
                Icons.search,
                size: 35.sp,
                color: ColorManager.white,
              ),
            ),
          ],
        ),
      ),
      body: screens[_selectedScreenIndex],
      bottomNavigationBar: isPetOwner
          ? ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0.sp), // Adjust the radius
                topRight: Radius.circular(20.0.sp),
              ),
              child: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: EdgeInsets.zero,
                child: BottomNavigationBar(
                  elevation: 0,
                  onTap: _selectedScreen,
                  currentIndex: _selectedScreenIndex,
                  selectedFontSize: 10.5.sp,
                  unselectedFontSize: 10.5.sp,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.forum), label: 'Chat'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.notifications_on_rounded),
                        label: 'Notifications'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'Profile')
                  ],
                ),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0.sp),
                topRight: Radius.circular(20.0.sp),
              ),
              child: BottomNavigationBar(
                onTap: _selectedScreen,
                selectedFontSize: 10.5.sp,
                unselectedFontSize: 10.5.sp,
                currentIndex: _selectedScreenIndex,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.forum), label: 'Chat'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_on_rounded),
                      label: 'Notifications'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile')
                ],
              ),
            ),
      floatingActionButton:isPetOwner
          ? FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.transparent,
              onPressed: () {},
              child: SizedBox(
                  height: 47.h,
                  width: 47.w,
                  child: Image.asset(
                    'assets/images/ai_model.png',
                    fit: BoxFit.cover,
                  )))
          : null,
      floatingActionButtonLocation:
          isPetOwner ? FloatingActionButtonLocation.centerDocked : null,
    );
  }
}
