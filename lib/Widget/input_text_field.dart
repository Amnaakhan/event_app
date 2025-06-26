import 'package:event_app/app/config/app_text_style.dart';
import 'package:flutter/material.dart';

import '../app/config/app_colors.dart';

class InputTextField extends StatelessWidget {

  final TextEditingController myController;
  final FocusNode? focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;
  final Widget? suffixIcon;
  final Image? prefixIcon;
  final VoidCallback? onSuffixIconPress;
  final Function(String)? onChanged;
  final TextInputType keyBoardType;
  final String hint;
  final Widget? error;
  final bool obscureText;
  final bool enable, autoFocus;

  const InputTextField({
    super.key,
    required this.myController,
     this.focusNode,
    required this.onFieldSubmittedValue,
    required this.keyBoardType,
    required this.obscureText,

    this.suffixIcon,
    this.onSuffixIconPress,
    this.onChanged,
    required this.hint,
    this.error,
    this.enable = true,
    required this.onValidator,
    this.autoFocus = false, this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        enabled: enable,
        onChanged: onChanged,
        cursorColor: AppColors.blueColor,
        style: TextStyles.regularwhite,
        decoration: InputDecoration(
            error: error,
            errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 11, fontWeight: FontWeight.w300, height: 0),
            hintText: hint,
            contentPadding: const EdgeInsets.all(20),
            hintStyle: TextStyles.regularhint,
            fillColor: AppColors.signinoptioncolor,
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),

              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),

              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),

            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon != null
                ? GestureDetector(onTap: onSuffixIconPress,child: suffixIcon)
                : null

        ),
      ),
    );
  }
}