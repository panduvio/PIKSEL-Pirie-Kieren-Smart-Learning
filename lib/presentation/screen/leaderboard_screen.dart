import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/presentation/provider/bloc/user_bloc.dart';
import 'package:geometry_app/presentation/widget/custom_back_button.dart';
import 'package:heroicons/heroicons.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<UserEntity> userList = [];

  @override
  void initState() {
    // TODO: implement initState

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
            userList.sort(
              (a, b) => b.leaderboardScore.compareTo(a.leaderboardScore),
            );
          });
        }
      },
      builder: (context, UserState) {
        return Scaffold(
          appBar: AppBar(
            title: Text('LEADERBOARD', style: AppTextStyle.appBarTextStyle),
            backgroundColor: AppColor.faience,
            leading: CustomBackButton(backIndex: 0),
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
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            height: double.maxFinite,
            width: double.maxFinite,
            color: AppColor.wintersDay,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 200,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.faience,
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Weekly Rank',
                              style: AppTextStyle.materialTextStyle,
                            ),
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: AppColor.transparent,
                              child: Image.asset(
                                'assets/cakra.png',
                                scale: 14,
                                fit: BoxFit.none,
                              ),
                            ),
                            Text(
                              userList.isNotEmpty
                                  ? userList.first.username
                                  : '',
                              style: AppTextStyle.materialTextStyle,
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 150,
                          child: Image.asset(
                            'assets/rank.png',
                            fit: BoxFit.none,
                            scale: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: userList.isEmpty
                        ? Text(
                            'No user was detected',
                            style: AppTextStyle.blueMaterialTextStyle,
                          )
                        : Column(
                            children: List.generate(userList.length, (index) {
                              return ListTile(
                                title: Text(
                                  userList[index].username,
                                  style: AppTextStyle.blackMaterialTextStyle,
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: index == 0
                                      ? AppColor.gold
                                      : (index == 1
                                            ? AppColor.silver
                                            : (index == 2
                                                  ? AppColor.bronze
                                                  : AppColor.faience)),
                                  child: Text(
                                    '${index + 1}',
                                    style: AppTextStyle.materialTextStyle,
                                  ),
                                ),
                                trailing: Text(
                                  '${userList[index].leaderboardScore}',
                                  style: AppTextStyle.blackMaterialTextStyle,
                                ),
                              );
                            }),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
