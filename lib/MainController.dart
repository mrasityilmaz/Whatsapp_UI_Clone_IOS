import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import 'Pages/CallsPage.dart';
import 'Pages/ChatPage.dart';
import 'Pages/SettingsPage.dart';
import 'Pages/StatusPage.dart';


final controller = StoryController();

//Tüm sayfalar buradan kontrol ediliyor
class MainController extends StatelessWidget {
  
  const MainController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.grey.shade100,
          items: const <BottomNavigationBarItem>[


            BottomNavigationBarItem( icon: Icon(CupertinoIcons.ellipsis_circle),label: "Durum",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.phone_fill),
                icon: Icon(CupertinoIcons.phone), label: "Aramalar"),
            BottomNavigationBarItem(
               activeIcon: Icon(CupertinoIcons.camera_fill),
                icon: Icon(CupertinoIcons.camera), label: "Kamera"),
            BottomNavigationBarItem(
               activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
                icon: Icon(CupertinoIcons.chat_bubble_2), label: "Sohbetler"),
            BottomNavigationBarItem(
               
                icon: Icon(CupertinoIcons.settings), label: "Ayarlar")
          ],
        ),


        tabBuilder: (BuildContext context, int index) {
          
          if (index == 0) 
          {

            return StatusPage();
          }
          if (index == 1) 
          {
            return CallsPage();
          }
          if (index == 2) 
          {
            return Container(child: Image(image: NetworkImage("https://www.lifewire.com/thmb/dai5yxcGrSn0cBu-WFxiY20vEqU=/1732x1185/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-666891212-0195e589b6b1484284c738d0c2602d86.jpg")),);
          }
          if (index == 3) 
          {
            return ChatPage();
          } 
          else 
          {
            return SettingScreen();
          }
        },
      ),
    );
  }
}



