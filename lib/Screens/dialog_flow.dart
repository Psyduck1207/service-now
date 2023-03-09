import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/Messages.dart';

class Sakhi extends StatefulWidget {

  @override
  _SakhiState createState() => new _SakhiState();
}

class _SakhiState extends State<Sakhi> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _textController = new TextEditingController();
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sakhi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[200],
        elevation: 0,
      ),
      body: Column(children: <Widget>[
        Expanded(child: MessagesScreen(messages: messages)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          color: Colors.pink[200],
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                  )),
              IconButton(
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                  icon: Icon(Icons.send, color: Colors.white,))
            ],
          ),
        )
      ]),
    );
  }
}
