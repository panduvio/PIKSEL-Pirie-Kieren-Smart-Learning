import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/home_screen.dart';
import 'package:provider/provider.dart';

class BalokScreen extends StatefulWidget {
  final String stage;

  const BalokScreen({required this.stage, super.key});

  @override
  State<BalokScreen> createState() => _BalokScreenState(stage);
}

class _BalokScreenState extends State<BalokScreen> {
  final String stage;
  bool isTap = false;

  _BalokScreenState(this.stage);

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
                'VOLUME BANGUN RUANG\nBALOK',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColor.balineseSunset,
                ),
              ),
              Spacer(),
              Container(
                height: 200,
                width: double.maxFinite,
                // color: AppColor.balineseSunset,
                child: Image.asset(
                  'assets/balok.png',
                  scale: 4,
                  fit: BoxFit.none,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTapDown: (value) {
                  Provider.of<PageProvider>(
                    context,
                    listen: false,
                  ).setPageIndex(
                    stage == 'EKSPLORASI'
                        ? 11
                        : (stage == 'KOLABORASI' ? 16 : 19),
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
                    color: AppColor.white,
                  ),
                  child: Text(
                    stage,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColor.balineseSunset,
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
