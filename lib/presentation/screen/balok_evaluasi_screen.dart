import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';

class BalokEvaluasiScreen extends StatelessWidget {
  const BalokEvaluasiScreen({super.key});

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
              Container(height: 200, color: AppColor.balineseSunset),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.white,
                ),
                child: Text(
                  'EVALUASI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColor.balineseSunset,
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
