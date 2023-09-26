import 'package:flutter/widgets.dart';

class DecoratedSizedBox extends StatelessWidget {
  const DecoratedSizedBox({
    super.key,
    this.width,
    this.height,
    required this.decoration,
    this.margin,
    this.child,
  });

  final double? width;
  final double? height;
  final BoxDecoration decoration;
  final EdgeInsets? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: width ?? double.infinity,
        child: DecoratedBox(
          decoration: decoration,
          child: child,
        ),
      ),
    );
  }
}
