import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:todo/screens/tasks.dart';

import 'add_new_task.dart';
import 'home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int index = 0;
  List screens = [
    HomeScreen(),
    const Tasks(),
  ];

  void _startAddNewTask() {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return GestureDetector(
            onTap: () {},
            child:  AddNewTask(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: _bottomNavigation(context),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: (() {
          return _startAddNewTask();
        }),
        child: Container(
          height: 53,
          width: 53,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: const Color(0xffF456C3).withOpacity(.47),
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(0, 7),
              ),
            ],
            gradient: const LinearGradient(
              colors: [
                Color(0xffE0139C),
                Color(0xffF857C3),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 24,
                width: 24,
                child: SvgIcon(
                  "assets/icons/add_icon.svg",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigation(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff888888).withOpacity(.1),
            spreadRadius: 0,
            blurRadius: 9,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 58,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                index = 0;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIcon(
                  "assets/icons/home_icon.svg",
                  height: 22,
                  width: 22,
                  color: index == 0
                      ? const Color(0xff5F87E7)
                      : const Color(0xffDADADA),
                ),
                Text('Home',
                    style: GoogleFonts.rubik(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: index == 0
                          ? const Color(0xff5F87E7)
                          : const Color(0xffDADADA),
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 1;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIcon(
                  "assets/icons/grid_icon.svg",
                  height: 22,
                  width: 22,
                  color: index == 1
                      ? const Color(0xff5F87E7)
                      : const Color(0xffDADADA),
                ),
                Text('Task',
                    style: GoogleFonts.rubik(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: index == 1
                          ? const Color(0xff5F87E7)
                          : const Color(0xff9F9F9F),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
