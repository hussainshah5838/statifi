import 'package:flutter/material.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? postfixIcon;
  final String? postfixImage;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool hasError;
  final Color? fieldColor;
  final int? maxLine;
  final Color? iconColor;
  final Color? hintColor;
  final Color? containerColor;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.postfixIcon,
    this.postfixImage,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.hasError = false,
    this.fieldColor,
    this.maxLine,
    this.iconColor,
    this.hintColor,
    this.containerColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine ?? 1,
      controller: widget.controller,
      obscureText: _obscure,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      validator: widget.validator,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      style: AppTextStyles.body,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.body.copyWith(
          color: widget.hintColor ?? AppColors.textPrimary,
        ),
        filled: true,

        fillColor: widget.hasError
            ? Colors.red.withOpacity(0.1)
            : widget.containerColor ?? AppColors.tColor1,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        suffixIcon: _buildSuffixIcon(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: widget.hasError
              ? BorderSide(color: Colors.red.withOpacity(0.3), width: 1.5)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: widget.hasError
              ? BorderSide(color: Colors.red.withOpacity(0.5), width: 1.5)
              : BorderSide.none,
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(
          _obscure ? Icons.visibility_off : Icons.visibility,
          color: Colors.white.withOpacity(0.3),
          size: 20,
        ),
        onPressed: () => setState(() => _obscure = !_obscure),
      );
    } else if (widget.postfixImage != null) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(
          widget.postfixImage!,
          width: 10,
          height: 3,
          color:
              widget.postfixImage != null &&
                  widget.postfixImage!.contains('check')
              ? AppColors.btnColor1
              : Colors.white.withOpacity(0.3),
        ),
      );
    } else if (widget.postfixIcon != null) {
      return Icon(
        widget.postfixIcon,
        color: widget.iconColor ?? Colors.white.withOpacity(0.3),
      );
    }
    return null;
  }
}
