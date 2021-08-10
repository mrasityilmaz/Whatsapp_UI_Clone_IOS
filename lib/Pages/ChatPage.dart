import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Model/UserModel.dart';

import '../WidgetFactory.dart';







class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  ChatPageState createState() {
    return new ChatPageState();
  }
}

class ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return MainWidget(
      largeTitleText: "Sohbetler",

      setMiddleWidget: null,

      setTrailingWidget: TrailingWidget(
        

        trailingIcon: Icon(
          CupertinoIcons.pencil_outline,
          size: 22,
        ),
      ),


      setLeadingWidget: LeadingWidget(
        leadingText: "Düzenle",
      ),


      isTextField: true,


      bodyColumnWidgets: 
      
      [
        Row(
          children: [
            TextButton(onPressed: () {}, child: Text("Toplu Mesaj Listeleri")),

            Expanded(child: SizedBox()),

            TextButton(onPressed: () {}, child: Text("Yeni Grup")),
          ],
        ),
        
        Divider(),

        Column(
            children: List.generate(
                chatList.length,
                (index) => MyListItem(
                    messageIcons: chatList[index].messageIcons,
                    lastTime: chatList[index].lastMessageTime,
                    isStory: false,
                    imageUrl: chatList[index].imageUrl,
                    userName: chatList[index].username,
                    message: chatList[index].allMessages.length != 0 ? chatList[index].allMessages.last : '',
                    storyBackgroundColor: null,

                    onTapFunc: () {
                      Navigator.of(context).push(CupertinoPageRoute<void>(
                        builder: (BuildContext context) {

                          return CupertinoPageScaffold(

                              navigationBar: CupertinoNavigationBar(

                                  backgroundColor: Colors.white,

                                  border: Border.all(color: Colors.grey.shade100),

                                  middle: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute<void>(builder:
                                                (BuildContext context) {
                                          return CupertinoPageScaffold(
                                              navigationBar: CupertinoNavigationBar(
                                                backgroundColor: Colors.white,
                                                automaticallyImplyLeading: true,
                                                previousPageTitle: chatList[index].username,
                                                middle: Text("Kişi Bilgisi"),
                                                trailing: LeadingWidget(leadingText: "Düzenle"),
                                              ),
                                              
                                              child:Center(child: Text("User Detail Page")));
                                        }));
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        height: 30,
                                        child: Row(
                                          children: [
                                            Spacer(
                                              flex: 1,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  chatList[index].imageUrl),
                                              minRadius: 15,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              chatList[index].username,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Spacer(
                                              flex: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),





                                  trailing: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        color: Colors.transparent,
                                        height: 45,
                                        width: 100,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 30,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  CupertinoIcons.video_camera,
                                                  size: 30,
                                                ),
                                                highlightColor:
                                                    Colors.transparent,
                                                splashColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 1,
                                              right: -5,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  CupertinoIcons.phone,
                                                  size: 20,
                                                ),
                                                highlightColor:
                                                    Colors.transparent,
                                                splashColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))),



                              child: ChatScreen(userIndex: index,));
                        },
                      ));
                    })))
      ],
    );
  }
}




class ChatScreen extends StatefulWidget {
  final int userIndex;
  final _controller = ScrollController();
  ChatScreen({Key? key,required this.userIndex}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var myIcon = Icons.gif;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    if (myController.text.length > 0) {
      setState(() {
        myIcon = Icons.send;
      });
    }
    if (myController.text.length == 0) {
      setState(() {
        myIcon = Icons.gif;
      });
    }
  }

  void _messagesValue(value) { 
    if (myController.text.length > 0) {
      setState(() {
        chatList[widget.userIndex].allMessages.add(value);
        myController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {  

    /////************Widgetler yüklendiğinde sohbet ekranını en aşşağıya kaydırıyor */
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (widget._controller.hasClients) {
        widget._controller.jumpTo(widget._controller.position.maxScrollExtent);
      }
    });

    return Material(
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://wallpapercave.com/wp/wp4892377.jpg"),//Chat background
                      fit: BoxFit.fill)),
              child: ListView(
                  controller: widget._controller,

                  children:
                   List.generate(
                    chatList[widget.userIndex].allMessages.length,

                    (index) => BubbleSpecialOne(//Chat baloncuğu

                      text: chatList[widget.userIndex].allMessages[index],
                      isSender: index % 2 != 0 ? true : false, // Mod alıp bir alıcıdan birde kendimden mesaj gönderiyorum
                      color:
                          index % 2 != 0 ? Colors.green.shade300 : Colors.white, // alıcı ve gönderen baloncuk rengi
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )),
            ),
          ),



          Container( // Chat screen bottom widgetleri
            height: 50,

            child: Column(

              children: [


                Container(


                  height: 50,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Row(
                    children: [


                      IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.plus),
                        hoverColor: Colors.transparent,
                      ),


                      Expanded(
                        flex: 4,
                        child: CupertinoTextField(
                            onSubmitted: (value) {
                              _messagesValue(value);// Gönderildiğinde message lsitesine ekliyor mesajı
                            },
                            onChanged: (value) {
                              _printLatestValue(); // TextField'a değer girildiğinde suffix icon  değiştiriliyor
                            },
                            controller: myController,//TextEditingController
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            suffix: IconButton(
                              onPressed: () {},
                              hoverColor: Colors.transparent,
                              icon: Icon(
                                myIcon,
                                color: Colors.blue,
                              ),
                            )),
                      ),


                      IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.photo_camera),
                        hoverColor: Colors.transparent,
                      ),



                      IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.mic),
                        hoverColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
