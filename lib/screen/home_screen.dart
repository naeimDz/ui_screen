import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/providers/theme_provider.dart';
import 'package:flutter_starter_template/screen/components/category_filter.dart';
import 'package:flutter_starter_template/screen/components/filtered_content.dart';
import 'package:flutter_starter_template/screen/detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.sort),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailScreen()),
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(56.0), // Material Design standard height
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: context.locale.languageCode == 'ar'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.06,

                          letterSpacing: -0.5, // Modern typography
                        ),
                  ),
                ),
                const SizedBox(height: 4),
                // Optional subtitle or breadcrumb
              ],
            ),
          ),
        ),
        elevation: 0, // Modern flat design
        backgroundColor: Theme.of(context).primaryColor,
        // Increased from original to make it more pronounced
        shape: RoundedRectangleBorder(
            borderRadius: context.locale.languageCode != 'ar'
                ? const BorderRadius.only(bottomRight: Radius.circular(32))
                : const BorderRadius.only(bottomLeft: Radius.circular(32))),
        clipBehavior: Clip.antiAlias,
        actions: [
          // Search button with ripple effect
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                // Implement search functionality
              },
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.search),
              ),
            ),
          ),
          // Theme toggle with animation
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: IconButton(
                key: ValueKey<bool>(
                    themeProvider.getThemeMode() == ThemeMode.dark),
                icon: Icon(
                  themeProvider.getThemeMode() == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  themeProvider.setThemeMode(
                    themeProvider.getThemeMode() == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            const CategoryFilter(),
            const FilteredContent(), // Filtered content below categories
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Authors to follow',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Show all'),
                    ),
                  ],
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _AuthorChip(
                        name: 'Philip K. Dick',
                        books: '44 books',
                        imageUrl:
                            'https://avatar.iran.liara.run/username?username=naeim+poli',
                      ),
                      SizedBox(width: 8),
                      _AuthorChip(
                        name: 'Ray Bradbury',
                        books: '38 books',
                        imageUrl: 'https://avatar.iran.liara.run/public',
                      ),
                      SizedBox(width: 8),
                      _AuthorChip(
                        name: 'Escanor',
                        books: '38 books',
                        imageUrl:
                            'https://avatar.iran.liara.run/public/job/designer/male',
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AuthorChip extends StatelessWidget {
  final String name;
  final String books;
  final String imageUrl;

  const _AuthorChip({
    required this.name,
    required this.books,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(width: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                children: [
                  const Icon(Icons.book, size: 17),
                  const SizedBox(width: 3),
                  Text(
                    books,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
