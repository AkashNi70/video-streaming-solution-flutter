import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/features/streamx/screens/movies_details/movie_detail.dart';

class MovieCardVerticle extends StatelessWidget {
  final String title;
  final String posterUrl;

  const MovieCardVerticle({
    required this.title,
    required this.posterUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const MovieDetailScreen()),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.network(
                posterUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
