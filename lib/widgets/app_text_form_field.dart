import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final int? maxLines;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? isReadOnly;
  final void Function()? onTap   ;
  final TextEditingController  controller;
  final String? Function(String?)? validator;
  const AppTextFormField({super.key, required this.labelText, this.maxLines, this.suffixIcon, required this.hintText, this.isReadOnly, this.onTap, this.validator, required this.controller });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator?? (value) {
        if (value == null || value.isEmpty) {
          return 'this field is required';
        }
        return null;
      },
      onTap: onTap,
      readOnly: isReadOnly ?? false,
      onTapOutside: (_){
        FocusScope.of(context).unfocus();
      },
      maxLines: maxLines,

      decoration:
      InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
        ),
      ),
    )
    ;
  }
}
