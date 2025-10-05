import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/home_screen.dart';
import 'package:provider/provider.dart';

class KubusBalokEvaluasiScreen extends StatefulWidget {
  const KubusBalokEvaluasiScreen({super.key});

  @override
  State<KubusBalokEvaluasiScreen> createState() =>
      _KubusBalokEvaluasiScreenState();
}

class _KubusBalokEvaluasiScreenState extends State<KubusBalokEvaluasiScreen> {
  bool isTap = false;
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
                'VOLUME BANGUN RUANG\nKUBUS & BALOK',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColor.balineseSunset,
                ),
              ),
              Spacer(),
              Container(
                height: 300,
                child: Image.asset(
                  'assets/kubus_balok.png',
                  fit: BoxFit.none,
                  scale: 4,
                ),
              ),
              Spacer(),
              Text(
                'Sertakan cara mengerjakan evaluasi di bagian akhir!',
                textAlign: TextAlign.center,
                style: AppTextStyle.blueMaterialTextStyle,
              ),
              SizedBox(height: 6),
              GestureDetector(
                onTapDown: (value) {
                  Provider.of<PageProvider>(
                    context,
                    listen: false,
                  ).setPageIndex(21);
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
                    'EVALUASI',
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
