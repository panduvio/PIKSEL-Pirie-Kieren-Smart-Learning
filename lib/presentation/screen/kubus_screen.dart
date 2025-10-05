import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/home_screen.dart';
import 'package:provider/provider.dart';

class KubusScreen extends StatefulWidget {
  final String stage;
  const KubusScreen({required this.stage, super.key});

  @override
  State<KubusScreen> createState() => _KubusScreenState(stage);
}

class _KubusScreenState extends State<KubusScreen> {
  final String stage;
  bool isTap = false;

  _KubusScreenState(this.stage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(40),
          color: AppColor.wintersDay,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                'VOLUME BANGUN RUANG\nKUBUS',
                textAlign: TextAlign.center,
                style: AppTextStyle.largeTitleTextStyle,
              ),
              Spacer(),
              Container(
                height: 200,
                // color: AppColor.balineseSunset,
                child: Image.asset(
                  'assets/kubus.png',
                  scale: 4,
                  fit: BoxFit.none,
                ),
              ),
              Spacer(),
              InkWell(
                onTapDown: (value) {
                  Provider.of<PageProvider>(
                    context,
                    listen: false,
                  ).setPageIndex(
                    stage == 'EKSPLORASI'
                        ? 2
                        : (stage == 'KOLABORASI' ? 7 : 10),
                  );
                  setState(() {
                    isTap = true;
                  });
                },
                onTapUp: (details) {
                  setState(() {
                    isTap = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: isTap ? AppColor.balineseSunset : AppColor.white,
                  ),
                  child: Text(
                    stage.toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: isTap ? AppColor.white : AppColor.balineseSunset,
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
