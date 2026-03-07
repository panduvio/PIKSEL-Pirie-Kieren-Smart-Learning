import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/presentation/provider/bloc/user_bloc.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/admin_check_data_screen.dart';
import 'package:geometry_app/presentation/screen/home_screen.dart';
import 'package:heroicons/heroicons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SharedPreferences userSp;
  final _userList = userList;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isAdmin = false;
  bool isRegister = false;
  String adminPass = 'pikseladm25';
  String username = '';

  @override
  void initState() {
    initial();
    super.initState();
  }

  void clearForm() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void initial() async {
    userSp = await SharedPreferences.getInstance();
    setState(() {
      username = userSp.getString('username') ?? '';
      userSp.setString('kubusImageMaking', '');
      userSp.setString('balokImageMaking', '');
      userSp.setString('kubusImageHaving', '');
      userSp.setString('kubusPropertyNoticing', '');
      userSp.setString('balokPropertyNoticing', '');
      userSp.setString('kubusFormalizing', '');
      userSp.setString('balokFormalizing', '');
      userSp.setString('balokInvestising1', '');
      userSp.setString('balokInvestising2', '');
      userSp.setString('balokInvestising3', '');
      for (int i = 0; i < 20; i++) {
        userSp.setString('balokIHPN$i', ' ');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 40),
          color: AppColor.wintersDay,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SafeArea(
                    child: Text(
                      isRegister ? 'SIGN UP' : 'LOG IN',
                      style: TextStyle(
                        fontFamily: 'Anton',
                        fontSize: 30,
                        color: AppColor.faience,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: MediaQuery.of(context).viewInsets.bottom > 0
                        ? 200
                        : 300, // shrink when keyboard is open
                    child: Image.asset('assets/logo.png'),
                  ),
                  SizedBox(height: 30),
                  isRegister
                      ? Container(
                          // height: 50,
                          width: double.maxFinite,
                          padding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColor.faience_trp,
                          ),
                          child: TextFormField(
                            controller: usernameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Username is required';
                              }

                              return null;
                            },
                            style: AppTextStyle.materialTextStyle,
                            decoration: InputDecoration(
                              // counterStyle: AppTextStyle.materialTextStyle,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: HeroIcon(
                                  HeroIcons.user,
                                  style: HeroIconStyle.solid,
                                  color: AppColor.white,
                                ),
                              ),
                              border: InputBorder.none,
                              hint: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Username',
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(height: isRegister ? 20 : 0),
                  isAdmin
                      ? SizedBox()
                      : Container(
                          // height: 50,
                          width: double.maxFinite,
                          padding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColor.faience_trp,
                          ),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required';
                              }

                              final emailRegex = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              );

                              if (!emailRegex.hasMatch(value.trim())) {
                                return 'Enter a valid email';
                              }

                              return null;
                            },
                            style: AppTextStyle.materialTextStyle,
                            decoration: InputDecoration(
                              // counterStyle: AppTextStyle.materialTextStyle,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: HeroIcon(
                                  HeroIcons.envelope,
                                  style: HeroIconStyle.solid,
                                  color: AppColor.white,
                                ),
                              ),
                              border: InputBorder.none,
                              hint: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'E-mail',
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 20),

                  Container(
                    // height: 50,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColor.faience_trp,
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: isObscure,
                      style: AppTextStyle.materialTextStyle,
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return 'Password cannot be empty';
                        } else if (value.length < 8) {
                          return 'Password should contain at least 8 characters';
                        } else if (!isRegister) {
                          if (isAdmin) {
                            if (passwordController.text == adminPass && isAdmin)
                              return null;
                            return 'Incorrect password. Please try again';
                          }
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: HeroIcon(
                            HeroIcons.key,
                            style: HeroIconStyle.solid,
                            color: AppColor.white,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: HeroIcon(
                            HeroIcons.eye,
                            color: AppColor.white,
                            style: isObscure
                                ? HeroIconStyle.outline
                                : HeroIconStyle.solid,
                          ),
                        ),
                        border: InputBorder.none,
                        hint: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(color: AppColor.faience),
                    ),
                  ),
                  SizedBox(height: 10),
                  // SizedBox(height: 20),
                  BlocConsumer<UserBloc, UserState>(
                    listenWhen: (previous, current) => true,
                    listener: (context, state) {
                      if (state is PostSuccessState) {
                        final id = state.id;
                        Provider.of<PageProvider>(
                          context,
                          listen: false,
                        ).setUserId(id);
                        print("New Firestore ID: $id");
                        userSp.setString('id', id);
                      }

                      if (state is FailedToRegisterState ||
                          state is FailedToLoginState) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Authentication Failed.'),
                          ),
                        );
                      }

                      if (state is TryToRegisterState ||
                          state is TryToLoginState) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => PopScope(
                            canPop: false,
                            child: Center(
                              child: Lottie.asset(
                                'assets/loading_icon.json',
                                width: 150,
                                height: 150,
                              ),
                            ),
                          ),
                        );
                      }

                      if (state is RegisterSuccessState && isRegister) {
                        Navigator.pop(context);
                        clearForm();
                        setState(() {
                          isRegister = false;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Registration Successful! Please Login.',
                            ),
                          ),
                        );
                      }

                      if (state is LoginSuccessState &&
                          !isRegister &&
                          !isAdmin) {
                        Navigator.pop(context);
                        clearForm();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('LoginSuccess')),
                        );
                        context.read<PageProvider>().setUserAnswers(
                          state.answer,
                        );

                        context.read<PageProvider>().setPageIndex(
                          state.answer.isPretest ? 21 : 0,
                        );
                        context.read<PageProvider>().setUserId(state.answer.id);
                        context.read<PageProvider>().setTest(
                          state.answer.isPretest,
                        );
                        context.read<PageProvider>().setUserLevel(
                          state.answer.userLevel,
                        );
                        context.read<PageProvider>().setKubusLevel(
                          state.answer.kubusLevel,
                        );
                        context.read<PageProvider>().setBalokLevel(
                          state.answer.balokLevel,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                        // print('login success: \n ${state.answer.toMap()}');
                      }
                    },
                    builder: (context, userState) {
                      return InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (isRegister) {
                              final user = UserEntity(
                                username: usernameController.text,
                              );
                              context.read<UserBloc>().add(
                                RegisterUser(
                                  user,
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                            } else {
                              if (isAdmin) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AdminCheckDataScreen(),
                                  ),
                                );
                              } else {
                                context.read<UserBloc>().add(
                                  LoginUser(
                                    emailController.text,
                                    passwordController.text,
                                  ),
                                );
                              }
                            }
                            // if (username == usernameController.text) {
                            //   print(
                            //     'username: $username, controller: ${usernameController.text}',
                            //   );
                            //   final bool isPretest =
                            //       userSp.getBool('isPretest') ?? true;
                            //   final int userLevel = userSp.getInt('userLevel')!;
                            //   final int kubusLevel = userSp.getInt('kubusLevel')!;
                            //   final int balokLevel = userSp.getInt('balokLevel')!;
                            //   final String _id = userSp.getString('id')!;
                            //   context.read<PageProvider>().setPageIndex(0);
                            //   context.read<PageProvider>().setUserId(_id);
                            //   context.read<PageProvider>().setTest(isPretest);
                            //   context.read<PageProvider>().setUserLevel(
                            //     userLevel,
                            //   );
                            //   context.read<PageProvider>().setKubusLevel(
                            //     kubusLevel,
                            //   );
                            //   context.read<PageProvider>().setBalokLevel(
                            //     balokLevel,
                            //   );
                            // } else {
                            //   if (isAdmin == false) {
                            //     context.read<PageProvider>().setTest(true);
                            //     context.read<PageProvider>().setPageIndex(21);
                            //     context.read<PageProvider>().setBalokLevel(1);
                            //     context.read<PageProvider>().setKubusLevel(1);
                            //     context.read<PageProvider>().setUserLevel(1);
                            //     userSp.setBool('isPretest', true);
                            //     userSp.setInt('userLevel', 1);
                            //     userSp.setInt('kubusLevel', 1);
                            //     userSp.setInt('balokLevel', 1);
                            //     userSp.setString('id', '');
                            //     context.read<UserBloc>().add(
                            //       PostUser(
                            //         user: UserEntity(
                            //           username: usernameController.text,
                            //         ),
                            //       ),
                            //     );
                            //     print('- - - - -');

                            //     userSp.setString(
                            //       'username',
                            //       usernameController.text,
                            //     );
                            //     context.read<PageProvider>().setUser(
                            //       UserEntity(username: usernameController.text),
                            //     );
                            //   }
                            // }

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => isAdmin
                            //         ? AdminCheckDataScreen()
                            //         : HomeScreen(),
                            //   ),
                            // );
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColor.faience,
                          ),
                          child: Center(
                            child: Text(
                              isRegister ? 'Sign Up' : 'Log In',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      print('name: $username');
                      setState(() {
                        isAdmin = !isAdmin;
                        isRegister = false;
                      });
                    },
                    child: Text(
                      isAdmin ? 'Login as User?' : 'Login as Admin?',
                      style: AppTextStyle.blueMaterialTextStyle,
                    ),
                  ),
                  SizedBox(height: 10),
                  isAdmin
                      ? SizedBox()
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              isRegister = !isRegister;
                            });
                          },
                          child: Text(
                            isRegister
                                ? 'Already have an account? Log in here'
                                : 'Don\'t have any account? Register here',
                            style: AppTextStyle.blueMaterialTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
