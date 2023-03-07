import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ResultScreen extends StatelessWidget {

  ResultScreen({super.key, required this.result});
  static const String id = 'result_screen';
  String result;

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
            Center(
              child: Text(result,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 80.0,
                fontWeight: FontWeight.w500,
              ),),
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
                    //Navigator.pushNamed(context, WelcomeScreen.id);
                    Navigator.pop(context);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child:  Text(
                    AppLocalizations.of(context)!.goBack,
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