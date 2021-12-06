import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/home_state.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var backgroundColor = isDark ? kDarkColor : kMainBlueColor;

    return Consumer<HomeState>(builder: (context, HomeState homeState, _) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: size.height * 0.25,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
              height: size.height * 0.25 - 27,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
              child: Center(
                child: Container(
                  color: backgroundColor,
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
                                    onPressed: () {
                                      homeState.pageIndex = 3;
                                    },
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
    });
  }
}
