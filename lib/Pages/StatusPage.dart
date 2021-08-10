import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'package:story_view/story_view.dart';

import 'package:whatsapp_ui_clone/Model/StoryItems.dart';
import 'package:whatsapp_ui_clone/Story/StoryState.dart';
import 'package:whatsapp_ui_clone/WidgetFactory.dart';





class StatusPage extends StatefulWidget {
  StatusPage({Key? key}) : super(key: key);

  @override
  StatusState createState() {
    return StatusState();
  }
}

class StatusState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return MainWidget(
        largeTitleText: "Durum",
        setMiddleWidget: null,
        setTrailingWidget: null,
        setLeadingWidget: LeadingWidget(leadingText: "Gizlilik"),     // MainWidget iskeletini istediğimiz sayfaya göre dolduruyoruz 
        isTextField: true,
        bodyColumnWidgets: [StatusBodyWidget()]); 
  }
}






class StatusBodyWidget extends StatelessWidget { // bu sayfa için Body  widgeti
  const StatusBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(     // Story durumlarını kontrol etmek için provider kullanıldı 
      create: (context) => StoryState(),
      child: Consumer<StoryState>(
        builder: (context, state, child) {
          
          return Material(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                  // Benim durumum için oluşturulan kısım        ////////////////////////////////////////////////////
                MyListItem(
                  onTapFunc: (){},
                    imageUrl: '',
                    myStatWidget: Stack( // Stack ile CircleAvatar üzerine '+' iconu yerleştirildi 
                      children: [
                        CircleAvatar(
                          minRadius: 30,
                          backgroundImage: NetworkImage(
                              "https://st2.depositphotos.com/1009634/7235/v/600/depositphotos_72350117-stock-illustration-no-user-profile-picture-hand.jpg"),
                        ),
                        Positioned(
                          bottom: 2,
                          right: 0,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue),
                            child: Icon(
                              CupertinoIcons.add,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    isStory: null,
                    message: "Durumuma ekle",
                    storyBackgroundColor: null,
                    lastTime: null,
                    lastWidget: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: IconButton(
                            hoverColor: Colors.transparent,
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.photo_camera_solid,
                              color: Colors.blue,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: IconButton(
                            hoverColor: Colors.transparent,
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.pencil,
                              color: Colors.blue,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                    messageIcons: null,
                    userName: "Durumum"),                        //////////////////////////////////////////////////// Benim durumum



                SizedBox(
                  height: 20,
                ),
                if (userSubList.length-completedList.length != 0)
                  Text(
                    "SON GÜNCELLEMELER",
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500),
                  ),
                Column(
                  //Henüz görülmemiş hikayeler
                  children: List.generate(
                      unCompletedList.length, //StoryItemsda tanımlı izlenmemiş liste 
                      (index) => MyListItem(
                          imageUrl: unCompletedList[index].imageUrl,
                          isStory: true,
                          message: unCompletedList[index].lastStoryTime,
                          storyBackgroundColor: Colors.blue,
                          lastTime: null,
                          lastWidget: null,
                          messageIcons: null,
                          userName: unCompletedList[index].username,
                          onTapFunc: (){
                            
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Material(
                                            child: StoryView(  
                                              storyItems:
                                                  unCompletedList[index].storyItems,
                                              controller: controller,
                                              onComplete: () => {
                                                Navigator.pop(context),
                                                state.setSubList(index), // izlenilen hikayeyi listeden siler 
                                              },
                                              inline: false,
                                              repeat: false,
                                              onVerticalSwipeComplete:
                                                  (value) => {
                                                if (value == Direction.down)
                                                  {
                                                    Navigator.pop(context),
                                                    state.setSubList(index), // izlenilen hikayeyi listeden siler 
                                                  }
                                              },
                                            ),
                                          )));
                              state.setStateStory(index); // izlenilen hikayeyi tamamlanmış listeye atar
                          },
                          
                          )),
                ),
                SizedBox(
                  height: 20,
                ),
                if (completedList.length != 0)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "GÖRÜLEN GÜNCELLEMELER",
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                Column(
                  children: List.generate(
                      completedList.length,
                      (index) => MyListItem(
                          imageUrl: completedList[index].imageUrl,
                          isStory: true,
                          message: completedList[index].lastStoryTime,
                          storyBackgroundColor: Colors.grey,
                          lastTime: null,
                          lastWidget: null,
                          messageIcons: null,
                          userName: completedList[index].username,
                          onTapFunc: (){ Navigator.push(
                            context,
                            MaterialPageRoute(   // İzlenilen hikayeler bir değişikliğe yol açmadığı için listelere dokunulmuyor 
                                builder: (context) => Material(
                                      child: 
                                      
                                      StoryView(
                                        storyItems: completedList[index]
                                            .storyItems,
                                        controller: controller,
                                        onComplete: () => {
                                          Navigator.pop(context),
                                        },
                                        inline: false,
                                        repeat: false,
                                        onVerticalSwipeComplete:
                                            (value) => {
                                          if (value == Direction.down)
                                            {
                                              Navigator.pop(context),
                                            }
                                        },
                                      ),
                                    )));},)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

