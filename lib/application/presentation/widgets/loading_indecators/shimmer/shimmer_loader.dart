import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoaderTile extends StatelessWidget {
  const ShimmerLoaderTile({
    super.key,
    this.height,
    this.width,
    this.baseColor,
    this.padding = const EdgeInsets.all(0),
    this.boxDecoration = const BoxDecoration(
      color: klightgrey,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    this.highlightColor,
  });

  final double? width;
  final double? height;
  final Color? baseColor;
  final Color? highlightColor;
  final BoxDecoration? boxDecoration;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor:
            baseColor ??
            Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        highlightColor: baseColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: klightgrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    super.key,
    required this.itemCount,
    required this.height,
    required this.width,
    this.highlightColor,
    this.baseColor,
    this.seprator = const SizedBox(),
    this.scrollDirection = Axis.vertical,
  });

  final int itemCount;
  final double height;
  final double width;
  final Axis scrollDirection;
  final Widget seprator;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => seprator,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor:
              baseColor ??
              Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          highlightColor:
              baseColor ?? Theme.of(context).scaffoldBackgroundColor,
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              color: klightgrey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        );
      },
    );
  }
}
