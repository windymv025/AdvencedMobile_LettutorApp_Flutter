import 'package:english_lettutor_app/ui/screen/page/no_data_page.dart';
import 'package:english_lettutor_app/utilities/constants.dart';
import 'package:english_lettutor_app/utilities/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // welcome
          Container(
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome to English LetTutor App!",
                    style: Styles.tileCountDownStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: Styles.outlineButtonStyle,
                    onPressed: () {},
                    child: const Text(
                      'Booking now',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: Constants.textSizeButton),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // see all
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
            children: [
              const Expanded(
                  child: Text(
                "Recommended Tutors",
                style: Styles.titleStyle,
              )),
              TextButton(
                onPressed: () {},
                child: const Text("See all >>"),
                style: Styles.textButtonStyle,
              )
            ],
          )),
          //listview
          const NoDataPage(),
        ],
      ),
    );
  }
}
