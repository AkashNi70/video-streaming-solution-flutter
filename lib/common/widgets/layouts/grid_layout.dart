import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class AppGridLayout extends StatelessWidget {
  const AppGridLayout({
    super.key, required this.itemCount, this.mainAxisExtent = 288, required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: AppSizes.gridChildAspectRatio,
        crossAxisSpacing: AppSizes.gridCrossAxisSpacing,
        mainAxisSpacing: AppSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,

    );
  }
}
