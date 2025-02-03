import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget leftWidget, centerWidget, rightWidget;
  final double height;

  const CustomAppBar({
    super.key,
    required this.leftWidget,
    required this.centerWidget,
    required this.rightWidget,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ParabolicClipper(),
          child: Container(
            height: height,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/header_background.png"),
                fit: BoxFit.cover,
              ),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Row(
            children: [
              Expanded(child: leftWidget),
              Expanded(flex: 2, child: Center(child: centerWidget)),
              Expanded(child: rightWidget),
            ],
          ),
        ),
      ],
    );
  }
}

class ParabolicClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height - 40)
      ..quadraticBezierTo(size.width / 2, size.height + 20, size.width, size.height - 40)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
