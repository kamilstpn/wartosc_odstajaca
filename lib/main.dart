import 'package:flutter/material.dart';
import 'package:wartosc_odstajaca/screens/welcome_screen.dart';
import 'package:wartosc_odstajaca/screens/result_screen.dart';

void main()=>runApp(const Start());
class Start extends StatelessWidget{
  const Start({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color:Colors.black54),
        ),
      ),
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes:{
        ResultScreen.id:(context)=>ResultScreen(result: '0'),
      },

    );
  }
}