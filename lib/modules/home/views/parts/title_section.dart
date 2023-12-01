import 'package:flutter/material.dart';
import 'package:xcbt/configs/all_configs.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllTap;

  const TitleSection({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
            onTap: onSeeAllTap,
            child: const Text(
              'See all',
              style: TextStyle(
                color: kBlue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}