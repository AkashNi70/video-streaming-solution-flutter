import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> imgList = [
      {
        'url':
            'https://videoportal.viavilab.com/upload/images/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg',
        'name': 'Kung fu panda 3'
      },
      {
        'url':
            'https://videoportal.viavilab.com/upload/images/nCnLI0MP8BkKK50WfGUiTTmYqIG.jpg',
        'name': 'Mountain View'
      },
      {
        'url':
            'https://videoportal.viavilab.com/upload/images/zDZowwb9GZGEctAu2PCpjiPQAMM.jpg',
        'name': 'City Lights'
      },
      {
        'url':
            'https://videoportal.viavilab.com/upload/images/iPzriQUwDNTx7sOJJGi9jXyE7WL.jpg',
        'name': 'Forest Path'
      },
      {
        'url':
            'https://videoportal.viavilab.com/upload/images/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
        'name': 'Ocean Breeze'
      },
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Other widgets
        Stack(
          children: [
            CarouselSlider(
              items: imgList.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.network(item['url']!,
                            fit: BoxFit.cover, width: double.infinity),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 350.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: false,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                pauseAutoPlayOnTouch: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  // Optional callback when the page changes
                  // You can use it to update any additional UI components
                },
              ),
            ),
          ],
        ),
        // Other widgets
      ],
    );
  }
}
