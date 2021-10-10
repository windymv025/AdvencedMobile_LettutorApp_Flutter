import 'package:english_lettutor_app/ui/widget/item_view/my_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blueAccent,
          leading: IconButton(
            alignment: AlignmentDirectional.center,
            icon: Expanded(child: Image.asset('assets/large_logo.png')),
            onPressed: () {
              setState(() {});
            },
          ),
          title: const Center(
              child: Text("Home",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )))),
      body: Container(),
      bottomNavigationBar: MyBottomNavigation(
          index: _currentPage,
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          }),
    );
  }
}
