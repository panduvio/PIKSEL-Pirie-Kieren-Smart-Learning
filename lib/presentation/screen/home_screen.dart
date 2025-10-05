import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/about_application_page.dart';
import 'package:geometry_app/presentation/screen/balok_evaluasi_page.dart';
import 'package:geometry_app/presentation/screen/balok_formalizing.dart';
import 'package:geometry_app/presentation/screen/balok_image_having_and_property_noticing.dart';
import 'package:geometry_app/presentation/screen/balok_image_making.dart';
import 'package:geometry_app/presentation/screen/balok_inventising_page.dart';
import 'package:geometry_app/presentation/screen/balok_investising_page.dart';
import 'package:geometry_app/presentation/screen/balok_observing_page.dart';
import 'package:geometry_app/presentation/screen/balok_property_noticing.dart';
import 'package:geometry_app/presentation/screen/balok_structuring_page.dart';
import 'package:geometry_app/presentation/screen/home_page.dart';
import 'package:geometry_app/presentation/screen/info_pengembang_page.dart';
import 'package:geometry_app/presentation/screen/kubus_balok_evaluasi_page.dart';
import 'package:geometry_app/presentation/screen/kubus_evaluasi_page.dart';
import 'package:geometry_app/presentation/screen/kubus_formalizing_page.dart';
import 'package:geometry_app/presentation/screen/kubus_image_having_page.dart';
import 'package:geometry_app/presentation/screen/kubus_image_making_page.dart';
import 'package:geometry_app/presentation/screen/kubus_inventising_page.dart';
import 'package:geometry_app/presentation/screen/kubus_observing_page.dart';
import 'package:geometry_app/presentation/screen/kubus_primitive_knowing_page.dart';
import 'package:geometry_app/presentation/screen/kubus_property_noticing_page.dart';
import 'package:geometry_app/presentation/screen/kubus_structuring_page.dart';
import 'package:geometry_app/presentation/screen/profile_page.dart';
import 'package:geometry_app/presentation/widget/custom_back_button.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  // final int pageIndex;
  const HomeScreen({
    // required this.pageIndex,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState(
    //pageIndex
  );
}

class _HomeScreenState extends State<HomeScreen> {
  // String appBarTitle = 'USER FULL NAME';
  int currentBotomNavIndex = 0;
  late UserEntity usertest;
  late SharedPreferences userSp;
  String username = '';
  List<String> appBarTitleList = [
    'USER FULL NAME',
    'PROFILE',
    'EKSPLORASI',
    'KOLABORASI',
    'EVALUASI',
    'PRE-TEST',
  ];

  // _HomeScreenState(this.pageIndex);

  @override
  void initState() {
    initial();
    usertest = context.read<PageProvider>().user;
    // TODO: implement initState
    super.initState();
  }

