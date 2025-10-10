import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/presentation/provider/bloc/user_bloc.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/login_screen.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool modeState = true;
  String username = '';
  String id = '';
  List<String> settingTitle = [
    // 'Mode',
    // 'Change Password',
    'Log Out',
  ];
  List<String> informationTitle = [
    'About Application',
    // 'Terms & Conditions',
    // 'Privacy & Policy',
    'Developer Information',
  ];
  List<Widget> settingIcon = [
    // Image.asset('assets/mode.png'),
    // Image.asset('assets/password.png'),
    HeroIcon(
      HeroIcons.power,
      size: 40,
      color: AppColor.black,
      style: HeroIconStyle.solid,
    ),
  ];
  List<Widget> informationIcon = [
    HeroIcon(
      HeroIcons.devicePhoneMobile,
      size: 40,
      color: AppColor.black,
      style: HeroIconStyle.solid,
    ),
    // HeroIcon(
    //   HeroIcons.documentText,
    //   size: 40,
    //   color: AppColor.black,
    //   style: HeroIconStyle.solid,
    // ),
    // HeroIcon(
    //   HeroIcons.shieldCheck,
    //   size: 40,
    //   color: AppColor.black,
    //   style: HeroIconStyle.solid,
    // ),
    HeroIcon(
      HeroIcons.userGroup,
      size: 40,
      color: AppColor.black,
      style: HeroIconStyle.solid,
    ),
  ];
  late SharedPreferences userSp;
  // final Uri _url = Uri.parse(
  //   'https://drive.google.com/drive/folders/1ei6Ultc3FiudHnp6pPOaaBLFHLQnsqNP',
  // );

  @override
  void initState() {
    initial();
    // TODO: implement initState
    super.initState();
  }

  void initial() async {
    userSp = await SharedPreferences.getInstance();
    setState(() {
      username = userSp.getString('username')!;
    });
  }

  // Future<void> _openWebsite() async {
  //   final Uri url = Uri.parse('https://guthib.com/');
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //     // externalApplication opens in browser, not in the app
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listenWhen: (previous, current) => current is PostSuccessState,
      listener: (context, state) {
        if (state is PostSuccessState) {
          id = state.id;
          Provider.of<PageProvider>(context, listen: false).setUserId(id);
          print("New Firestore ID: $id");
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return Column(
            children: [
              Container(
                height: 210,
                child: Column(
                  children: [
                    Spacer(),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColor.faience,
                      child: HeroIcon(
                        HeroIcons.user,
                        size: 50,
                        color: AppColor.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      username,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.blackMaterialTextStyle,
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                height: 70,
                width: double.maxFinite,
                color: AppColor.white,
                child: Text(
                  'Setting',
                  style: TextStyle(fontSize: 24, color: AppColor.argent),
                ),
              ),
              Container(
                height: 70,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (index == 0) {
                          context.read<PageProvider>().setPageIndex(0);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }
                      },
                      leading: Container(
                        height: 50,
                        width: 50,
                        child: settingIcon[index],
                      ),
                      title: Text(
                        settingTitle[index],
                        style: AppTextStyle.blackMaterialTextStyle,
                      ),
                      subtitle: index != 0
                          ? Text(
                              'Dark & Light',
                              style: AppTextStyle.greySmallMaterialTextStyle,
                            )
                          : null,
                      trailing: index != 0
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              decoration: BoxDecoration(
                                color: modeState
                                    ? AppColor.white
                                    : AppColor.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: AnimatedToggleSwitch.dual(
                                current: modeState,
                                first: true,
                                second: false,
                                spacing: 2,
                                height: 40,
                                animationDuration: Duration(milliseconds: 900),
                                style: ToggleStyle(
                                  borderColor: AppColor.transparent,
                                  indicatorColor: AppColor.transparent,
                                  backgroundColor: AppColor.transparent,
                                ),
                                iconBuilder: (value) => value
                                    ? HeroIcon(
                                        HeroIcons.sun,
                                        color: AppColor.black,
                                        style: HeroIconStyle.solid,
                                      )
                                    : HeroIcon(
                                        HeroIcons.moon,
                                        color: AppColor.white,
                                        style: HeroIconStyle.solid,
                                      ),
                                onChanged: (value) {
                                  setState(() {
                                    modeState = !modeState;
                                  });
                                  // _openWebsite();
                                  // _launchUrl();
                                  context.read<UserBloc>().add(
                                    PostUser(
                                      user: UserEntity(username: username),
                                    ),
                                  );
                                },
                              ),
                            )
                          : HeroIcon(
                              HeroIcons.chevronRight,
                              color: AppColor.black,
                              size: 35,
                              style: HeroIconStyle.solid,
                            ),
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                height: 70,
                width: double.maxFinite,
                color: AppColor.white,
                child: Text(
                  'Information',
                  style: TextStyle(fontSize: 24, color: AppColor.argent),
                ),
              ),
              Container(
                height: 210,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (index == 0) {
                          context.read<PageProvider>().setPageIndex(22);
                        } else if (index == 1) {
                          Provider.of<PageProvider>(
                            context,
                            listen: false,
                          ).setPageIndex(20);
                        }
                      },
                      leading: Container(
                        height: 50,
                        width: 50,
                        child: informationIcon[index],
                      ),
                      title: Text(
                        informationTitle[index],
                        style: AppTextStyle.blackMaterialTextStyle,
                      ),

                      trailing: HeroIcon(
                        HeroIcons.chevronRight,
                        color: AppColor.black,
                        size: 35,
                        style: HeroIconStyle.solid,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
