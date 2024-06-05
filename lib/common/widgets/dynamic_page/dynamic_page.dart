import 'package:flutter/material.dart';
import 'package:ottui/common/widgets/appbar/appbar.dart';

class DynamicPage extends StatelessWidget {
  const DynamicPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: Text(title), showBackArrow: true,),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 25
          ),
        ),
      ),
    );
  }
}
