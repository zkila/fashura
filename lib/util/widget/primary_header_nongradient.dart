import 'package:fashura/util/colors.dart';
import 'package:fashura/util/curved_edges_widget.dart';
import 'package:fashura/util/widget/primary_header_container.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainerNonGradient extends StatelessWidget {
  const TPrimaryHeaderContainerNonGradient({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurveEdgeWidget(
      child: Container(
        decoration: const BoxDecoration(color: TColors.primary),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: 250,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.2),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.2),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
