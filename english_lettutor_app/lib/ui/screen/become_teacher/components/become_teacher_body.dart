import 'package:english_lettutor_app/ui/screen/become_teacher/components/step1_page.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class BecomeTeacherBody extends StatefulWidget {
  const BecomeTeacherBody({Key? key}) : super(key: key);

  @override
  _BecomeTeacherBodyState createState() => _BecomeTeacherBodyState();
}

class _BecomeTeacherBodyState extends State<BecomeTeacherBody> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        } else {
          Navigator.pop(context);
        }
      },
      onStepContinue: () {
        if (_index < 2) {
          setState(() {
            _index += 1;
          });
        } else {
          Navigator.pop(context);
        }
      },
      steps: [
        Step(
          title: const Text(
            "Complete profile",
            style: titleStyle,
          ),
          content: Step1Page(),
        ),
        Step(
          title: const Text(
            "Video introduction",
            style: titleStyle,
          ),
          content: Container(),
        ),
        Step(
          title: const Text(
            "Approval",
            style: titleStyle,
          ),
          content: Container(),
        ),
      ],
    );
  }
}
