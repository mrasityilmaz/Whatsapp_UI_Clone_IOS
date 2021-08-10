import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

final controller = StoryController();

class StoryUser { // Story ile alakalı alanlar diğer User sınıfından ayrıldı -**Notifylistener ile state değişiklerinde tüm listeleri etkiliyor**-
  final String username,
      
      lastStoryTime,
      imageUrl;
  final Widget? messageIcons   ; 
  final Widget? callIcons   ; 
  final List<StoryItem> storyItems;

  StoryUser(
     
      {
      required this.lastStoryTime,
      required this.storyItems,
      required this.username,
      required this.imageUrl,
      
      this.messageIcons,this.callIcons,});
}


List<StoryUser> completedList =[];
List<StoryUser> userSubList = [

  StoryUser(
      username: "Raşit Yılmaz",
      lastStoryTime: "6s önce",
      storyItems: [ // Story listeleri
        StoryItem.text(
            title: '''Merhaba 🎉''', backgroundColor: Colors.blueGrey),
        StoryItem.pageImage(
            url:
                "https://download-free-images.com/00003/hello-to-you-from-penguin-gif-with-text-376176.gif",
            controller: controller),
       
      ],
      imageUrl: "https://st2.depositphotos.com/1009634/7235/v/600/depositphotos_72350117-stock-illustration-no-user-profile-picture-hand.jpg",
      messageIcons: Icon(
        CupertinoIcons.check_mark,
        size: 16,
      ),
      callIcons:Icon(
        Icons.phone,
        size: 16,
      ),
      ),



    
  StoryUser(
      username: "Ahmet ✔",
      lastStoryTime: "1s önce",
      storyItems: [ // Story listeleri
        StoryItem.text(
            title: '''Ahmet''', backgroundColor: Colors.red),
        StoryItem.pageImage(
            url:
                "https://66.media.tumblr.com/c77f8c48911647bf6c212f115492c1de/tumblr_pzeqokTLBU1s9a9yjo1_400.gif",
            controller: controller),
      
      ],
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




  StoryUser(
      username: "Cingo",
      lastStoryTime: "Şimdi",
      storyItems: [ // Story listeleri
        StoryItem.text(
            title: '''Cingo ''', backgroundColor: Colors.white),
        StoryItem.pageImage(
            url:
                "https://i.ytimg.com/vi/CqQ_GOm2nzo/maxresdefault.jpg",
            controller: controller),
        StoryItem.pageImage(
            url: "https://pazarlamasyon.com/wp-content/uploads/2016/03/cheering_minions.gif",
            controller: controller,
            imageFit: BoxFit.contain),
      ],
      imageUrl: "https://i.ytimg.com/vi/CqQ_GOm2nzo/maxresdefault.jpg",
      messageIcons: Icon(
        CupertinoIcons.check_mark,
        size: 16,
      ),
      callIcons:Icon(
        Icons.phone,
        size: 16,
      ),
      ),




];



List<StoryUser> unCompletedList = userSubList;