import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/home_screen.dart';
import 'package:geometry_app/presentation/screen/login_screen.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

class CustomBackButton extends StatelessWidget {
  final int backIndex;
  const CustomBackButton({required this.backIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.read<PageProvider>().isPretest) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          context.read<PageProvider>().setPageIndex(backIndex);
        }
      },
      child: HeroIcon(HeroIcons.chevronLeft, color: AppColor.white, size: 35),
    );
  }
}
