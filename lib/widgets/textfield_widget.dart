import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.title,
    this.subTitle,
    this.validator,
    this.keyboardType,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.autovalidateMode
  });
  final String title;
  final String? subTitle;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? initialValue;
  final Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        if (subTitle != null) Text(subTitle!),
        SizedBox(height: 4),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          validator: validator,
          onChanged: onChanged,
          autovalidateMode:autovalidateMode?? AutovalidateMode.onUnfocus,
        ),
      ],
    );
  }
}
