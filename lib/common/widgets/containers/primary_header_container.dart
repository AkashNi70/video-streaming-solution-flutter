import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../custom_shapes/curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class AppPrimaryHeaderContainer extends StatelessWidget {
  const AppPrimaryHeaderContainer({super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCurvedEdgesWidget(
      child: Container(
        color: AppColors.primary,
        child: Stack(
          children: [
            Positioned(top: -100, right: -100 , child: AppCircularContainer(backgroundColor: AppColors.textWhite.withOpacity(0.15),)),
            Positioned(top: -90, left: -80 , child: AppCircularContainer(backgroundColor: AppColors.textWhite.withOpacity(0.15),)),
            Positioned(top: 20, left: -100 , child: AppCircularContainer(height: 180,width: 180 ,backgroundColor: AppColors.textWhite.withOpacity(0.15),)),
            child,
          ],
        ),
      ),
    );
  }
}
