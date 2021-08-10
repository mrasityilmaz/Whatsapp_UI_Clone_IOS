import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Model/StoryItems.dart';

class StoryState extends ChangeNotifier {
  void setSubList(int index) {
    unCompletedList.removeAt(index);
    notifyListeners();
  }

  void setStateStory(int index) {
    completedList.add(unCompletedList[index]);

    notifyListeners();
  }
}
