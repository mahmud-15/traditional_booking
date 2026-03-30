import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';
import '../text/common_text.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixText,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor = AppColors.inputColor,
    this.labelTextColor = AppColors.textBlack,
    this.hintTextColor = AppColors.textGrey,
    this.textColor = AppColors.textBlack,
    this.borderColor = AppColors.inputColor,
    this.paddingHorizontal = 16,
    this.paddingVertical = 14,
    this.borderRadius = 4,
    this.mexLength,
    this.isPassword = false,
    this.readOnly = false,
    this.onSubmitted,
    this.onTap,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
  });

  final String? hintText;
  final String? labelText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? textColor;
  final Color borderColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final int? mexLength;
  final bool isPassword;
  final bool readOnly;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int? minLines;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUnfocus,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      obscureText: widget.isPassword ? obscureText : false,
      textInputAction: widget.textInputAction,
      maxLength: widget.mexLength,
      cursorColor: AppColors.white,
      inputFormatters: widget.inputFormatters,
      style: TextStyle(fontSize: 14, color: widget.textColor),
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      validator: widget.validator,
      decoration: InputDecoration(
        errorMaxLines: 2,
        filled: true,
        prefixIcon: widget.prefixIcon,
        fillColor: widget.fillColor,
        counterText: "",
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.paddingHorizontal.w,
          vertical: widget.paddingVertical.h,
        ),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        disabledBorder: _buildBorder(),
        errorBorder: _buildBorder(),
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: GoogleFonts.roboto(
          fontSize: 14.sp,
          color: widget.hintTextColor,
        ),
        labelStyle: GoogleFonts.roboto(
          fontSize: 14.sp,
          color: widget.labelTextColor,
        ),
        prefix: (widget.prefixText != null && widget.prefixText!.isNotEmpty)
            ? CommonText(text: widget.prefixText!, fontWeight: FontWeight.w400)
            : null,
        suffixIcon: widget.isPassword
            ? _buildPasswordSuffixIcon()
            : widget.suffixIcon,
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius.r),
      borderSide: BorderSide(color: widget.borderColor),
    );
  }

  Widget _buildPasswordSuffixIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 10.w),
        child: Icon(
          obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          size: 20.sp,
          color: AppColors.textBlack,
        ),
      ),
    );
  }
}
