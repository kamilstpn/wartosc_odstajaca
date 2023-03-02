import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List <int> value(List<int> array){
    List<int> even=[];
    List<int> odd=[];
    for (var i=0;i<array.length;i++){
      if(array[i]%2==0){
        even.add(array[i]);
      } else{
        odd.add(array[i]);
      }
    }
    if (even.length<=odd.length){
      return even;
    }else{
      return odd;
    }
  }
  late TextEditingController _controller;
  @override
  void initState(){
    super.initState();
    _controller=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TypewriterAnimatedTextKit(
              text: const ['Enter numbers'],
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 35.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              autofocus: true,
              style: const TextStyle(color: Colors.blueAccent),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.arrow_forward_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
                //labelText: 'Enter numbers',
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    String text=_controller.text;
                    List<String> result=text.split(',');
                    List <int> resultInt=result.map(int.parse).toList();
                    List <int> finalResults=value(resultInt);
                    int finalResult=finalResults[0];
                    if (resultInt.length<3){
                      showDialog(
                        context: context,
                        builder: (context){
                            return const AlertDialog(
                              content: Text('Enter at least 3 numbers'),
                            );
                        },
                      );
                    }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>ResultScreen(result: finalResult.toString(),),
                    )
                  );
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Search',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}