import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leaf_net_app/core/color_manager.dart';
import 'package:leaf_net_app/core/strings_manager.dart';


var _borderTextFiled = ({Color color = ColorManager.blackColor}) =>
    OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: color, width: 1.sp));

class AppTextField extends StatefulWidget {
  AppTextField(
      {Key? key,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.iconData,
      this.hintText,
      this.obscureText = false,
      this.suffixIcon = false,
      this.validator,
      this.onChanged,
      this.onTap,
      this.autofocus = false,
      this.readOnly = false,
      this.isMultiLine = false,
      this.maxLine = 1,
      this.minLine = 1,
      // this.hintColor = ColorManager.hintTextColor,
      // this.textColor = ColorManager.blackColor,
      this.filteringTextFormatterList,
      this.iconDataImage})
      : super(key: key);

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? iconData;
  final String? iconDataImage;
  final String? hintText;

  // final Color? hintColor;
  // final Color? textColor;
  final bool suffixIcon;
  final bool autofocus;
  final bool readOnly;
  bool obscureText;
  bool isMultiLine;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final int? maxLine;
  final int? minLine;
  final List<FilteringTextInputFormatter>? filteringTextFormatterList;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  void showPassword() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      focusNode: _focusNode,
      onTapOutside: (v) {
        _focusNode.unfocus();
      },
      inputFormatters: widget.filteringTextFormatterList,
      maxLines: widget.maxLine,
      minLines: widget.minLine,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      validator: widget.validator ??
          (String? val) {
            if (val!.trim().isEmpty) return StringsManager.requiredFieldText;
            return null;
          },
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      cursorColor: ColorManager.primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.grayColor.withOpacity(.25),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h
        ),
        focusedBorder: _borderTextFiled(color: ColorManager.primaryColor),
        border: _borderTextFiled(color: Colors.transparent
        ),
        enabledBorder: _borderTextFiled(color: Colors.transparent),
        errorBorder: _borderTextFiled(color: ColorManager.errorColor),
        focusedErrorBorder: _borderTextFiled(color: ColorManager.errorColor),
        // iconColor: ColorManager.grayColor,
        hintText:  widget.hintText,

        hintStyle: TextStyle(
          color: ColorManager.grayColor
        ),
        prefixIcon: Icon(widget.iconData),
        errorMaxLines: 2,
        suffixIcon: widget.suffixIcon
            ? IconButton(
                onPressed: () {
                  showPassword();
                },
                icon: Icon(
                  !widget.obscureText
                      ? Icons.remove_red_eye
                      : Icons.visibility_off_sharp,
                  // color: ColorManager.hintTextColor,
                ))
            : null,
      ),
    );
  }
}
