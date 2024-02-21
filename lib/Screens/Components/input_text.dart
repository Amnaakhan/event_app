import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class InputText extends StatelessWidget {
  final String placeholder;
  final IconData? icon;
  final TextEditingController controller;
  final bool password;
  final Function(String)? onChanged;
  final void Function()? onPressed;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Image image;
  const InputText({

    required this.placeholder,

    required this.controller,
    this.password = false,
    this.onPressed,
    this.onChanged,
    this.keyboardType,
    this.validator,  this.icon, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),

      ),
      child: TextFormField(
        controller: controller,
        obscureText: password,
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          fillColor:Colors.transparent,
          filled: true,
          hintText: placeholder,
          prefixIcon: image,
          suffixIcon: Icon(icon,color: Color.fromRGBO(128, 122, 122, 1),),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
            color: Color.fromRGBO(228, 223, 223, 1),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          errorStyle: GoogleFonts.poppins(),
          hintStyle: GoogleFonts.poppins(
            color: Color.fromRGBO(116, 118, 136, 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:               Colors.black,

            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusColor:  Colors.black,

          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
        cursorColor: Colors.black,
        style: GoogleFonts.montserrat(
          color: Theme.of(context).primaryColorLight,
          fontSize: 14,
        ),
      ),
    );
  }
}