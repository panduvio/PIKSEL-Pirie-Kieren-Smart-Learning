import 'package:flutter/material.dart';
import 'package:geometry_app/constant/app_color.dart';
import 'package:geometry_app/constant/app_text_style.dart';
import 'package:geometry_app/presentation/provider/page_provider.dart';
import 'package:provider/provider.dart';

class CustomQuestionBubble extends StatefulWidget {
  final double padding;
  final double width;
  final double borderRadius;
  final String questionNumber;
  final String heading;
  final String question;
  final String afterImageQuestion;
  final String image;
  final Color color;
  final int answerIndex;
  final List<String> answerList;
  final bool? isHeading;
  final bool? isImage;
  final bool? isEssay;
  final TextEditingController? essayController;
  final GlobalKey<FormState>? formKey;

  const CustomQuestionBubble({
    super.key,
    this.padding = 12,
    this.width = double.maxFinite,
    this.borderRadius = 16,
    this.color = AppColor.faience,
    required this.heading,
    required this.question,
    required this.answerIndex,
    required this.answerList,
    required this.questionNumber,
    this.isHeading = true,
    this.isEssay = false,
    this.isImage = false,
    this.essayController,
    this.formKey,
    this.afterImageQuestion = '',
    this.image = '',
  });

  @override
  State<CustomQuestionBubble> createState() => _CustomQuestionBubbleState();
}

class _CustomQuestionBubbleState extends State<CustomQuestionBubble> {
  int tapIndex = 10;
  String _question = '';
  TextEditingController essayController = TextEditingController();

  List<Widget> multipleChoice(BuildContext context, List<String> answerList) {
    final List<String> choices = ['A', 'B', 'C', 'D', 'E'];

    return List.generate(answerList.length, (index) {
      return GestureDetector(
        onTapDown: (details) {
          setState(() {
            tapIndex = index;
            context.read<PageProvider>().setChoice(true);

            context.read<PageProvider>().setAnswer(choices[tapIndex]);
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          height: 50,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: tapIndex == index
                    ? AppColor.capeJasmine
                    : AppColor.white,
                child: Text(
                  choices[index],
                  style: tapIndex == index
                      ? AppTextStyle.materialTextStyle
                      : AppTextStyle.blueMaterialTextStyle,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  answerList[index],
                  style: tapIndex == index
                      ? AppTextStyle.capeJasmineMaterialTextStyle
                      : AppTextStyle.materialTextStyle,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> essay(BuildContext context) {
    return [
      SizedBox(height: 6),
      Container(
        height: 100,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.white,
        ),
        child: TextField(
          controller: essayController,
          onChanged: (value) {
            if (value == '') {
              context.read<PageProvider>().setChoice(false);
            } else {
              context.read<PageProvider>().setChoice(true);
            }
            context.read<PageProvider>().setAnswer(value);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
      SizedBox(height: 10),
    ];
  }

  TableRow followingQuestion(BuildContext context, String afterImageQuestion) {
    return TableRow(
      children: [
        Text(
          '',
          textAlign: TextAlign.center,
          style: AppTextStyle.materialTextStyle,
        ),
        Text(
          afterImageQuestion,
          textAlign: TextAlign.justify,
          style: AppTextStyle.materialTextStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_question != widget.question) {
      setState(() {
        tapIndex = 10;
        essayController.clear();
        _question = widget.question;
      });
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(widget.borderRadius),
          bottomRight: Radius.circular(widget.borderRadius),
        ),
        color: widget.color,
      ),
      child: Column(
        children: [
          widget.isHeading == true
              ? Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: widget.width,
                  color: AppColor.white,
                  child: Text(
                    widget.heading,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.headingTextStyle,
                  ),
                )
              : SizedBox(),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Table(
              columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(12)},
              children: [
                TableRow(
                  children: [
                    Text(
                      widget.questionNumber + '.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.materialTextStyle,
                    ),
                    Text(
                      widget.question,
                      textAlign: TextAlign.justify,
                      style: AppTextStyle.materialTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          widget.isImage == true
              ? Container(
                  height: 200,
                  width: double.maxFinite,
                  child: Image.asset(widget.image, scale: 5, fit: BoxFit.none),
                )
              : SizedBox(),
          widget.isImage == true
              ? Padding(
                  padding: EdgeInsets.all(widget.padding),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(12),
                    },
                    children: [
                      followingQuestion(context, widget.afterImageQuestion),
                    ],
                  ),
                )
              : SizedBox(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: widget.isEssay == true
                  ? essay(context)
                  : multipleChoice(context, widget.answerList),
            ),
          ),
        ],
      ),
    );
  }
}