  void initial() async {
    userSp = await SharedPreferences.getInstance();
    setState(() {
      username = userSp.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, pageProvider, child) {
        int pageIndex = pageProvider.pageIndex;
        int userLevel = pageProvider.userLevel;
        int kubusLevel = pageProvider.kubusLevel;
        int balokLevel = pageProvider.balokLevel;

        List<int> backIndexList = [
          0, 0,
          0, //Kubus Primitive Knowing
          2, 3, 4, 5,
          0, //Kubus Observing
          7, 8,
          0, //Kubus Evaluasi
          0, //Balok Image Making
          11, 12, 13, 14,
          0, //Balok Observing
          16, 17,
          0, //Balok Evaluasi
          1,
          0, //Evaluasi Akhir
          1,
        ];

        List<Widget> pageList = [
          homePage(context, userLevel, kubusLevel, balokLevel), //0
          profilePage(context), //1
          kubusPrimitiveKnowing(context), //2
          kubusImageMaking(context), //3
          kubusImageHaving(context), //4
          kubusPropertyNoticing(context), //5
          kubusFormalizing(context), //6
          kubusObserving(context), //7
          kubusStructuring(context), //8
          kubusInventising(context), //9
          kubusEvaluasi(context), //10
          balokImageMaking(context), //11
          balokImageHavingAndPropertyNoticing(context), //12
          balokFormalizing(context), //13
          balokPropertyNoticing(context), //14
          balokInvestising(context), //15
          balokObserving(context), //16
          balokStructuring(context), //17
          balokInventising(context), //18
          balokEvaluasi(context), //19
          infoPengembang(context), //20
          kubusBalokEvaluasi(
            context,
            context.read<PageProvider>().isPretest,
            context.read<PageProvider>().user,
          ), //21
          aboutApplication(), //22
        ];
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.faience,
            leading: pageIndex <= 1
                ? GestureDetector(
                    onTap: () {
                      context.read<PageProvider>().setPageIndex(1);
                      setState(() {
                        currentBotomNavIndex = 1;
                      });
                    },
                    child: HeroIcon(
                      HeroIcons.userCircle,
                      size: 40,
                      style: HeroIconStyle.solid,
                      color: AppColor.white,
                    ),
                  )
                : CustomBackButton(backIndex: backIndexList[pageIndex]),
            title: Text(
              pageIndex == 0
                  ? username
                  : ((pageIndex >= 2 && pageIndex <= 6) ||
                            (pageIndex >= 11 && pageIndex <= 15)
                        ? appBarTitleList[2]
                        : ((pageIndex >= 7 && pageIndex < 10) ||
                                  (pageIndex >= 16 && pageIndex <= 18)
                              ? appBarTitleList[3]
                              : (pageIndex >= 10
                                    ? (context.read<PageProvider>().isPretest
                                          ? appBarTitleList[5]
                                          : appBarTitleList[4])
                                    : appBarTitleList[1]))),
              // appBarTitleList[pageIndex],
              style: AppTextStyle.appBarTextStyle,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              if (context.read<PageProvider>().isPretest == false) {
                setState(() {
                  currentBotomNavIndex = value;
                  pageProvider.setPageIndex(value);
                });
              }
            },
            currentIndex: currentBotomNavIndex,
            backgroundColor: AppColor.faience,
            selectedItemColor: AppColor.capeJasmine,
            unselectedItemColor: AppColor.white,
            items: [
              BottomNavigationBarItem(
                icon: HeroIcon(HeroIcons.home, style: HeroIconStyle.solid),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: HeroIcon(
                  HeroIcons.userCircle,
                  style: HeroIconStyle.solid,
                ),
                label: 'Profile',
              ),
            ],
          ),
          body: Center(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 20),
              height: double.maxFinite,
              width: double.maxFinite,
              color: AppColor.wintersDay,
              child:
                  // homePage(context),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30),

                        // homePage(context),
                        pageList[pageIndex],
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }
}

Widget homePage(
  BuildContext context,
  int userLevel,
  int kubusLevel,
  int balokLevel,
) {
  return HomePage(
    userLevel: userLevel,
    kubusLevel: kubusLevel,
    balokLevel: balokLevel,
  );
}

Widget kubusPrimitiveKnowing(BuildContext context) {
  return KubusPrimitiveKnowingPage();
}

Widget kubusImageMaking(BuildContext context) {
  return KubusImageMakingPage();
}

Widget kubusImageHaving(BuildContext context) {
  return KubusImageHavingPage();
}

Widget kubusInventising(BuildContext context) {
  return KubusInventisingPage();
}

Widget kubusObserving(BuildContext context) {
  return KubusObservingPage();
}

Widget kubusFormalizing(BuildContext context) {
  return KubusFormalizingPage();
}

Widget kubusEvaluasi(BuildContext context) {
  return KubusEvaluasiPage();
}

Widget balokEvaluasi(BuildContext context) {
  return BalokEvaluasiPage();
}

Widget kubusBalokEvaluasi(
  BuildContext context,
  bool isPretest,
  UserEntity user,
) {
  return KubusBalokEvaluasiPage(isPretest: isPretest, user: user);
}

Widget profilePage(BuildContext context) {
  return ProfilePage();
}

Widget infoPengembang(BuildContext context) {
  return InfoPengembangPage();
}

Widget kubusPropertyNoticing(BuildContext context) {
  return KubusPropertyNoticingPage();
}

Widget kubusStructuring(BuildContext context) {
  return KubusStructuringPage();
}

Widget balokStructuring(BuildContext context) {
  return BalokStructuringPage();
}

Widget balokImageHavingAndPropertyNoticing(BuildContext context) {
  return BalokImageHavingAndPropertyNoticing();
}

Widget balokPropertyNoticing(BuildContext context) {
  return BalokPropertyNoticing();
}

Widget balokImageMaking(BuildContext context) {
  return BalokImageMaking();
}

Widget balokFormalizing(BuildContext context) {
  return BalokFormalizing();
}

Widget balokInvestising(BuildContext context) {
  return BalokInvestisingPage();
}

Widget balokInventising(BuildContext context) {
  return BalokInventisingPage();
}

Widget balokObserving(BuildContext context) {
  return BalokObservingPage();
}

Widget aboutApplication() {
  return AboutApplicationPage();
}
