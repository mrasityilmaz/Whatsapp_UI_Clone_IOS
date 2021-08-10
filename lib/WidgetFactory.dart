import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Model/UserModel.dart';





//Bu widget Genel kalıp olarak  oluşturulmuş sadece body için List<Widget> alır.
//diğer parametreler sayfalara göre değişkenlik gösterebilir.
class MainWidget extends StatefulWidget {
  final List<Widget> bodyColumnWidgets; //Body
  final bool isTextField; //Sayfa başında textfield olacakmı
  final Widget? setMiddleWidget; // Appbar center widgeti
  final Widget? setTrailingWidget;//Appbar left widgeti
  final Widget? setLeadingWidget;//Appbar right widgeti
  final String? largeTitleText;//Sayfa başındaki sayfa texti

  MainWidget(
      {Key? key,
      required this.largeTitleText,
      required this.setMiddleWidget,
      required this.setTrailingWidget,
      required this.setLeadingWidget,
      required this.isTextField,
      required this.bodyColumnWidgets})
      : super(key: key);

  @override
  _MainWidgetState createState() {
    return _MainWidgetState();
  }
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.transparent,
            stretch: true,
            border: Border.fromBorderSide(BorderSide.none),
            leading: widget.setLeadingWidget,
            middle: widget.setMiddleWidget,
            trailing: widget.setTrailingWidget,
            largeTitle: Text(widget.largeTitleText.toString()),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Material(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [

                        if (widget.isTextField)
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CupertinoTextField(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              placeholder: "Ara",
                              prefix: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),




                        SizedBox(height: 5),


                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(

                            children: 
                                widget.bodyColumnWidgets   /////Body
                            
                            ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}


//Programda çoğunlukla aynı yapıda kullanılan ListTile ana widgeti diğer sayfalar bu widgeti kullanarak Liste oluşturur.
//Fonksiyon,widget,bool,int parameretleri alır,her sayfaya uyum sağlaması için bazıları Nullable olarak oluşturuldu.
class MyListItem extends StatelessWidget {
  final int? callIndex; //Üst parent'dan gelen Index sadece arama sayfası için kullanılıyor
  final Function onTapFunc; //  //     onTap () {onTapFunc}
  final Widget? myStatWidget; // // Sadece Durum sayfasında kendi durumumuz için 
  final bool? isStory ;  // Story olup olmadığı  ? 
  final Color? storyBackgroundColor;  // 
  final String imageUrl;  // profil picture
  final String userName; 
  final Widget? messageIcons; // Sohbet sayfasında subtitle başında göstermek istediğiniz icon için
  final Widget? callIcons; // Arama  sayfasında subtitle başında göstermek istediğiniz icon için
  final String message;  
  final String? lastTime; // son mesaj gönderme tarihi
  final Widget? lastWidget; // Widget en sonunda bulunan bazı iconlar için

  const MyListItem(
      {Key? key,
      required this.isStory,
      required this.imageUrl,
      required this.userName,
      this.messageIcons,
      required this.message,
      this.lastTime,
      this.lastWidget,
      required this.storyBackgroundColor, this.myStatWidget,required this.onTapFunc, this.callIcons, this.callIndex,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widgetwidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.white,
      child: InkWell( // Tap kontrolü 
        
        onTap: () {
          onTapFunc();
        },
        splashColor: Colors.greenAccent,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(myStatWidget != null )myStatWidget as Widget, // eğer oluturulacak widget benim durumum ise 
                
                if(isStory == true && myStatWidget == null) CircleAvatar( // eğer oluturulacak widget benim durumum değilse
                  backgroundColor: storyBackgroundColor,
                  minRadius: 32,
                  child: CircleAvatar(
                    
                    minRadius: 30,
                    backgroundImage: 
                    NetworkImage(imageUrl ),
                  ),
                ),


                if(isStory == false || isStory == null && myStatWidget == null) Align( // durum haricindekiler için
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    minRadius: 30,
                
                    backgroundImage: 
                    NetworkImage(imageUrl) 
                  
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 6,
                  child: ListTile(

                    isThreeLine: true,
                    tileColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    minVerticalPadding: 12,
                    title: Text(
                     userName,
                      softWrap: false,    // Arama sayfası için eğer subtitle Cevapsız ise yazı rengi kırmızıya çeviriliyor değilse siyah
                      style: TextStyle(color:callIndex != null ?  callList[callIndex as int].callMessage == "Cevapsız" ?  Colors.red : Colors.black : Colors.black, fontSize: 16),
                    ),
                    subtitle: Row(
                      children: [
                        if (messageIcons != null) messageIcons as Widget, 
                        if (messageIcons != null)
                          SizedBox(
                            width: 2,
                          ),
                         if (callIcons != null) callIcons as Widget,
                        if (callIcons != null)
                          SizedBox(
                            width: 2,
                          ),
                        Text(
                          message,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                if(lastTime != null)Align(
                  alignment: Alignment.center,
                  child: Text(
                    (lastTime as String),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4), fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                if (lastWidget != null)
                  Align(
                    alignment: Alignment.center,
                    child: lastWidget),
              ],
            ),
            Align( // Her listviewItem sonunda bulunan divider
                alignment: Alignment.topRight,
                child: SizedBox(
                  child: Divider(
                    height: 1,
                  ),
                  width: widgetwidth - 80,
                ))
          ],
        ),
      ),
    );
  }
}

//Genellikle Appbar'ın en sağında IconButton bulunduğu için icon parametresi alır
class TrailingWidget extends StatelessWidget {
 
  final Widget trailingIcon;
  const TrailingWidget({
    Key? key,
    required this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: IconButton(
          icon: trailingIcon,
          
          onPressed: () {},
        ));
  }
}


//Sadece String parametre alıp Appbar'daki LeadingWidget'ı oluşturur.
class LeadingWidget extends StatelessWidget {
  final String leadingText;
  const LeadingWidget({
    Key? key,
    required this.leadingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        leadingText,
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () {},
    );
  }
}



