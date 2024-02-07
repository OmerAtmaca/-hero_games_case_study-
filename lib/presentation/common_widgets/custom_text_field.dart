import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/custom_colors.dart';

class CustomTextField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final String? hint;
  final String? text;
  final String? preText;
  final String label;
  final Function? onChanged;
  final Function? isValid;
  final Function? onFocusChanged;
  final Function(String text)? onSubmitted;
  final bool isObscured;
  final bool multiLine;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool isActive;
  final bool errorText;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.validator,
    this.hint,
    this.text,
    this.onChanged,
    this.isValid,
    this.onFocusChanged,
    this.errorText = false,
    this.isActive = true,
    required this.label,
    this.isObscured = false,
    this.multiLine = false,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.maxLength = 200,
    this.preText,
    this.inputFormatters,
    this.onSubmitted,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;
  late final FocusNode focusNode;
  String? errorText;

  @override
  void initState() {
    _controller = TextEditingController();
    if (widget.preText != null) {
      _controller.text = widget.preText!;
    } else if (widget.controller != null) {
      _controller.text = widget.controller!.text;
    }
    widget.isValid?.call(widget.controller?.text.isNotEmpty ?? true);
    focusNode = FocusNode();
    focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: getBorderColor(), width: getBorderWidth()),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: TextFormField(
              controller: _controller,
              focusNode: focusNode,
              maxLines: widget.multiLine ? 10 : 1,
              enabled: widget.isActive,
              maxLength: widget.maxLength,
              minLines: widget.multiLine ? 3 : 1,
              inputFormatters: widget.inputFormatters ?? [],
              onTap: () {
                focusNode.requestFocus();
                if (widget.onFocusChanged != null) {
                  widget.onFocusChanged?.call(true);
                }
              },
              cursorColor: CustomColors.mirage,
              textInputAction: widget.textInputAction,
              obscureText: widget.isObscured,
              style: TextStyle(
                color: getTextColor(),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              keyboardType: widget.textInputType,
              onChanged: (value) async {
                setState(() {
                  if (widget.validator != null) {
                    errorText = widget.validator!(value);
                  }
                  widget.onChanged?.call(value);
                });
                widget.isValid?.call(errorText == null);

                final String text = value;
                if (widget.preText != null &&
                    text.length <= widget.preText!.length) {
                  _controller.text = widget.preText!;
                  await Future.delayed(const Duration(microseconds: 1));
                }
                _controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: _controller.text.length));
              },
              onFieldSubmitted: widget.onSubmitted,
              decoration: InputDecoration(
                counterText: "",
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isCollapsed: widget.label == "",
                labelText: widget.label,
                labelStyle: TextStyle(
                  color: CustomColors.heather,
                  fontWeight:
                      focusNode.hasFocus ? FontWeight.w400 : FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Visibility(
            visible: errorText?.isNotEmpty == true,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                errorText ?? "",
                style: const TextStyle(
                    color: CustomColors.mojo,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      );

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    if (widget.text != null &&
        oldWidget.text != widget.text &&
        widget.preText != null) {
      _controller.text = widget.text!;
    }
    if (widget.controller != oldWidget.controller) {
      _controller.text = widget.controller!.text;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    if (widget.text != null) _controller.text = widget.text!;
    // setState(() {});
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    focusNode.dispose();
    _controller.dispose();
    if (widget.onFocusChanged != null) {
      widget.onFocusChanged?.call(false);
    }
    super.dispose();
  }

  Color getBorderColor() {
    if (errorText != null || widget.errorText) {
      return CustomColors.mojo;
    } else if (focusNode.hasFocus) {
      return CustomColors.matisse;
    } else {
      return CustomColors.heather.withOpacity(0.7);
    }
  }

  double getBorderWidth() {
    if (focusNode.hasFocus || errorText != null || widget.errorText) {
      return 1.0;
    } else {
      return 1.0;
    }
  }

  Color getTextColor() {
    if (widget.isActive) {
      return CustomColors.nileBlue;
    } else {
      return CustomColors.heather;
    }
  }
}
