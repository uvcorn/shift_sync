import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Color iconColor;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? togglePassword;
  final double iconSize;
  final int maxLine;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool isReadOnly;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.icon,
    this.validator,
    this.isPassword = false,
    this.obscureText = false,
    this.togglePassword,
    this.iconColor = AppColors.mediumGrey,
    this.iconSize = 20,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.maxLine = 1,
    this.onChanged,
    this.focusNode,
    this.isReadOnly = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    // Only dispose if we created them (not passed from parent)
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      obscureText: widget.isPassword && widget.obscureText,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      validator: widget.validator,
      readOnly: widget.isReadOnly,
      maxLines: widget.maxLine,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        prefixIcon: widget.icon != null
            ? Icon(widget.icon, color: widget.iconColor)
            : null,
        // ✅ only show suffix icon when needed
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.black,
                  size: widget.iconSize.r,
                ),
                onPressed: widget.togglePassword,
              )
            : null,
        // ✅ remove suffix space when no icon
        suffixIconConstraints: widget.isPassword
            ? null
            : const BoxConstraints(minWidth: 0, minHeight: 0),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.mediumGrey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.mediumGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.red, width: 2),
        ),
        errorStyle: TextStyle(color: AppColors.red, fontSize: 11.sp),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
    );
  }
}
