import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/presentation/provider/bloc/user_bloc.dart';
import 'package:geometry_app/presentation/screen/login_screen.dart';
import 'package:heroicons/heroicons.dart';

class AdminCheckDataScreen extends StatefulWidget {
  const AdminCheckDataScreen({super.key});

  @override
  State<AdminCheckDataScreen> createState() => _AdminCheckDataScreenState();
}

class _AdminCheckDataScreenState extends State<AdminCheckDataScreen> {
  List<UserEntity> userList = [];

  @override
  void initState() {
    context.read<UserBloc>().add(GetAllUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is GetAllSuccessState) {
          setState(() {
            userList = state.users;
          });
        }
      },
      builder: (context, UserState) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Admin Database', style: AppTextStyle.appBarTextStyle),
            backgroundColor: AppColor.faience,
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<UserBloc>().add(GetAllUser());
                  },
                  child: HeroIcon(
                    HeroIcons.arrowPath,
                    color: AppColor.white,
                    size: 30,
                    style: HeroIconStyle.solid,
                  ),
                ),
              ),
            ],
            leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: HeroIcon(HeroIcons.power, color: AppColor.white, size: 30),
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            height: double.maxFinite,
            width: double.maxFinite,
            color: AppColor.wintersDay,
            child: userList.isEmpty
                ? Text(
                    'No user was detected',
                    style: AppTextStyle.blueMaterialTextStyle,
                  )
                : ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.white,
                        ),
                        child: ExpansionTile(
                          shape: RoundedRectangleBorder(side: BorderSide.none),
                          expandedAlignment: Alignment.centerLeft,
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          title: Text(
                            userList[index].username,
                            style: AppTextStyle.blueMaterialTextStyle,
                          ),
                          children: [
                            Text(
                              'Pre Test 1 : ${userList[index].preTest1}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Pre Test 2 : ${userList[index].preTest2}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Pre Test 3 : ${userList[index].preTest3}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Pre Test 4 : ${userList[index].preTest4}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Pre Test 5 : ${userList[index].preTest5}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Pre Test 6 : ${userList[index].preTest6}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Evaluasi Kubus 1 : ${userList[index].evaluasiKubus1}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Evaluasi Kubus 2 : ${userList[index].evaluasiKubus2}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Evaluasi Kubus 3 : ${userList[index].evaluasiKubus3}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Evaluasi Balok 1 : ${userList[index].evaluasiBalok1}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Evaluasi Balok 2 : ${userList[index].evaluasiBalok2}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Evaluasi Balok 3 : ${userList[index].evaluasiBalok3}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Post Test 1 : ${userList[index].postTest1}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Post Test 2 : ${userList[index].postTest2}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Post Test 3 : ${userList[index].postTest3}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Post Test 4 : ${userList[index].postTest4}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Post Test 5 : ${userList[index].postTest5}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Post Test 6 : ${userList[index].postTest6}',
                              style: AppTextStyle.blueMaterialTextStyle,
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
