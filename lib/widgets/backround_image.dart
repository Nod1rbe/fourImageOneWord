// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class BackroundImage extends StatefulWidget {
  final Widget child;
  const BackroundImage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<BackroundImage> createState() => _BackroundImageState();
}

class _BackroundImageState extends State<BackroundImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const ExactAssetImage('assets/weather/outm.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.xor,
          ),
        )),
        child: ClipRRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
              color: Colors.grey.withOpacity(0.1), child: widget.child),
        )));
  }
}
