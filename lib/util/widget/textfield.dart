import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:flutter/material.dart';

class TTextField extends StatefulWidget {
  const TTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.icon,
    this.maxlines,
  });

  final String hintText;
  final TextEditingController controller;
  final IconData? icon;
  final int? maxlines;

  @override
  State<TTextField> createState() => _TTextFieldState();
}

class _TTextFieldState extends State<TTextField> {
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    bool password = false;

    if (widget.hintText == 'Password' ||
        widget.hintText == 'Confirm Password') {
      password = true;
    }

    return TextFormField(
      controller: widget.controller,
      obscureText: password && passwordVisible,
      maxLines: widget.maxlines ?? 1,
      minLines: null,
      expands: widget.maxlines != null ? true : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        helperText: password ? "Password must contain special character" : null,
        helperStyle: const TextStyle(fontSize: 12, color: TColors.white),
        hintStyle: TextStyle(color: dark ? TColors.brown1 : TColors.brown9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: widget.icon != null
            ? Icon(
                widget.icon,
                color: dark ? TColors.grey : TColors.darkerGrey,
              )
            : null,
        suffixIcon: password
            ? IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              )
            : null,
        filled: true,
        fillColor: dark ? TColors.brown9 : TColors.brown1,
      ),
    );
  }
}
