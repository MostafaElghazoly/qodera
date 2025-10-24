import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppLoading {
  static Widget circularProgressIndicator({Color? color}) {
    return Center(
      child: Transform.scale(
        scale: 0.6,
        child: CircularProgressIndicator(color: color ?? AppColors.primary, strokeWidth: 6),
      ),
    );
  }

  static Widget overlayLoading({Color backgroundColor = Colors.black54, Color? loaderColor}) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: backgroundColor,
            child: Center(child: CircularProgressIndicator(strokeWidth: 4, color: loaderColor ?? AppColors.primary)),
          ),
        ),
      ],
    );
  }

  static Widget shimmer({
    double? width,
    double? height,
    Axis axis = Axis.vertical,
    double padding = 0,
    List<ShimmerChild> children = const [],
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 100,
      child: ShimmerEffect(
        width: width ?? double.infinity,
        height: height ?? 100,
        axis: axis,
        padding: padding,
        children: children,
      ),
    );
  }
}

class ShimmerEffect extends StatefulWidget {
  final double width;
  final double height;
  final Axis axis;
  final double padding;
  final List<ShimmerChild> children;

  const ShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.axis = Axis.vertical,
    this.padding = 0,
    required this.children,
  });

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      lowerBound: 0.3,
      upperBound: 1.0,
      animationBehavior: AnimationBehavior.preserve,
    )..repeat(reverse: true, period: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Opacity(
          opacity: 0.5 + 0.5 * sin(_controller!.value * pi),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: const Alignment(-1.0, -0.5),
                end: const Alignment(2.0, 0.5),
                stops: const [0.0, 1.0, 2.0],
                colors: [Colors.grey[200]!, Colors.grey[300]!, Colors.grey[600]!],
              ),
            ),
            child: _buildShimmerChildren(),
          ),
        );
      },
    );
  }

  Widget _buildShimmerChildren() {
    if (widget.children.isEmpty) {
      return const SizedBox();
    }

    if (widget.axis == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            widget.children.map((shimmerChild) {
              return Padding(
                padding: EdgeInsets.only(bottom: widget.padding),
                child: ShimmerChildWidget(width: shimmerChild.width, height: shimmerChild.height),
              );
            }).toList(),
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            widget.children.map((shimmerChild) {
              return Padding(
                padding: EdgeInsets.only(right: widget.padding),
                child: ShimmerChildWidget(width: shimmerChild.width, height: shimmerChild.height),
              );
            }).toList(),
      );
    }
  }
}

class ShimmerChild {
  final double width;
  final double height;

  ShimmerChild({required this.width, required this.height});
}

class ShimmerChildWidget extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerChildWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: const Alignment(-1.0, -0.5),
          end: const Alignment(2.0, 0.5),
          stops: const [0.0, 1.0, 2.0],
          colors: [Colors.grey[300]!, Colors.grey[400]!, Colors.grey[600]!],
        ),
      ),
    );
  }
}
