import 'package:flutter/material.dart';
import 'package:flutter_starter_template/providers/category_provider.dart';
import 'package:provider/provider.dart';

class FilteredContent extends StatelessWidget {
  const FilteredContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate responsive dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double sectionHeight =
        MediaQuery.of(context).size.height * 0.45; //Dynamic height ratio
    double cardWidth = screenWidth * 0.55; // Card takes ~35% of screen width
    double cardHeight =
        sectionHeight * .67; // Golden ratio for book covers (3:2)
    final selectedCategory =
        Provider.of<CategoryProvider>(context).getSelectedCategory();

    // Dummy data for filtered items
    final List<Map> allItems = [
      {
        "anime_name": "Attack on Titan",
        "character_name": "Eren Jaeger",
        "category": "Shounen"
      },
      {
        "anime_name": "Demon Slayer: Kimetsu no Yaiba",
        "character_name": "Tanjiro Kamado",
        "category": "Shounen"
      },
      {
        "anime_name": "My Hero Academia",
        "character_name": "Izuku Midoriya",
        "category": "Shounen"
      },
      {
        "anime_name": "Naruto",
        "character_name": "Naruto Uzumaki",
        "category": "Shounen"
      },
      {
        "anime_name": "One Piece",
        "character_name": "Monkey D. Luffy",
        "category": "Shounen"
      },
      {
        "anime_name": "Fullmetal Alchemist: Brotherhood",
        "character_name": "Edward Elric",
        "category": "Seinen"
      },
      {
        "anime_name": "Death Note",
        "character_name": "Light Yagami",
        "category": "Psychological Thriller"
      },
      {
        "anime_name": "Cowboy Bebop",
        "character_name": "Spike Spiegel",
        "category": "Space Western"
      },
      {
        "anime_name": "Neon Genesis Evangelion",
        "character_name": "Shinji Ikari",
        "category": "Mecha Psychological"
      },
      {
        "anime_name": "Your Name.",
        "character_name": "Taki Tachibana",
        "category": "Romance Fantasy"
      }
    ];

    // Simple logic to filter by category (could be more complex depending on your app)
    final filteredItems = allItems.where((item) {
      return selectedCategory == 'All' ||
          item["category"].contains(selectedCategory);
    }).toList();

    return SizedBox(
      height: sectionHeight,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        scrollDirection: Axis.horizontal,
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: cardWidth,
                  height: cardHeight, // 4:3 aspect ratio
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://picsum.photos/id/$index/200/300?blur"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: cardWidth,
                  child: Text(
                    filteredItems[index]["anime_name"],
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: cardWidth * 0.09, // Responsive font size
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  filteredItems[index]["character_name"],
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                        fontSize: cardWidth * 0.07, // Responsive font size
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
