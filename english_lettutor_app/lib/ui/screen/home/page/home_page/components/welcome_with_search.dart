import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/design/styles.dart';
import 'package:flutter/material.dart';

class WelcomeWithSearch extends StatefulWidget {
  const WelcomeWithSearch({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  _WelcomeWithSearchState createState() => _WelcomeWithSearchState();
}

class _WelcomeWithSearchState extends State<WelcomeWithSearch> {
  @override
  Widget build(BuildContext context) {
    Size size = widget.size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: size.height * 0.25,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            height: size.height * 0.25 - 27,
            decoration: const BoxDecoration(
              color: kMainBlueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Center(
              child: Container(
                color: kMainBlueColor,
                child: (size.height <= kHeightMinDefault ||
                        size.width <= kWithMinDefault)
                    ? const SizedBox.square()
                    : Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Welcome to English LetTutor App!",
                                  style: tileCountDownStyle,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: outlineButtonStyle,
                                  onPressed: () {},
                                  child: const Text(
                                    'Booking now',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: textSizeButton),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: Image.asset(
                                    "assets/images/woman-read_book.png"),
                              ))
                        ],
                      ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SearchBar(
                onIconPressed: () {
                  setState(() {});
                },
                onTextChanged: (value) {
                  setState(() {});
                },
              )),
        ],
      ),
    );
  }
}
