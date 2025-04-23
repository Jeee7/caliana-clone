import 'package:caliana_clone/components/clock_and_date.dart';
import 'package:caliana_clone/components/daily_visitor.dart';
import 'package:caliana_clone/components/feature_list.dart';
import 'package:caliana_clone/utility/divider.dart';
import 'package:caliana_clone/utility/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _logoClicked = false;
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[100],
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _logoClicked = true;
                    });
                  },
                  child: Image.asset(
                    'assets/logo/caliana-logo.png',
                    height: 32,
                    width: 32,
                  ),
                ),
                gapWidth(32),
                SizedBox(
                  width: 180,
                  height: 48,
                  child: SizedBox(
                    width: 160,
                    height: 48,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.centerRight,
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Transform.translate(
                              offset: const Offset(-16, 0),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 260,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 24, 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    Utility.truncateText('Operator Ziddan'),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                            child: ClipOval(
                              child: Container(
                                color: const Color.fromARGB(255, 178, 234, 241),
                                height: 40,
                                width: 40,
                                child: SvgPicture.asset(
                                  'assets/icons/profile.svg',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.notifications_none,
                    size: 28,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          gapHeight(16),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DateAndClock(),
                      gapHeight(16),
                      searchBar(),
                      gapHeight(32),
                    ],
                  ),
                ),
                if (_logoClicked == true) ...[
                  const FeatureList(),
                ] else ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: FeatureList(),
                  ),
                ],
                gapHeight(32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: DailyVisitor(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget searchBar() {
  return Container(
    padding: const EdgeInsets.fromLTRB(
      16,
      8,
      16,
      8,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
        ),
      ],
    ),
    child: Row(
      children: [
        const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Cari',
              border: InputBorder.none,
              isDense: true,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.2),
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
