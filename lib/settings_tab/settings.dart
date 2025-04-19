import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<Settings> {
  String selectedTheme = 'Light';
  String selectedLanguage = 'English';

  final List<String> themes = ['Light', 'Dark'];
  final List<String> languages = ['English', 'Arabic'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: const BackButton(color: Color(0xFF6D1FCBF)),
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
        padding: EdgeInsets.fromLTRB(16.w, 100.h, 16.w, 16.h),
        child: Column(
          children: [
            CustomDropdownTile(
              iconImage: 'assets/images/Vector.png',
              title: "Themes",
              value: selectedTheme,
              items: themes,
              onChanged: (val) {
                setState(() {
                  selectedTheme = val!;
                });
              },
            ),
            SizedBox(height: 20.h),
            CustomDropdownTile(
              iconImage: 'assets/images/Layer 2.png',
              title: "Language",
              value: selectedLanguage,
              items: languages,
              onChanged: (val) {
                setState(() {
                  selectedLanguage = val!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownTile extends StatelessWidget {
  final String? iconImage;
  final String title;
  final String value;
  final List<String> items;
  final void Function(String?) onChanged;

  const CustomDropdownTile({
    super.key,
    required this.iconImage,
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: const BorderSide(color: Color(0xFFB8BBC2), width: 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.only(left: 12.w, bottom: 8.h),
          title: Row(
            children: [
              // Container(
              //   padding: EdgeInsets.all(6.w),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: const Color(0xFFB8BBC2)),
              //     borderRadius: BorderRadius.circular(10.r),
              //   ),
              //child:
              Image.asset(
                iconImage!,
                height: 20.h,
                width: 20.w,
                fit: BoxFit.contain,
                // ),
              ),
              SizedBox(width: 10.w),
              Text(title, style: TextStyle(fontSize: 16.sp)),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(value, style: const TextStyle(color: Colors.grey)),
            ),
            ...items.map((item) {
              return ListTile(
                leading: item == 'Dark'
                    ? Image.asset('assets/images/Vector (Stroke).png',
                        width: 24.w, height: 24.h)
                    : item == 'Light'
                        ? Image.asset('assets/images/light.png',
                            width: 24.w, height: 24.h)
                        : null,
                title: Text(item),
                onTap: () => onChanged(item),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
