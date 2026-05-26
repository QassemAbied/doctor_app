import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final String? heroTag;
  final bool enableHero;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
    this.heroTag,
    this.enableHero = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,

      memCacheWidth: 800,
      memCacheHeight: 800,

      fadeInDuration: const Duration(milliseconds: 250),

      placeholder: (context, url) =>
          _ShimmerBox(width: width, height: height, borderRadius: borderRadius),

      errorWidget: (context, url, error) => Expanded(
        child: _ErrorWidget(
          onRetry: () {
            (context as Element).markNeedsBuild();
          },
        ),
      ),
    );

    image = ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      child: image,
    );

    if (enableHero && heroTag != null) {
      image = Hero(tag: heroTag!, child: image);
    }

    return image;
  }
}

class _ShimmerBox extends StatefulWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const _ShimmerBox({this.width, this.height, this.borderRadius});

  @override
  State<_ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<_ShimmerBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.zero,
            gradient: LinearGradient(
              begin: Alignment(-1 + _controller.value * 2, 0),
              end: Alignment(1 + _controller.value * 2, 0),
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const _ErrorWidget({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Center(
        child: GestureDetector(
          onTap: onRetry,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.refresh, size: 28),
              SizedBox(height: 6),
              Text("Tap to retry"),
            ],
          ),
        ),
      ),
    );
  }
}
