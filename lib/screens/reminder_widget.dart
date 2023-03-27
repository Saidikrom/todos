import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Todo.dart';
import '../styles/font_styles.dart';

class Reminder extends StatelessWidget {
  Todo? todo;
  Reminder({
    super.key,
    this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0x30ffffff),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today Remainder',
                style: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                todo!.title,
                style: FontStyles.remainderText,
              ),
              Text(
                todo!.time,
                style: FontStyles.remainderText,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/ring.png'),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
