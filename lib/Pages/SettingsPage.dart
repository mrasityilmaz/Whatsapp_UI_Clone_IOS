import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/WidgetFactory.dart';





class SettingScreen extends StatefulWidget {
  const SettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var myQrImage;

  @override
  Widget build(BuildContext context) {
    return MainWidget(
        largeTitleText: "Ayarlar",
        setMiddleWidget: null,
        setTrailingWidget: null,
        setLeadingWidget: null,
        isTextField: false,
        bodyColumnWidgets: <Widget>[
          MyListItem(
            isStory: false,
            imageUrl:
                "https://st2.depositphotos.com/1009634/7235/v/600/depositphotos_72350117-stock-illustration-no-user-profile-picture-hand.jpg",
            userName: "Muhammed \nRaşit Yılmaz",
            message: "Sadece Github",
            storyBackgroundColor: null,
            onTapFunc: () {},
            lastWidget: IconButton(
              onPressed: () {
               setState(() {
                 myQrImage = MyQr();
                    
               });
              },
              icon: Icon(CupertinoIcons.qrcode),
            ),
          ),
          SizedBox(height: 100,),
          if(myQrImage != null) myQrImage
        ]);
  }
}

class MyQr extends StatelessWidget {
  const MyQr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: "github.com/mrasityilmaz",
      version: QrVersions.auto,
      size: 300.0,
    );
  }
}
