import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/logic/cubit/todo_cubit.dart';

import '../models/importancy_model/importancy.dart';
import '../models/Todo.dart';
import '../services/notification_services.dart';

import '../styles/font_styles.dart';

class AddNewTask extends StatefulWidget {
  final Todo? todo;
  const AddNewTask({Key? key, this.todo})
      : super(
          key: key,
        );

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  Color selectedColor = Colors.white;

  TextEditingController title = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _title = "";

  TimeOfDay appointedDay = TimeOfDay.now();
  DateTime scheduleTime = DateTime.now();
  late Future<TimeOfDay?> selectedTime;
  String time = "-";

  var controlIndex;

  void submitData(BuildContext context) {
    setState(() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (widget.todo == null) {
          context.read<TodoCubit>().addTodo(_title, selectedColor, time);
        } else {
          context.read<TodoCubit>().editTodo(
                Todo(
                  id: widget.todo!.id,
                  title: _title,
                  time: time,
                  color: selectedColor,
                  isDone: widget.todo!.isDone,
                ),
              );
        }
      }
    });
  }

  void notification() {
    setState(() {
      // print(widget.todo!.title);
    });

    debugPrint(' Time is up');
    NotificationService().scheduleNotification(
      title: 'Todo Notification',
      body:
          'Reminder: Your todo item ${widget.todo!.title} is due now. Please complete it as soon as possible.',
      scheduleNotificationDateTime: scheduleTime,
    );
  }

  void showTime() {
    setState(() {});
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      onChanged: (date) {
        setState(() {});
        scheduleTime = date;
      },
      onConfirm: (date) {},
    ).then((value) {
      setState(() {
        if (value == null) return;
        time = DateFormat("H:m MMM d").format(value);
        // "${value.hour} : ${value.minute}  ${value.day} ${value.month}";
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(time);
    return BlocListener<TodoCubit, TodoState>(
      listener: (context, state) {},
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          color: Colors.transparent,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 410,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(600, 100),
                        topRight: Radius.elliptical(600, 100),
                      )),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 30,
                          bottom: 20,
                        ),
                        child: Text(
                          'Add new task',
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          cursorHeight: 30,
                          initialValue:
                              widget.todo == null ? '' : widget.todo!.title,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Title";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _title = value!;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selected.length,
                          itemBuilder: (ctx, index) {
                            return ImportancySelect(
                                color: selected[index].color,
                                text: selected[index].text,
                                textColor: controlIndex == index
                                    ? Colors.white
                                    : Colors.grey,
                                backgroundColor: controlIndex == index
                                    ? selected[index].color
                                    : Colors.white,
                                onPressed: () {
                                  setState(() {
                                    selectedColor = selected[index].color;
                                    controlIndex = index;
                                  });
                                });
                          },
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Choose date',
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          showTime();
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                time == "-"
                                    ? widget.todo == null
                                        ? 'Date'
                                        : widget.todo!.time
                                    : time,
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                            notification();
                            submitData(context);
                          });
                        },
                        child: Container(
                          height: 53,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                          ),
                          decoration: (BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(colors: [
                              Color(0xff7EB6FF),
                              Color(0xff5F87E7),
                            ]),
                          )),
                          child: Center(
                            child: Text(
                              widget.todo == null ? 'add task' : "Edit task",
                              style: FontStyles.addButtonText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 30,
                bottom: 385,
                child: FloatingActionButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: Container(
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffE0139C),
                          Color(0xffF857C3),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.clear,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
