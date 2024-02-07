import 'package:flutter/cupertino.dart';
import 'package:hero_games_case/presentation/common_widgets/custom_text_field.dart';
import 'package:hero_games_case/presentation/utils/ext_utils.dart';

class EmailFormField extends StatelessWidget {
  final Function? onChanged;
  final Function? isValid;
  final String text;

  const EmailFormField(
      {super.key, this.onChanged, this.isValid, this.text = ""});

  @override
  Widget build(BuildContext context) => CustomTextField(
        hint: "E-Posta",
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Lütfen geçerli bir email girin";
          } else if (!value.isValidEmail()) {
            return "Lütfen geçerli bir email girin";
          } else {
            return null;
          }
        },
        isValid: isValid,
        onChanged: onChanged,
        text: text,
        textInputType: TextInputType.emailAddress,
        label: "E-Posta",
      );
}

class NameFormField extends StatelessWidget {
  final Function? onChanged;
  final Function? isValid;
  final String text;
  final TextInputAction inputAction;

  const NameFormField({
    super.key,
    this.onChanged,
    this.isValid,
    this.text = "",
    this.inputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) => CustomTextField(
        hint: "Ad",
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Alan boş bırakılamaz";
          } else {
            return null;
          }
        },
        isValid: isValid,
        onChanged: onChanged,
        textInputAction: inputAction,
        text: text,
        label: "Ad",
      );
}

class LastNameFormField extends StatelessWidget {
  final Function? onChanged;
  final Function? isValid;
  final String text;
  final TextInputAction inputAction;

  const LastNameFormField({
    super.key,
    this.onChanged,
    this.isValid,
    this.text = "",
    this.inputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) => CustomTextField(
        hint: "Soyad",
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Alan boş bırakılamaz";
          } else {
            return null;
          }
        },
        isValid: isValid,
        onChanged: onChanged,
        textInputAction: inputAction,
        text: text,
        label: "Soyad",
      );
}

class PasswordFormField extends StatelessWidget {
  final Function? onChanged;
  final Function? isValid;
  final String text;

  const PasswordFormField(
      {super.key, this.onChanged, this.isValid, this.text = ""});

  @override
  Widget build(BuildContext context) => CustomTextField(
        hint: "Parola",
        isObscured: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Alan boş bırakılamaz";
          } else if (value.length < 6) {
            return "Parola en az 6 karakterden oluşmalıdır";
          } else {
            return null;
          }
        },
        isValid: isValid,
        onChanged: onChanged,
        text: text,
        label: "Parola",
      );
}
