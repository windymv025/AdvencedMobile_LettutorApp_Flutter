import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/screen/favorite_teacher/components/favorite_teacher_body.dart';
import 'package:flutter/material.dart';

class FavoriteTeacher extends StatefulWidget {
  static const routeName = '/favorite-teacher';
  const FavoriteTeacher({Key? key}) : super(key: key);

  @override
  _FavoriteTeacherState createState() => _FavoriteTeacherState();
}

class _FavoriteTeacherState extends State<FavoriteTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.favorite_teachers),
      ),
      body: const FavoriteTeacherBody(),
    );
  }
}
