import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/helper/keyboard.dart';
import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/screen/forgot_password/forgot_password_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/form_error.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  List<String> errors = [];

  String? conformPassword;
  bool isLoading = false;

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
    ProfileProvider profileProvider = context.read<ProfileProvider>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          const SizedBox(
            height: 20,
          ),
          buildPasswordFormField(),
          const SizedBox(
            height: 20,
          ),
          buildConformPassFormField(),
          const SizedBox(height: 25),
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName);
                  },
                  child: Text(
                    S.current.forgot_password,
                    style: const TextStyle(
                        color: Color(0xff248EEF),
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          const SizedBox(
            height: 10,
          ),
          isLoading
              ? CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation(kMainBlueColor),
                  backgroundColor: Colors.grey[200],
                )
              : DefaultButton(
                  text: S.current.sign_up,
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // if all are valid then go to success screen
                      KeyboardUtil.hideKeyboard(context);
                      if (email != null &&
                          email!.isNotEmpty &&
                          password != null &&
                          password!.isNotEmpty &&
                          conformPassword != null &&
                          conformPassword!.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        profileProvider.signUp(email!, password!).then((value) {
                          if (value) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(S.current.registor_success),
                            ));
                            Navigator.pop(context);
                          } else {
                            addError(S.current.email_is_already_in_use);
                          }
                          setState(() {
                            isLoading = false;
                          });
                        });
                      }
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
        email = value;
        checkEmail(value);
      },
      validator: (value) {
        return value == null ? "" : checkEmail(value);
      },
      decoration: InputDecoration(
        label: const Text("Email"),
        hintText: S.current.enter_email,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(icon: Icons.mail_outline_rounded),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        password = value;
        checkPassword(value);
      },
      validator: (value) {
        return value == null ? "" : checkPassword(value);
      },
      decoration: InputDecoration(
        label: Text(S.current.password),
        hintText: S.current.enter_password,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(icon: Icons.lock_outline_rounded),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conformPassword = newValue,
      onChanged: (value) {
        conformPassword = value;
        checkConformPassword(value);
      },
      validator: (value) {
        return value == null ? "" : checkConformPassword(value);
      },
      decoration: InputDecoration(
        labelText: S.current.confirm_password,
        hintText: S.current.re_enter_your_password,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(icon: Icons.lock_outline_rounded),
      ),
    );
  }

  String? checkEmail(String value) {
    bool isError = false;
    if (value.isNotEmpty) {
      removeError(S.current.please_enter_email);
      isError = false;
    } else {
      addError(S.current.please_enter_email);
      isError = true;
    }
    if (emailValidatorRegExp.hasMatch(value) || value.isEmpty) {
      removeError(S.current.please_enter_email_valid);
      isError = false;
    } else {
      addError(S.current.please_enter_email_valid);
      isError = true;
    }
    return isError ? "" : null;
  }

  String? checkPassword(String value) {
    bool isError = false;
    if (value.isNotEmpty) {
      removeError(S.current.please_enter_password);
      isError = false;
    } else {
      addError(S.current.please_enter_password);
      isError = true;
    }
    if (value.length >= 6 || value.isEmpty) {
      removeError(S.current.please_enter_password_min);
      isError = false;
    } else {
      addError(S.current.please_enter_password_min);
      isError = true;
    }
    return isError ? "" : null;
  }

  String? checkConformPassword(String value) {
    bool isError = false;
    if (value.isNotEmpty) {
      removeError(S.current.please_enter_conform_password);
      isError = false;
    } else {
      addError(S.current.please_enter_conform_password);
      isError = true;
    }
    if (conformPassword == password || value.isEmpty) {
      removeError(S.current.password_dont_match);
      isError = false;
    }
    if (conformPassword != password) {
      addError(S.current.password_dont_match);
      isError = true;
    }
    return isError ? "" : null;
  }
}
