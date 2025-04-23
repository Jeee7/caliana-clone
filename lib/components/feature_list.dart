import 'package:caliana_clone/utility/divider.dart';
import 'package:flutter/material.dart';

class FeatureList extends StatefulWidget {
  const FeatureList({super.key});

  @override
  State<FeatureList> createState() => _FeatureListState();
}

class _FeatureListState extends State<FeatureList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fitur',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          gapHeight(16),
          featuresTab(),
          gapHeight(16),
          Center(
            child: featureContent(),
          ),
        ],
      ),
    );
  }

  int selectedTabIndex = 0;

  List<String> tabs = ['Semua Fitur', 'Visitor Management System', 'Populer'];

  Widget featuresTab() {
    return SizedBox(
      height: 48,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = index == selectedTabIndex;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color.fromARGB(255, 217, 240, 243)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    color: isSelected
                        ? Colors.blue
                        : Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget featureContent() {
    switch (selectedTabIndex) {
      case 0:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/dasbor.png',
                  width: 40,
                  height: 40,
                ),
                Image.asset(
                  'assets/icons/visitor-list.png',
                  width: 25,
                  height: 25,
                ),
                Image.asset(
                  'assets/icons/resident.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dasbor',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        'Pengunjung',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Residen',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            )
          ],
        );

      case 1:
        return Column(
          children: [
            Icon(Icons.favorite, size: 40, color: Colors.red),
            const SizedBox(height: 8),
            const Text(
              'Favorit',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            Icon(Icons.star, size: 40, color: Colors.amber),
            const SizedBox(height: 8),
            const Text(
              'Populer',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
