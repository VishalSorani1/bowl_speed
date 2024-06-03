// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.filedTitle,
      required this.controller,
      required this.hintText,
      required this.validator});

  final String filedTitle;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(filedTitle),
        SizedBox(
          height: 4,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintMaxLines: 1,
            errorMaxLines: 2,
            hintText: hintText,
            border: OutlineInputBorder(),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
