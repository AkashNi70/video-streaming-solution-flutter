import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/features/streamx/screens/movies_details/movie_detail.dart';

class MovieCardHorizontal extends StatelessWidget {
  const MovieCardHorizontal({super.key, required this.posterUrl});

  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const MovieDetailScreen()),
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
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
