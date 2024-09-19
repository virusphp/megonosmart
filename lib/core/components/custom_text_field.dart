import 'package:flutter/material.dart';
import 'package:megonopos/core/constants/colors.dart';

import 'spaces.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool showLabel;
  final bool obscureText;
  final bool suffixIcon;
  final VoidCallback? onPressed;
  // final bool isObscure;
  // final bool hasSuffix;
  

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.showLabel = true,
    this.obscureText = false,
    this.suffixIcon = false,
    this.onPressed,
    // this.isObscure = false,
    // this.hasSuffix = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SpaceHeight(12.0),
        ],
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            suffixIcon: suffixIcon
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.darkYellow,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: label,
          ),
        ),
      ],
    );
  }
}
