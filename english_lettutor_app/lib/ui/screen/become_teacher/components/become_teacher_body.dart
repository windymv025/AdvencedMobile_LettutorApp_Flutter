import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/step1/step1_page.dart';
import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/step2/step2_page.dart';
import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/step3/step3_page.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
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
    Size size = MediaQuery.of(context).size;
    return Stepper(
      currentStep: _index,
      type: size.width > kMobileBreakpoint
          ? StepperType.horizontal
          : StepperType.vertical,
      controlsBuilder: (context, controlsDetails) {
        return Row(
          mainAxisAlignment:
              (_index == 2) ? MainAxisAlignment.center : MainAxisAlignment.end,
          children: [
            (_index == 2)
                ? const SizedBox.shrink()
                : SizedBox(
                    width: 100,
                    child: OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(_index == 0 ? "Cancel" : "Back"),
                      ),
                      style: outlineButtonStyle,
                      onPressed: controlsDetails.onStepCancel,
                    )),
            SizedBox(
                width: 100,
                child: DefaultButton(
                  press: controlsDetails.onStepContinue,
                  text: _index < 2 ? "Continue" : "Finish",
                )),
          ],
        );
      },
      onStepTapped: (index) {
        if (index < _index) {
          setState(() {
            _index = index;
          });
        }
      },
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
          isActive: _index >= 0,
          title: const Text(
            "Complete profile",
            style: titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          content: const Step1Page(),
        ),
        Step(
          isActive: _index >= 1,
          title: const Text(
            "Video introduction",
            style: titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          content: const Step2Page(),
        ),
        Step(
          isActive: _index >= 2,
          title: const Text(
            "Approval",
            style: titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          content: const Step3Page(),
        ),
      ],
    );
  }
}
