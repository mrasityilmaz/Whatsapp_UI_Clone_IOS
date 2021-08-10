import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class User { // User sınıfı chat ve arama sayfası için kullanılıyor
  final List<String> allMessages;
  final String username,callMessage,
      lastMessageTime,
      
      imageUrl;
  final Widget? messageIcons   ; 
  final Widget? callIcons   ; 


  User(
     
      {required this.allMessages,
        required this.lastMessageTime,
     
     
      
      required this.username,
      required this.imageUrl,
      required this.callMessage,
      this.messageIcons,this.callIcons,});
}


List<User> userModelList = [

  User(
     allMessages: ["Selam","Selam","Nasılsın","İyiyim sen nasılsın 😊"],//Sohbet ekranına düşecek mesaj listesi
     callMessage: "Gelen",                                              //Arama subtitle 
      username: "Raşit Yılmaz",
      lastMessageTime: "12:00",
    
      imageUrl: "https://st2.depositphotos.com/1009634/7235/v/600/depositphotos_72350117-stock-illustration-no-user-profile-picture-hand.jpg",
      messageIcons: Icon(
        CupertinoIcons.check_mark,
        size: 16,
      ),
      callIcons:Icon(
        CupertinoIcons.phone_arrow_down_left,
        size: 16,
      ),
      ),




  User(
      username: "Ahmet",
      callMessage: "Giden",
     allMessages: ["Merhaba","Merhaba","Bugün geliyorsun değil mi ?","Tabiki geliyorum."],

      lastMessageTime: "12:01",
      imageUrl: "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
       messageIcons: Icon(
        CupertinoIcons.check_mark,
        size: 16,
      ),
      callIcons:Icon(
        Icons.phone,
        size: 16,
      ),
      ),


  User(
    allMessages: ["Cingo"],
    callMessage: "Cevapsız",
      username: "Cingo",
      lastMessageTime: "1.1.1111",
      imageUrl: "https://i.ytimg.com/vi/CqQ_GOm2nzo/maxresdefault.jpg",
       messageIcons: Icon(
        CupertinoIcons.check_mark,
        size: 16,
      ),
      callIcons:Icon(
        CupertinoIcons.video_camera_solid,
        size: 16,
      ),
      ),





 


];


List<User> chatList = userModelList;
List<User> callList = userModelList;
