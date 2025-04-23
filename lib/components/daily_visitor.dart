import 'package:caliana_clone/utility/divider.dart';
import 'package:flutter/material.dart';

class DailyVisitor extends StatefulWidget {
  const DailyVisitor({super.key});

  @override
  State<DailyVisitor> createState() => _DailyVisitorState();
}

class _DailyVisitorState extends State<DailyVisitor> {
  bool isLoading = false;

  void refreshVisitor() {
    setState(() => isLoading = true);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.lightBlue,
              ),
            )
          : Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hari Ini',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                gapHeight(32),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Belum Ada Pengunjung Baru',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Pengunjung yang menunggu akan ditampilkan di sini',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                gapHeight(16),
                buttonRefresh(refreshVisitor),
              ],
            ),
    );
  }
}

Widget buttonRefresh(VoidCallback onPressed) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.lightBlue),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Text(
      'Refresh',
      style: TextStyle(
        color: Colors.lightBlue,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
