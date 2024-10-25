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
              MaterialPageRoute(builder: (context) => DetailScreen()),
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
        child: Container(
          height: 1400,
          child: const Center(
            child: Column(
              children: const [
                CategoryFilter(),
                Expanded(
                    child:
                        FilteredContent()), // Filtered content below categories
              ],
            ),
          ),
        ),
      ),
    );
  }
}
