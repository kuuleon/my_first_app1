import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _textHeader = "あなたの名前を教えてください";
  TextEditingController _textEditingController = TextEditingController();
  Widget _imageWidget = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("はじめてのflutter app"),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                _textHeader,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20.0),
              controller:
                  _textEditingController, //todo 入力した文字を管理するTextEditingController
            ),
            Expanded(child: _imageWidget),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _onClick(),
                child: Text(
                  "押してね",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onClick() {
    setState(() {
      //文字
      var inputText = _textEditingController.text;
      _textHeader = "こんにちは $inputTextさん";
      //画像の場合
      // _imageWidget = Image.asset("assets/images/hello.png");
      _imageWidget = Image.network(
          "https://images.unsplash.com/photo-1599566219227-2efe0c9b7f5f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80");
    });
  }
}
