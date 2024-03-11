import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String labelText;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final bool obscureText;

  const PrimaryTextField({
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: context.theme.textTheme.bodyMedium14.copyWith(
              color: context.theme.colors.gray2,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            cursorColor: context.theme.colors.text4,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            style: context.theme.textTheme.bodyMedium14,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              suffixIconConstraints: suffixIconConstraints,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: context.theme.colors.white,
                ),
              ),
              focusColor: context.theme.colors.primary,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: context.theme.colors.gray2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: context.theme.colors.primary,
                ),
              ),
              hintStyle: context.theme.textTheme.bodyMedium14.copyWith(
                color: context.theme.colors.gray1,
              ),
              hintText: hintText,
            ),
          ),
        ],
      );
}
