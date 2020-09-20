import 'package:flutter/material.dart';

import 'second_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: GreetMe(),
  ));
}

class GreetMe extends StatefulWidget {
  @override
  _GreetMeState createState() {
    return _GreetMeState();
  }
}

class _GreetMeState extends State<GreetMe> {

  // this allows us to access the TextField text
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Greet Me')),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('What is your name?', style: TextStyle(fontSize: 24), ),

          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: textFieldController,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),

          RaisedButton(
            child: Text(
              'Okay',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _sendDataToSecondScreen(context);
            },
          )

        ],
      ),
    );
  }

  // get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(text: textToSend,),
        ));
  }

//
// // ignore: must_be_immutable
// class SecondScreen extends StatelessWidget {
//   final String text;
//   TextEditingController textFieldController = TextEditingController();
//
//   // receive data from the GreetMe as a parameter
//   SecondScreen({@required this.text}) : super();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Second screen')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Text('Welcome Back, ' + text, style: TextStyle(fontSize: 24),),
//           Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: Text(
//               'Welcome Back, ' + text,
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           RaisedButton(
//             child: Text(
//               'Back',
//               style: TextStyle(fontSize: 24),
//             ),
//             onPressed: () {
//               Navigator.pop(context, GreetMe);
//             },
//           )
//
//         ],
//       ),
//     );
//   }
}