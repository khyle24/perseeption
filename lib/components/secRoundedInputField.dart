import 'package:flutter/material.dart';
import 'package:perseeption/constants.dart';
import 'package:perseeption/components/text_field_container.dart';
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.contact_phone,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: cicon,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}