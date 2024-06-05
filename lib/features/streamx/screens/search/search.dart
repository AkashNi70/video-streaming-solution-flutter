import 'package:flutter/material.dart';
import 'package:ottui/common/widgets/layouts/grid_layout.dart';
import 'package:ottui/common/widgets/movies/movie_card_verticle.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, String>> _allMovies = [];
  final List<Map<String, String>> _displayedMovies = [];
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  bool _isLoading = false;
  String _query = '';
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _fetchMovies();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        _fetchMoreMovies();
      }
    });

    _searchController.addListener(() {
      setState(() {
        _query = _searchController.text;
        _filterMovies();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchMovies() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate network request
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      final newMovies = List.generate(
        20,
            (index) => {
          'title': 'Movie Title ${_allMovies.length + index}',
          'posterUrl': 'https://videoportal.viavilab.com/upload/images/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg',
        },
      );
      _allMovies.addAll(newMovies);
      _filterMovies();
      _isLoading = false;
    });
  }

  Future<void> _fetchMoreMovies() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _currentPage++;
    });

    // Simulate network request
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      final newMovies = List.generate(
        20,
            (index) => {
          'title': 'Movie Title ${_allMovies.length + index + _currentPage * 20}',
          'posterUrl': 'https://videoportal.viavilab.com/upload/images/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg',
        },
      );
      _allMovies.addAll(newMovies);
      _filterMovies();
      _isLoading = false;
    });
  }

  void _filterMovies() {
    setState(() {
      if (_query.isEmpty) {
        _displayedMovies.clear();
        _displayedMovies.addAll(_allMovies);
      } else {
        _displayedMovies.clear();
        _displayedMovies.addAll(_allMovies.where((movie) => movie['title']!.toLowerCase().contains(_query.toLowerCase())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MainAppBar(
        title: const Center(
          child: Image(
            height: AppSizes.iconLg * 1.4,
            image: AssetImage(AppImages.logo),
          ),
        ),
        backgroundColor: dark
            ? AppColors.black.withAlpha(300)
            : AppColors.white.withAlpha(300),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: AppTexts.search,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: AppGridLayout(
                  itemCount: _displayedMovies.length + (_isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == _displayedMovies.length) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return MovieCardVerticle(
                      title: _displayedMovies[index]['title']!,
                      posterUrl: _displayedMovies[index]['posterUrl']!,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
