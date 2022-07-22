import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfc/pages/login.dart';
import 'package:tfc/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged <String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged, required label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
          ],
          onChanged: onChanged,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.blue[900],
            ),
            hintText: "Nome de utilizador",
            border: InputBorder.none,

          ),

        )
    );
  }
}