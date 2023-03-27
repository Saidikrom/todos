import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Importancy {
  Color color;
  String text;
  Importancy(this.color, this.text);
}

List<Importancy> selected = [
  Importancy(const Color(0xffFFD506), 'Personal'),
  Importancy(const Color(0xff1ED102), 'Work'),
  Importancy(const Color(0xffD10263), 'Meeting'),
  Importancy(const Color(0xff3044F2), 'Study'),
  Importancy(const Color(0xffF29130), 'Shopping'),
  Importancy(const Color(0xff9BFFF8), 'Party')
];

class ImportancySelect extends StatelessWidget {
  Color color;
  String text;
  Color textColor;
  Color backgroundColor;
  VoidCallback onPressed;

  ImportancySelect(
      {Key? key,
      required this.color,
      required this.text,
      required this.textColor,
      required this.backgroundColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        height: 30,
        margin: const EdgeInsets.only(top: 15, bottom: 15, right: 5),
        padding: const EdgeInsets.only(
          right: 15,
        ),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              color: color,
            ),
            Text(
              text,
              style: GoogleFonts.rubik(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
