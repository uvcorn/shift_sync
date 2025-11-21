import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors/app_colors.dart';
import 'custom_text.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? showCheckbox;
  final bool? value;
  final ValueChanged<bool>? onChanged;

  final String leadingText;
  final TextStyle? leadingTextStyle;
  final String clickableText;
  final TextStyle? clickableTextStyle;
  final VoidCallback? onLinkTap;
  final bool useSpaceBetweenAlignment;
  final bool centerAlignment;
  final double checkboxLabelSpacing;
  final Color? checkboxActiveColor;
  final bool? useUnderline;

  const CustomCheckbox({
    super.key,
    this.showCheckbox = true,
    this.value,
    this.onChanged,
    required this.leadingText,
    this.leadingTextStyle,
    required this.clickableText,
    this.clickableTextStyle,
    this.onLinkTap,
    this.useSpaceBetweenAlignment = false,
    this.centerAlignment = false,
    this.checkboxLabelSpacing = 0.0,
    this.checkboxActiveColor = AppColors.black,
    this.useUnderline = false,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    final MainAxisAlignment rowAlignment = widget.useSpaceBetweenAlignment
        ? MainAxisAlignment.spaceBetween
        : (widget.centerAlignment
              ? MainAxisAlignment.center
              : MainAxisAlignment.start);

    return Row(
      mainAxisAlignment: rowAlignment,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.onChanged != null) {
              widget.onChanged!(!(widget.value ?? false));
            }
          },
          behavior: HitTestBehavior.opaque,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showCheckbox ?? true)
                Transform.translate(
                  offset: Offset(-8.0, 0.0),
                  child: Checkbox(
                    value: widget.value ?? false,
                    onChanged: (newValue) {
                      if (widget.onChanged != null) {
                        widget.onChanged!(newValue!);
                      }
                    },
                    activeColor: widget.checkboxActiveColor,
                    checkColor: AppColors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              SizedBox(width: widget.checkboxLabelSpacing.w),
              Transform.translate(
                offset: const Offset(-8.0, 0.0),
                child: CustomText(
                  text: widget.leadingText,
                  fontSize: widget.leadingTextStyle?.fontSize ?? 14,
                  fontWeight:
                      widget.leadingTextStyle?.fontWeight ?? FontWeight.w400,
                  color: widget.leadingTextStyle?.color ?? Colors.black,
                  fontFamily: widget.leadingTextStyle?.fontFamily,
                ),
              ),
            ],
          ),
        ),

        if (!widget.useSpaceBetweenAlignment && !widget.centerAlignment)
          SizedBox(width: 0.w),

        if (widget.useSpaceBetweenAlignment) const Spacer(),

        GestureDetector(
          onTap: widget.onLinkTap,
          child: CustomText(
            text: widget.clickableText,
            fontSize: widget.clickableTextStyle?.fontSize ?? 14,
            fontWeight:
                widget.clickableTextStyle?.fontWeight ?? FontWeight.w400,
            color: widget.clickableTextStyle?.color ?? Colors.blue,
            fontFamily: widget.clickableTextStyle?.fontFamily,
            decoration: widget.useUnderline!
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
