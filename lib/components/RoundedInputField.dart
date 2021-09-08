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

          keyboardType: TextInputType.number,
        maxLength: 11,
        style: TextStyle(fontSize: 17,color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: cicon,
          ),
          hintText: hintText ,hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}