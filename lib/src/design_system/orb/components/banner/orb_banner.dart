import 'package:anipod/src/core/utils/extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../orb.dart';

class OrbBanner extends StatefulWidget {
  final List<String> urls;
  final Function(int index) onTap;
  final Function(int index) onPageChanged;
  final double? width;
  final double? height;

  const OrbBanner({
    super.key,
    required this.urls,
    required this.onTap,
    required this.onPageChanged,
    this.width,
    this.height,
  });

  @override
  State<OrbBanner> createState() => _OrbBannerState();
}

class _OrbBannerState extends State<OrbBanner> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width ?? MediaQuery.of(context).size.width,
          height: widget.height ?? MediaQuery.of(context).size.width * (3 / 4),
          color: context.palette.outline,
          child: CarouselSlider(
            carouselController: _carouselController,
            items: widget.urls.map(
              (e) {
                return InkWell(
                  onTap: () => widget.onTap(widget.urls.indexOf(e)),
                  child: Image.network(
                    e,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: OrbCircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return OrbIcon(
                        Icons.image_not_supported,
                        size: OrbIconSize.large,
                        color: context.palette.error,
                      );
                    },
                  ),
                );
              },
            ).toList(),
            options: CarouselOptions(
              aspectRatio: 1 / 1,
              clipBehavior: Clip.hardEdge,
              enlargeFactor: 0,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
                widget.onPageChanged(index);
              },
            ),
          ),
        ),
        // dot indicator
        Positioned(
          bottom: 32,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Row의 크기를 자식 요소에 맞춤
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.urls.length, (index) {
                  return InkWell(
                    onTap: () {
                      _carouselController.animateToPage(index);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? context.palette.primary
                            : context.palette.surfaceBright,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
