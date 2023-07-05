import 'package:flutter/material.dart';
import 'package:koobeam/modules/list_users/presentation/pages/users_widgets/disable_wrapper.dart';

class ButtonPrimary extends StatefulWidget {
  const ButtonPrimary({
    Key? key,
    required this.isActive,
    required this.onPressed,
    required this.width,
    required this.height,
    this.color,
    this.text,
    this.borderRadius,
    this.textStyle,
    this.border,
    this.icon,
    this.gradient,
  }) : super(key: key);

  final bool isActive;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final String? text;
  final Color? color;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;
  final Border? border;
  final Widget? icon;
  final Gradient? gradient;

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return DisableWrapper(
      disable: !widget.isActive,
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
              gradient: widget.gradient,
              color: widget.color ?? Colors.blue,
              border: widget.border),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.icon ?? Container(),
                  widget.icon != null
                      ? const SizedBox(
                          width: 10.0,
                        )
                      : Container(),
                  Text(
                    widget.text ?? 'Continuar',
                    textAlign: TextAlign.center,
                    style: widget.textStyle ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
