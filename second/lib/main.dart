import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is title",
      home: ButtonTest(),
    );
  }
}

class MyHome extends StatelessWidget{

  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "This is appBar title",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "One",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Two",
                style: TextStyle(
                    fontSize: 16
                )
              ),
              SizedBox(
                height: 10,
              ),
              Image.network("https://images.unsplash.com/photo-1701762292571-2875f1e522b6?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", height: 300, width: 300),
              ElevatedButton(
                  onPressed: (){
                    contactUs(context);
                  },
                  child: Text("Contact Now"))
            ],
          ),
        ),
    );
  }

  void contactUs(BuildContext context) {
    var alertBox = AlertDialog(
      title: Text("Contact Us"),
      content: Text("Email me at sufiyan0211@gmail.com"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Close"),
        )
      ],

    );
    
    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertBox;
    });
  }
}

class ButtonTest extends StatelessWidget {
  const ButtonTest({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing button..."),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            debugPrint("debug printing...");
            aboutUs(context);
          }, child: Text("This is Button"),
        ),
      ),
    );
  }

  void aboutUs(BuildContext context) {
    var alertBox = AlertDialog(
      title: Text("alertBox Title"),
      content: Text("Some Content"),
      actions: <Widget>[
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: Text("Close")
          )
      ],
    );

    showDialog(
      context: context, 
      builder: (BuildContext context){
          return alertBox;
      });
  }


}