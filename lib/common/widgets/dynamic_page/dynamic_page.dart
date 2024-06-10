import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ottui/common/widgets/appbar/appbar.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({super.key, required this.title, required this.dataUrl});

  final String title;
  final String? dataUrl;

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://oxoo.spagreen.net/demo/php/v13/terms/'),
      );
  }

  @override
  Widget build(BuildContext context) {

    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        flexibleSpaceWidget: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: Text(widget.title),
        backgroundColor: dark ? AppColors.black.withAlpha(300) : AppColors.white.withAlpha(300),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: AppSizes.appBarHeight + MediaQuery.of(context).padding.top,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
