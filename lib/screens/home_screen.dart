import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/logic/cubit/todo_cubit.dart';
import '../styles/font_styles.dart';
import 'new_task_model.dart';
import 'reminder_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _init = false;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9FCFF),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xff81C7F5),
                        Color(0xff3867D5),
                      ])),
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
                                      'Today you have ${state.todos.length} tasks',
                                      style: FontStyles.appBarText,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff24242429)
                                            .withOpacity(.16),
                                        spreadRadius: 0,
                                        blurRadius: 18,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          state.todos.isEmpty
                              ? const SizedBox()
                              :  Reminder(
                                  todo: state.todos[currentIndex],
                                ),
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
              Expanded(
                child: state.todos.isEmpty
                    ? LayoutBuilder(builder: (context, constraints) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 50),
                              child: Image(
                                height: 170,
                                image: AssetImage('assets/empty.png'),
                              ),
                            ),
                            Text(
                              'No tasks',
                              style: FontStyles.onbText,
                            )
                          ],
                        );
                      })
                    : ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (ctx, index) {
                          currentIndex = index;
                          return NewTaskModel(
                              todo: state.todos[index],
                              delete: () {
                                setState(() {
                                  context.read<TodoCubit>().deleteTodo(
                                        state.todos[index].id,
                                      );
                                });
                              },
                              index: index,
                              importancyColor: state.todos[index].color,
                              onTickPressed: () {
                                setState(() {
                                  context
                                      .read<TodoCubit>()
                                      .toggleTodo(state.todos[index].id);
                                });
                              },
                              tickIcon: state.todos[index].isDone
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Color(0xff91DC5A),
                                    )
                                  : const Icon(
                                      Icons.circle_outlined,
                                      color: Color((0xffC6C6C8)),
                                    ),
                              titleColor: state.todos[index].isDone
                                  ? const Color(0xffC6C6C8)
                                  : const Color(0xff554E8F),
                              decoration: state.todos[index].isDone
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              ringIcon: Icon(
                                Icons.notifications,
                                color: state.todos[index].isRing
                                    ? const Color(0xffFFDC00)
                                    : const Color(0xFFD9D9D9),
                                size: 20,
                              ),
                              onRingPressed: () {
                                setState(() {
                                  context
                                      .read<TodoCubit>()
                                      .ringTodo(state.todos[index].id);
                                });
                              });
                        }),
              ),
            ],
          );
        },
      ),
    );
  }
}
