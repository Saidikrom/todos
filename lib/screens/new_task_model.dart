import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:todo/logic/cubit/todo_cubit.dart';
// import '../models/new_task_models/Todoss.dart';
import '../models/Todo.dart';
import 'add_new_task.dart';

class NewTaskModel extends StatefulWidget {
  final Todo? todo;
  VoidCallback delete;
  // final Function dateTime;

  int index;
  Color importancyColor;
  VoidCallback onTickPressed;
  Icon tickIcon;
  // String title;
  Color titleColor;
  TextDecoration decoration;
  VoidCallback onRingPressed;
  Icon ringIcon;
  NewTaskModel({
    Key? key,
    required this.index,
    this.todo,
    required this.delete,
    required this.importancyColor,
    required this.onTickPressed,
    required this.tickIcon,
    required this.titleColor,
    required this.decoration,
    required this.ringIcon,
    required this.onRingPressed,
  }) : super(key: key);

  @override
  State<NewTaskModel> createState() => _NewTaskModelState();
}

class _NewTaskModelState extends State<NewTaskModel> {
  void _startAddNewTask() {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return GestureDetector(
            onTap: () {},
            child: AddNewTask(
              todo: widget.todo!,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.30,
            children: [
              GestureDetector(
                onTap: () {
                  _startAddNewTask();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffC4CEF5),
                  ),
                  height: 40,
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SvgIcon(
                        "assets/icons/edit_icon.svg",
                        height: 16,
                        width: 16,
                        color: Color(0xff5F87E7),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: widget.delete,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffFFCFCF),
                  ),
                  height: 40,
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SvgIcon(
                        "assets/icons/delete_icon.svg",
                        height: 16,
                        width: 16,
                        color: Color(0xffFB3636),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              top: 5,
              left: 15,
              right: 15,
              bottom: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: widget.importancyColor,
            ),
            padding: const EdgeInsets.only(left: 7),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        spreadRadius: 0,
                        blurRadius: 9,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: widget.onTickPressed,
                            child: widget.tickIcon,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 15,
                              bottom: 20,
                            ),
                            child: Text(
                              widget.todo!.time,
                              style: GoogleFonts.rubik(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: const Color((0xffC6C6C8)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                widget.todo!.title,
                                style: GoogleFonts.rubik(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: widget.titleColor,
                                    decoration: widget.decoration),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: widget.onRingPressed,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 55,
                            child: widget.ringIcon),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
