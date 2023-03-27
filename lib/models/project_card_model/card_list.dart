import 'package:todo/models/project_card_model/card_model.dart';

class CardList {
  List<CardModel> list = [
    CardModel(imgurl: "assets/icons/task1.png", title: "Personal", count: 24),
    CardModel(imgurl: "assets/icons/task2.png", title: "Work", count: 44),
    CardModel(imgurl: "assets/icons/task3.png", title: "Meeting", count: 45),
    CardModel(imgurl: "assets/icons/task4.png", title: "Shopping", count: 54),
    CardModel(imgurl: "assets/icons/task5.png", title: "Party", count: 24),
    CardModel(imgurl: "assets/icons/task6.png", title: "Study", count: 24),
  ];
}
