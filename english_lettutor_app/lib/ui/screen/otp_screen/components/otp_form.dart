import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/helper/keyboard.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/form_error.dart';
import 'package:flutter/material.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({Key? key, required this.routeName}) : super(key: key);
  final String routeName;

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  List<String> errors = [];

  void addError(String error) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError(String error) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                "Not received OTP?",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: InkWell(
                  onTap: () {
                    //TODO: Send OTP Again
                  },
                  child: const Text(
                    "Resend OTP",
                    style: TextStyle(
                        color: Color(0xff248EEF),
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FormError(errors: errors),
          const SizedBox(
            height: 10,
          ),
          DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, widget.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kOTPNullError);
        } else if (value.length == 6) {
          removeError(kOTPError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kOTPNullError);
          return "";
        } else if (value.length != 6) {
          addError(kOTPError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text("OTP"),
        hintText: "Enter OTP in your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(icon: Icons.code_rounded),
      ),
    );
  }
}
