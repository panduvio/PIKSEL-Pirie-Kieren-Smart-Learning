import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/screen/kubus_balok_evaluasi_screen.dart';
import 'package:geometry_app/presentation/widget/menu_popup.dart';
import 'package:heroicons/heroicons.dart';
import 'package:popover/popover.dart';

class HomePage extends StatefulWidget {
  final int userLevel;
  final int kubusLevel;
  final int balokLevel;
  const HomePage({
    required this.userLevel,
    super.key,
    required this.kubusLevel,
    required this.balokLevel,
  });

  @override
  State<HomePage> createState() => _HomePageState(userLevel);
}

class _HomePageState extends State<HomePage> {
  int userLevel;

  _HomePageState(this.userLevel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      showPopover(
                        context: context,
                        direction: PopoverDirection.left,
                        height: 200,
                        backgroundColor: AppColor.transparent,
                        bodyBuilder: (context) => MenuPopup(
                          materialLevel: widget.kubusLevel,
                          route: 'kubus',
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      height: 350,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.faience,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              HeroIcon(
                                HeroIcons.star,
                                size: 50,
                                style: HeroIconStyle.solid,
                                color: Colors.yellow,
                              ),
                              // Spacer(),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child: Image.asset(
                                    'assets/kubus.png',
                                    scale: 10,
                                    // height: 10,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '• Eksplorasi Konsep Volume Kubus',
                            textAlign: TextAlign.justify,
                            style: AppTextStyle.materialTextStyle,
                          ),
                          Text(
                            '• Kolaborasi Volume Kubus',
                            textAlign: TextAlign.justify,
                            style: AppTextStyle.materialTextStyle,
                          ),
                          Text(
                            '• Evaluasi Volume Kubus',
                            textAlign: TextAlign.justify,
                            style: AppTextStyle.materialTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Spacer(),
              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      if (userLevel >= 2) {
                        showPopover(
                          context: context,
                          direction: PopoverDirection.right,
                          height: 200,
                          backgroundColor: AppColor.transparent,
                          bodyBuilder: (context) => MenuPopup(
                            materialLevel: widget.balokLevel,
                            route: 'balok',
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      height: 350,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.faience,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              HeroIcon(
                                userLevel < 2
                                    ? HeroIcons.lockClosed
                                    : HeroIcons.star,
                                size: 50,
                                style: HeroIconStyle.solid,
                                color: userLevel < 2
                                    ? AppColor.white
                                    : Colors.yellow,
                              ),
                              // Spacer(),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child: Image.asset(
                                    'assets/balok.png',
                                    scale: 13,
                                    // height: 10,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '• Eksplorasi Konsep Volume Balok',
                            textAlign: TextAlign.justify,
                            style: AppTextStyle.materialTextStyle,
                          ),
                          Text(
                            '• Kolaborasi Volume Balok',
                            textAlign: TextAlign.justify,
                            style: AppTextStyle.materialTextStyle,
                          ),
                          Text(
                            '• Evaluasi Volume Balok',
                            textAlign: TextAlign.justify,
                            style: AppTextStyle.materialTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              if (userLevel == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KubusBalokEvaluasiScreen(),
                  ),
                );
              }
            },
            child: Container(
              padding: EdgeInsets.all(12),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.faience,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      HeroIcon(
                        userLevel < 3 ? HeroIcons.lockClosed : HeroIcons.star,
                        size: 50,
                        style: HeroIconStyle.solid,
                        color: userLevel < 3 ? AppColor.white : Colors.yellow,
                      ),
                      Spacer(),
                      Container(
                        height: 100,
                        width: 100,
                        // color: AppColor.balineseSunset,
                        child: Image.asset(
                          'assets/kubus_balok.png',
                          scale: 10,
                          // height: 10,
                          fit: BoxFit.none,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    'Evaluasi Akhir Kubus dan Balok',
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.materialTextStyle,
                  ),
                ],
              ),
            ),
          ),
          // Spacer(),
        ],
      ),
    );
  }
}
