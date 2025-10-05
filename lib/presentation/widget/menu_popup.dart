import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/screen/balok_screen.dart';
import 'package:geometry_app/presentation/screen/kubus_screen.dart';
import 'package:heroicons/heroicons.dart';

class MenuPopup extends StatefulWidget {
  final int materialLevel;
  final String route;

  const MenuPopup({
    required this.materialLevel,
    required this.route,
    super.key,
  });

  @override
  State<MenuPopup> createState() => _MenuPopupState();
}

class _MenuPopupState extends State<MenuPopup> {
  int tapIndex = 10;
  List<String> stageList = ['EKSPLORASI', 'KOLABORASI', 'EVALUASI'];

  Widget nextScreen(BuildContext context, String stage) {
    return widget.route == 'kubus'
        ? KubusScreen(stage: stage)
        : BalokScreen(stage: stage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(stageList.length, (index) {
        return GestureDetector(
          onTapDown: (details) {
            setState(() {
              tapIndex = index;
            });
          },
          onTapUp: (details) {
            setState(() {
              tapIndex = 10;
            });
            if (widget.materialLevel > index) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => nextScreen(context, stageList[index]),
                ),
              );
            }
          },
          onTapCancel: () {
            setState(() {
              tapIndex = 10;
            });
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.all(5),
            height: 50,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: tapIndex == index
                  ? AppColor.balineseSunset
                  : AppColor.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                index < widget.materialLevel
                    ? HeroIcon(
                        HeroIcons.star,
                        size: 30,
                        style: HeroIconStyle.solid,
                        color: tapIndex == index
                            ? AppColor.white
                            : AppColor.yellow,
                      )
                    : HeroIcon(
                        HeroIcons.lockClosed,
                        size: 30,
                        style: HeroIconStyle.solid,
                        color: tapIndex == index
                            ? AppColor.white
                            : AppColor.balineseSunset,
                      ),
                Spacer(),
                Text(
                  stageList[index],
                  style: tapIndex == index
                      ? AppTextStyle.whiteTitleTextStyle
                      : AppTextStyle.titleTextStyle,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
