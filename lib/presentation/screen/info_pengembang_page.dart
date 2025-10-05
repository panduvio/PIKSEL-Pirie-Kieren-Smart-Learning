import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/domain/entities/pengembang_entity.dart';

class InfoPengembangPage extends StatefulWidget {
  const InfoPengembangPage({super.key});

  @override
  State<InfoPengembangPage> createState() => _InfoPengembangPageState();
}

class _InfoPengembangPageState extends State<InfoPengembangPage> {
  final devList = pengembangList;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'INFORMASI PENGEMBANG',
          style: TextStyle(
            fontFamily: 'Anton',
            fontSize: 40,
            fontWeight: FontWeight.w100,
            color: AppColor.faience,
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(devList.length, (index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              // color: Colors.red,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColor.transparent,
                    child: Image.asset(
                      'assets/${devList[index].image}.png',
                      scale: 14,
                      fit: BoxFit.none,
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        devList[index].name,
                        style: AppTextStyle.blackMaterialTextStyle,
                      ),
                      Text(
                        '${devList[index].idType} ${devList[index].id}',
                        style: AppTextStyle.greySmallMaterialTextStyle,
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
