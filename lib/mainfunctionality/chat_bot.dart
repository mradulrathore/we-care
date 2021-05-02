import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

//import 'package:bubble/bubble.dart';
//import 'package:flutter_dialogflow/dialogflow_v2.dart';
//import 'package:map/utils/constant.dart';
class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  void response(String query) async {
//    AuthGoogle authGoogle = await AuthGoogle(
//        fileJson: "assets/service.json")
//        .build();
//    Dialogflow dialogflow =
//    Dialogflow(authGoogle: authGoogle, language: Language.english);
//    AIResponse aiResponse = await dialogflow.detectIntent(query);
//    setState(() {
//      messsages.insert(0, {
//        "data": 0,
//        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
//      });
//    });
    query = query.toLowerCase();
//  print(message);
    if (query == 'hey' || query == 'hi' || query == 'hello') {
      setState(() {
        messsages.insert(0, {"data": 0, "message": "hello"});
      });
    } else if (query == 'I suffered from something') {
      setState(() {
        messsages.insert(0, {"data": 0, "message": "Tell me!! What happened?"});
      });
    } else if (query == 'experienced molestation' ||
        query == 'i experienced molestation') {
      setState(() {
        messsages.insert(0, {
          "data": 0,
          "message":
              "If u come across this incident again...immediately dial 100 or women helpline no. And give all the details about the incident"
        });
      });
    } else if (query == 'experienced robbery' ||
        query == 'i experienced robbey') {
      setState(() {
        messsages.insert(
            0, {"data": 0, "message": "Go to Police Station or dial 100"});
      });
    } else {
      setState(() {
        messsages
            .insert(0, {"data": 0, "message": "Please try something else"});
      });
    }
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xffffdae0),
          ),
        ),
        title: Text(
          "Chat with us",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messsages.length,
                  itemBuilder: (context, index) {
                    return chat(
                      messsages[index]["message"]?.toString(),
                      messsages[index]["data"],
                    );
                  }),
            ),
            Divider(
              height: 5.0,
              color: Color(0XFFffdae0),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    controller: messageInsert,
                    decoration: InputDecoration.collapsed(
                        hintText: "Send your message",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.send,
                          size: 30.0,
                          color: Color(0XFFffdae0),
                        ),
                        onPressed: () {
                          if (messageInsert.text.isEmpty) {
                            print("empty message");
                          } else {
                            setState(() {
                              messsages.insert(0,
                                  {"data": 1, "message": messageInsert.text});
                            });
                            response(messageInsert.text);
                            messageInsert.clear();
                          }
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
        radius: Radius.circular(15.0),
        color: data == 0 ? Color(0XFFFF748C) : Color(0xffECECEC),
        elevation: 0.0,
        alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
        nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(
                    data == 0 ? "assets/botReply.png" : "assets/user.png"),
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                  child: Text(
                message,
                style: TextStyle(
                    color: data == 0 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
