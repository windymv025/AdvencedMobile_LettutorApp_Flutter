import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/network/apis/become-teacher/become-teacher.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
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
                        child: Text(
                            _index == 0 ? S.current.cancel : S.current.back),
                      ),
                      style: outlineButtonStyle,
                      onPressed: controlsDetails.onStepCancel,
                    )),
            SizedBox(
                width: 100,
                child: DefaultButton(
                  press: controlsDetails.onStepContinue,
                  text: _index < 2 ? S.current.continue_str : S.current.submit,
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
          title: Text(
            S.current.complete_profile,
            style: titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          content: const Step1Page(),
        ),
        Step(
          isActive: _index >= 1,
          title: Text(
            S.current.video_introduction,
            style: titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          content: const Step2Page(),
        ),
        Step(
          isActive: _index >= 2,
          title: Text(
            S.current.approval,
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
