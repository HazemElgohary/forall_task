import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DefaultFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final FocusNode? focusNode;
  final bool isPassword;
  final bool error;
  final bool enable;
  final Color? background;
  final bool isNumber;
  final bool onlyEn;
  final String? initialValue;
  final bool show;
  final int? maxLength;
  final bool isCreateShop;
  final VoidCallback? onChangeVision;
  final int? maxLines;
  final ValueChanged<String>? onChange;

  const DefaultFormField({
    Key? key,
    this.controller,
    required this.label,
    this.onChangeVision,
    this.focusNode,
    this.onChange,
    this.maxLines,
    this.background,
    this.error = false,
    this.isNumber = false,
    this.onlyEn = false,
    this.enable = true,
    this.show = false,
    this.maxLength,
    this.isCreateShop = false,
    this.isPassword = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            enabled: enable,
            focusNode: focusNode,
            controller: controller,
            onChanged: onChange,
            initialValue: initialValue,
            maxLines: maxLines ?? 1,
            maxLength: maxLength,
            obscureText: show,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumber
          ? [
        FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
      ]
          : [],
            decoration: InputDecoration(
              fillColor: background,
              filled: background != null ? true : false,

              hintText: label,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Color(0xFFCDCCCC),
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Color(0xFFCDCCCC),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Color(0xFFCDCCCC),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Color(0xFFCDCCCC),
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              suffixIcon: isPassword
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 14,
                      ),
                      child: IconButton(
                        onPressed: onChangeVision,
                        icon: show
                            ? const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.grey,
                              ),
                      ),
                    )
                  : null,
            ),
          );
  }
}
