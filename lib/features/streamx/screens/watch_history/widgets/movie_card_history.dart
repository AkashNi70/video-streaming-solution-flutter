import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class MovieCardHistory extends StatelessWidget {
  const MovieCardHistory({super.key,required this.itemCount, this.mainAxisExtent = 0, required this.itemBuilder,
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
        crossAxisCount: 1,
        childAspectRatio: 1.2,
        mainAxisSpacing: AppSizes.xs,
      ),
      itemBuilder: itemBuilder,

    );
  }
}
