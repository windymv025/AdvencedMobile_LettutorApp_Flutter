import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/step1_page.dart';
import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/step2_page.dart';
import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/step3_page.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:english_lettutor_app/utilities/design/styles.dart';
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
      type: StepperType.horizontal,
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
          ),
          content: const Step1Page(),
        ),
        Step(
          isActive: _index >= 1,
          title: const Text(
            "Video introduction",
            style: titleStyle,
          ),
          content: const Step2Page(),
        ),
        Step(
          isActive: _index >= 2,
          title: const Text(
            "Approval",
            style: titleStyle,
          ),
          content: const Step3Page(),
        ),
      ],
    );
  }
}
