import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/bloc/user_bloc.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:geometry_app/presentation/screen/balok_screen.dart';
import 'package:geometry_app/presentation/widget/custom_material_bubble.dart';
import 'package:geometry_app/presentation/widget/custom_next_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class BalokInvestisingPage extends StatefulWidget {
  const BalokInvestisingPage({super.key});

  @override
  State<BalokInvestisingPage> createState() => _BalokInvestisingPageState();
}

class _BalokInvestisingPageState extends State<BalokInvestisingPage> {
  List<String> soalList = [
    '1. Gambarlah balok yang dibentuk dari susunan kubus satuan.',
    '2. Hitung banyak kubus satuan dalam balok pada nomor 1.',
    '3. Coba rumuskan, berapa panjang, lebar, dan tinggi balok pada nomor 1!',
    '4. Bandingkan hasil yang Anda temukan pada nomor 1 dengan rumus: banyak kubus satuan = panjang × lebar × tinggi sesuai nomor 3. Apa artinya?',
  ];
  int questionNumber = 1;
  TextEditingController jawabController1 = TextEditingController();
  TextEditingController jawabController2 = TextEditingController();
  TextEditingController jawabController3 = TextEditingController();
  late SharedPreferences userSp;

  File? _image;

  @override
  void initState() {
    initial();
    super.initState();
    _loadSavedImage();
  }

  /// Load previously saved image (if exists)
  Future<void> _loadSavedImage() async {
    final dir = await getApplicationDocumentsDirectory();
    final savedFile = File('${dir.path}/saved_image.txt');

    if (await savedFile.exists()) {
      final fileName = await savedFile.readAsString();
      final imageFile = File('${dir.path}/$fileName');
      if (await imageFile.exists()) {
        setState(() {
          _image = imageFile;
        });
      }
    }
  }

  /// Pick image and save it locally with original filename
  Future<void> _pickAndSaveImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) return;

    final String fileName = pickedFile.name; // original file name
    final dir = await getApplicationDocumentsDirectory();
    final String newPath = '${dir.path}/$fileName';

    // Copy picked file into app's storage
    final File localImage = await File(pickedFile.path).copy(newPath);

    // Save the filename for next time
    final savedFile = File('${dir.path}/saved_image.txt');
    await savedFile.writeAsString(fileName);

    setState(() {
      _image = localImage;
    });
  }

  void initial() async {
    userSp = await SharedPreferences.getInstance();
    setState(() {
      jawabController1 = TextEditingController(
        text: userSp.getString('balokInvestising1'),
      );
      jawabController2 = TextEditingController(
        text: userSp.getString('balokInvestising2'),
      );
      jawabController3 = TextEditingController(
        text: userSp.getString('balokInvestising3'),
      );
    });
  }

  Widget firstQuestion(BuildContext context) {
    return Column(
      children: [
        (_image != null
            ? Image.file(_image!, height: 200, width: 200, fit: BoxFit.cover)
            : Text("No image uploaded", style: AppTextStyle.materialTextStyle)),

        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _pickAndSaveImage,
          child: Text(
            "Upload Image",
            style: AppTextStyle.blueMaterialTextStyle,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'KONSEP VOLUME (KUBUS SATUAN)',
            textAlign: TextAlign.center,
            style: AppTextStyle.titleTextStyle,
          ),
          SizedBox(height: 20),
          CustomMaterialBubble(
            heading: 'INVESTISING',
            content: Column(
              children: [
                Text(
                  soalList[questionNumber - 1],
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.materialTextStyle,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Jawab:',
                    textAlign: TextAlign.left,
                    style: AppTextStyle.materialTextStyle,
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  height: 400,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: questionNumber == 1
                        ? AppColor.transparent
                        : AppColor.white,
                  ),
                  child: questionNumber > 1
                      ? TextField(
                          controller: questionNumber == 2
                              ? jawabController1
                              : (questionNumber == 3
                                    ? jawabController2
                                    : jawabController3),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.blueMaterialTextStyle,
                          decoration: InputDecoration(border: InputBorder.none),
                        )
                      : firstQuestion(context),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: CustomNextButton(
              onPressed: () {
                setState(() {
                  if (questionNumber < soalList.length) {
                    userSp.setString(
                      'balokInvestising1',
                      jawabController1.text,
                    );
                    userSp.setString(
                      'balokInvestising2',
                      jawabController2.text,
                    );

                    questionNumber = questionNumber + 1;
                  } else {
                    userSp.setString(
                      'balokInvestising3',
                      jawabController3.text,
                    );
                    if (context.read<PageProvider>().answers.balokLevel < 2) {
                      context.read<PageProvider>().setBalokLevel(2);
                      final answer = context.read<PageProvider>().answers;
                      context.read<UserBloc>().add(
                        SaveAnswer(answer.copyWith(balokLevel: 2), answer.id),
                      );
                      // userSp.setInt('balokLevel', 2);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BalokScreen(stage: 'KOLABORASI'),
                      ),
                    );
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
