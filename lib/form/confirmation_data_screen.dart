import 'package:caliana_clone/components/bottom_sheet_confirmation.dart';
import 'package:caliana_clone/main_navigation.dart';
import 'package:caliana_clone/utility/divider.dart';
import 'package:flutter/material.dart';

class ConfirmationDataPage extends StatefulWidget {
  final String? idCard;
  final String? accessCard;
  final String name;
  final String email;
  const ConfirmationDataPage({
    super.key,
    this.idCard,
    this.accessCard,
    required this.name,
    required this.email,
  });

  @override
  State<ConfirmationDataPage> createState() => _ConfirmationDataPageState();
}

class _ConfirmationDataPageState extends State<ConfirmationDataPage> {
  bool _personalDataExpanded = true;
  bool _visitPurposeExpanded = true;
  bool _isLoading = false;

  void _handleCheckIn() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (_) => const MainNavigation(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Konfirmasi Data',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              _buildExpandableSection(
                title: 'Data Pribadi',
                expanded: _personalDataExpanded,
                onToggle: () {
                  setState(() {
                    _personalDataExpanded = !_personalDataExpanded;
                  });
                },
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'Nama',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      gapHeight(8),
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            color: Colors.black54,
                            size: 20,
                          ),
                          gapWidth(12),
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      gapHeight(4),
                      Divider(color: Colors.blue[200]),
                      gapHeight(16),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      gapHeight(8),
                      Row(
                        children: [
                          const Icon(
                            Icons.alternate_email,
                            color: Colors.black54,
                            size: 20,
                          ),
                          gapWidth(12),
                          Text(
                            widget.email,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      gapHeight(4),
                      Divider(color: Colors.blue[200]),
                      gapHeight(16),
                    ],
                  ),
                ),
              ),
              gapHeight(16),
              _buildExpandableSection(
                title: 'Tujuan Kunjungan',
                expanded: _visitPurposeExpanded,
                onToggle: () {
                  setState(() {
                    _visitPurposeExpanded = !_visitPurposeExpanded;
                  });
                },
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapHeight(16),
                    const Text(
                      'Berapa banyak orang yang bersama Anda ?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                    gapHeight(8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border,
                          color: Colors.black54,
                          size: 20,
                        ),
                        gapWidth(12),
                        const Text(
                          '1',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    gapHeight(4),
                    Divider(color: Colors.blue[200]),
                    gapHeight(16),
                  ],
                ),
              ),
              gapHeight(40),
              ElevatedButton(
                onPressed: _isLoading ? null : _handleCheckIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text(
                        'Check In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
              ),
              gapHeight(16),
              OutlinedButton(
                onPressed: () async {
                  final shouldCancel =
                      await CancelConfirmationBottomSheet.show(context);
                  if (shouldCancel == true) {
                    Navigator.of(context).pop();
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.cyan[400]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Batal',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.cyan[400],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required Widget content,
    required bool expanded,
    required VoidCallback onToggle,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onToggle,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[400],
                  ),
                ),
                Icon(
                  expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.blue[400],
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: content,
          secondChild: const SizedBox(height: 0),
          crossFadeState:
              expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
