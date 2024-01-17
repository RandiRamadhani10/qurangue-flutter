import 'package:flutter/material.dart';
import 'package:quran_gue/src/utils/Custom_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Image.asset(
          'assets/images/logo_img.png',
          height: 35.2,
          width: 35.2,
        )),
        backgroundColor: CustomColors.tealDark,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: CustomColors.tealDark,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Stay Halal Brother",
                      style: TextStyle(
                          fontSize: 45.2,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Flexible(
                    child: Image.asset(
                  'assets/images/chad_img.png',
                  height: 200.0,
                  width: 200.0,
                ))
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 106.0, horizontal: 19),
            decoration: const BoxDecoration(color: CustomColors.teal),
            child: const Column(children: <Widget>[
              Center(
                child: Text(
                  '“If you can`t stand the fatigue of studying, then you will bear the pain of stupidity"',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  '~Imam Syafi’i~',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 19),
            decoration: const BoxDecoration(color: CustomColors.tealDark),
            child: const Column(children: <Widget>[
              Center(
                child: Text(
                  "Benefits Reading Qur'an",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Card(
                  elevation: 0,
                  color: CustomColors.tealDark,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: CustomColors.tealLight, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(
                          child: Text(
                        "You will get rewarded for every letter that you read from the Qur'an.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                ),
              ),
              Center(
                child: Card(
                  elevation: 0,
                  color: CustomColors.tealDark,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: CustomColors.tealLight, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(
                          child: Text(
                        "Qur'an Calms the Soul.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                ),
              ),
              Center(
                child: Card(
                  elevation: 0,
                  color: CustomColors.tealDark,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: CustomColors.tealLight, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(
                          child: Text(
                        "You stutter and can't get it right? No problem. You will be rewarded for that too!.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
