// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_constants.dart';
import '../constants/color_constants.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final String? hintText;
  final String title;
  final bool? isFilterScreen;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onClick;
  final Function(String)? onFieldSubmitted;
  final double titleSpacing;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextStyle? titleTextStyle;
  final bool noHeight;
  final bool readOnly;
  final TextFormFieldType? textFormFieldType;
  final Border? border;
  final bool bottomPadding;
  final double borderRadius;
  final TextStyle? style;
  final bool multiLine;
  final TextStyle? hintTextStyle;
  const CustomTextFormField({
    super.key,
    this.title = '',
    this.border,
    this.hintText,
    this.isFilterScreen = false,
    this.maxLines = 1,
    this.hintTextStyle,
    this.borderColor,
    this.focusBorderColor,
    this.onClick,
    this.style,
    this.onFieldSubmitted,
    this.bottomPadding = true,
    this.hintFontSize,
    this.controller,
    this.noHeight = false,
    this.readOnly = false,
    this.backgroundColor,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.textFormFieldType = TextFormFieldType.text,
    this.titleSpacing = 2,
    this.titleTextStyle,
    this.fontSize,
    this.fontWeight,
    this.textInputType,
    this.multiLine = false,
    this.borderRadius = 10,
    this.inputFormatters,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool isShowText=true;

  @override
  void dispose() {
  _focusNode.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13.0,top: 13),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
              children: [
                if (widget.title.isNotEmpty) SizedBox(height: widget.titleSpacing),
                GestureDetector(
                    onTap: widget.onClick,
                    child: TextFormField(
                      onFieldSubmitted: widget.onFieldSubmitted,
                      maxLines: widget.maxLines,
                      controller: widget.controller,
                      focusNode: _focusNode,
                      onChanged: widget.onChanged,
                      style: widget.style ?? AppConstants.heading2.copyWith(color: Colors.black),
                      validator: widget.title.endsWith("*") && widget.validator == null
                          ? (value) {
                        if (value == null || value.isEmpty) {
                          _focusNode.requestFocus();
                          return "Please Enter Value";
                        } if(widget.textFormFieldType==TextFormFieldType.email){
                          final emailRegex = RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?)*$"
                          );
                          if (!emailRegex.hasMatch(value)) {
                            _focusNode.requestFocus();
                            return "Please Enter Email Address"; // Prompt for invalid email
                          }
                        }
                        return null;
                      } : widget.validator,
                      obscureText:widget.textFormFieldType==TextFormFieldType.securedPassword? isShowText : widget.obscureText,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: widget.textInputType,
                      inputFormatters: widget.inputFormatters,
                      readOnly: widget.readOnly,
                      decoration: InputDecoration(
                        filled: widget.backgroundColor != null ? true : false,
                        fillColor: widget.backgroundColor ?? Colors.transparent,
                        contentPadding: const EdgeInsets.all(15),
                        isDense: true,
                        prefixIcon: widget.prefixIcon,
                        suffixIcon: widget.textFormFieldType==TextFormFieldType.securedPassword
                            ?GestureDetector(onTap: (){
                          setState(() {
                            isShowText=!isShowText;
                          });
                        }, child: Icon(isShowText? Icons.visibility_off:Icons.remove_red_eye,color: ColorConstants.black,size: 20,))
                            :widget.suffixIcon == null
                            ? null
                            : GestureDetector(onTap: widget.onClick, child: widget.suffixIcon),
                        hintText: widget.hintText,
                        hintStyle: widget.hintTextStyle ?? AppConstants.heading2.copyWith(color: Colors.black.withOpacity(0.4)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.borderRadius),
                          borderSide: const BorderSide(
                            width: 1,
                            color: ColorConstants.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.focusBorderColor ?? ColorConstants.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.borderColor ?? ColorConstants.grey,
                          ),
                        ),
                      ),
                    )),
                if (widget.title.isNotEmpty)
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.only(bottom:43,left: 15,right: 15),
                    child: Text(
                        widget.title,
                        style: widget.titleTextStyle ??
                            AppConstants.heading2.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w300
                            )
                    ),
                  ),
              ],
            ),
    );
  }
}

enum TextFormFieldType{
  text,
  email,
  germanNumber,
  password,
  securedPassword,
}
