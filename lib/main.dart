import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/shared/app_theme.dart';
import 'package:milovet/shared/routes/route_generator.dart';
import 'package:milovet/shared/routes/routes.dart';

void main() {
  runApp(const MiloVet());
}

class MiloVet extends StatelessWidget {
  const MiloVet({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.onboardingOne,
      ),
    );
  }
}
