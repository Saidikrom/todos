import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/project_card_model/card_list.dart';
import '../styles/font_styles.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

final cardData = CardList();
final list = cardData.list;


class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9FCFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff81C7F5),
                          Color(0xff3867D5),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 50, left: 30, right: 30, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello Brenda',
                                    style: FontStyles.appBarText,
                                  ),
                                  Text(
                                    'Today you have 9 tasks',
                                    style: FontStyles.appBarText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
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
                                    'Meeting with client',
                                    style: FontStyles.remainderText,
                                  ),
                                  Text(
                                    '13:00 PM',
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
                                    child:
                                        Image.asset('assets/images/ring.png'),
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
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -90,
                  left: -70,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x20ffffff),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    height: 200,
                    width: 200,
                  ),
                ),
                Positioned(
                  top: -10,
                  right: -10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x20ffffff),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    height: 90,
                    width: 90,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, bottom: 10),
            child: Text(
              'Projects',
              style: GoogleFonts.rubik(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: const Color(0xff554E8F),
              ),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  primary: false,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(18),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffBBBBBB).withOpacity(.35),
                            spreadRadius: 0,
                            blurRadius: 11,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              height: 100,
                              image: AssetImage(list[i].imgurl),
                            ),
                          ),
                          Text(
                            list[i].title,
                            style: GoogleFonts.rubik(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '${list[i].count} Tasks',
                              style: GoogleFonts.rubik(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
