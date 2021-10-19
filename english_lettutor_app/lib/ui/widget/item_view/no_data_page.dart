import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Expanded(child: Image.asset("assets/images/no_data_found.png")),
        height: 130,
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
