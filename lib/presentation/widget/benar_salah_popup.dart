import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';

class BenarSalahPopup extends StatefulWidget {
  final bool result;
  const BenarSalahPopup({super.key, required this.result});

  @override
  State<BenarSalahPopup> createState() => _BenarSalahPopupState(result);
}

class _BenarSalahPopupState extends State<BenarSalahPopup> {
  final _result;

  _BenarSalahPopupState(this._result);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 370,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.wintersDay,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            height: 200,
            // color: Colors.yellow,
            child: Image.asset(
              _result ? 'assets/benar.png' : 'assets/salah.png',
            ),
          ),
          SizedBox(height: 20),
          Text(
            _result ? 'BENAR' : 'SALAH',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: AppColor.faience,
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.faience,
            ),
            child: Text(
              'PEMBAHASAN',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
