import 'package:flutter/material.dart';
import 'package:tfc/widgets/text_field_container.dart';
import 'package:flutter/services.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final bool visible;
  final String hint;
  RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.hint,
    required this.visible,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  late bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(

        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(30),
          ],
          obscureText: obscure,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.blue[900],
            ),


            suffixIcon: IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () => setState (() => obscure = !obscure),
              color: Colors.blue[900],
            ),
            hintText: widget.hint,
            border: InputBorder.none,
          ),
        )
    );
  }
}