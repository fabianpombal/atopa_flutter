import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextInputType? inputType;
  final bool password;
  final void Function(String) callback;

  CustomInputField(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.helperText,
      this.inputType,
      this.password = false,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: password,
      keyboardType: inputType,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null) return 'Obligatorio';
        return value.length < 3 ? 'Minimo 3 letras' : null;
      },
      onChanged: callback,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hintText, labelText: labelText, helperText: helperText),
    );
  }
}
