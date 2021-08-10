import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Model/UserModel.dart';

import 'package:whatsapp_ui_clone/WidgetFactory.dart';















int tabControlValue = 0;


class CallsPage extends StatefulWidget {


  @override
  _CallsPageState createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
     Map<int, Widget> myTabs = const <int, Widget>{ 
    0: Text(
      "Tümü", ),
    1: Text("Cevapsız")
  };

    
    return MainWidget( //Body widget

      isTextField: true,



      largeTitleText: "Aramalar",
      
      
      
      setLeadingWidget: LeadingWidget(
        leadingText: "Düzenle",
      ),




      setMiddleWidget: CupertinoSlidingSegmentedControl(
        groupValue: tabControlValue,
        children: myTabs,
        onValueChanged: (i) {
          setState(() {
            tabControlValue = i as int;
            
          });
        }),



      setTrailingWidget: TrailingWidget(
        trailingIcon: Icon(
          Icons.add_ic_call_outlined,
          size: 22,
        ),
      ),



      bodyColumnWidgets: 
      
      
      
      tabControlValue == 0 ?  List.generate( // Aramalar sayfası için Appbar centerda bulunan Tümü/Cevapsız butonları için iki ayrı lsite üreticisi - tümü
          callList.length,
          (index) => MyListItem(
            onTapFunc: (){},
              storyBackgroundColor: null,
              isStory: false,
              callIndex: index,
              imageUrl: callList[index].imageUrl,
              message: callList[index].callMessage,
              userName: callList[index].username,
              lastTime: callList[index].lastMessageTime,
              lastWidget: Icon(
                Icons.info_outline_rounded,
                size: 26,
              ),
              callIcons: callList[index].callIcons)) :  List.generate(// Aramalar sayfası için Appbar centerda bulunan Tümü/Cevapsız butonları için iki ayrı lsite üreticisi - cevapsız
          callList.length,
          (index) => callList[index].callMessage == "Cevapsız" ? MyListItem(
            onTapFunc: (){},
              storyBackgroundColor: null,
              isStory: false,
              callIndex: index,
              imageUrl: callList[index].imageUrl,
              message: callList[index].callMessage,
              userName: callList[index].username,
              lastTime: callList[index].lastMessageTime,
              lastWidget: Icon(
                Icons.info_outline_rounded,
                size: 26,
              ),
              callIcons: callList[index].callIcons) : SizedBox())
    );
  }
}



