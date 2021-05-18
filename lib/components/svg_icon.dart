import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const assetPathPrefix = "assets/";

SvgPicture getIcon({
  required String assetName,
  double? width,
  double? height,
}) {
  return SvgPicture.asset(
    assetName,
    width: width,
    height: height,
  );
}

class SvgIcon extends StatelessWidget {
  final String svgName;
  final double? width;
  final double? height;

  const SvgIcon({
    Key? key,
    required this.svgName,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getIcon(
      assetName: assetPathPrefix + svgName.trim() + ".svg",
      width: width,
      height: height,
    );
  }
}
