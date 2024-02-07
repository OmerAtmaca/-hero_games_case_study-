import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import '../utils/dimens.dart';

class RoundedCtaButton extends StatelessWidget {
  final String title;
  final VoidCallback onClicked;
  final bool isActive;
  final String? icon;
  final Color? textColor;
  final Color? color;
  final Color? disabledColor;
  final TextStyle? textStyle;
  final BoxDecoration? boxDecoration;
  final BorderRadius? borderRadius;
  final Border? border;
  final double height;
  final double? width;
  final double verticalPadding;
  final double horizontalPadding;
  final double? textSize;
  final FontWeight? fontWeight;
  final bool isSticky;
  final double iconHeight;
  final double iconWidth;

  const RoundedCtaButton({
    required this.title,
    required this.onClicked,
    super.key,
    this.iconHeight = 15,
    this.iconWidth = 15,
    this.isActive = true,
    this.textColor = Colors.white,
    this.textSize = 14,
    this.color = CustomColors.dazzledBlue,
    this.disabledColor = CustomColors.ziggurat,
    this.height = Dimens.ctaButtonHeight,
    this.verticalPadding = 0,
    this.horizontalPadding = 20,
    this.fontWeight = FontWeight.w700,
    this.icon,
    this.width,
    this.textStyle,
    this.boxDecoration,
    this.borderRadius,
    this.border,
    this.isSticky = false,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: getPadding(),
        decoration: BoxDecoration(
          color: isSticky ? Colors.white : Colors.transparent,
          boxShadow: isSticky
              ? [
                  BoxShadow(
                    offset: const Offset(0, -15),
                    blurRadius: 15,
                    color: Colors.black.withOpacity(0.07),
                  )
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onClicked,
            borderRadius:
                borderRadius ?? BorderRadius.all(Radius.circular(height / 2)),
            child: Ink(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              height: height,
              width: width,
              decoration: boxDecoration ??
                  BoxDecoration(
                    color: isActive ? color : disabledColor,
                    borderRadius: borderRadius ??
                        BorderRadius.all(Radius.circular(height / 2)),
                    border: border ?? const Border(),
                  ),
              child: Stack(
                children: [
                  Align(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle ??
                          TextStyle(
                            color: textColor,
                            fontWeight: fontWeight,
                            fontSize: textSize,
                          ),
                    ),
                  ),
                  if (icon != null && icon != "")
                    Align(
                      alignment: Alignment.centerRight,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          icon!,
                          width: iconWidth,
                          height: iconHeight,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    )
                  else
                    const SizedBox()
                ],
              ),
            ),
          ),
        ),
      );

  EdgeInsets getPadding() {
    if (isSticky) {
      return const EdgeInsets.fromLTRB(20, 14, 20, 14);
    } else {
      return const EdgeInsets.fromLTRB(0, 0, 0, 0);
    }
  }
}
