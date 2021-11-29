import 'package:english_lettutor_app/constants/constants.dart';
import 'package:flutter/material.dart';

class Infor extends StatelessWidget {
  const Infor(
      {Key? key,
      required this.name,
      required this.email,
      required this.image,
      required this.defaultSize,
      this.onTap})
      : super(key: key);
  final String name, email, image;
  final double defaultSize;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // double defaultSize = size.height * 0.25;
    return SizedBox(
      height: defaultSize * 24, // 240
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: defaultSize * 17, //150
              color: kMainBlueColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: onTap,
                  child: Container(
                    margin: EdgeInsets.only(bottom: defaultSize), //10
                    height: defaultSize * 14, //140
                    width: defaultSize * 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: defaultSize * 0.8, //8
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image),
                      ),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: defaultSize * 2.2, // 22
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: defaultSize / 2), //5
                Text(
                  email,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8492A2),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
