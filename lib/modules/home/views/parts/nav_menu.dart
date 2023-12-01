import 'package:flutter/material.dart';
import 'package:xcbt/configs/all_configs.dart';

class NavMenu extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const NavMenu({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isActive ? kRed.withOpacity(0.4) : null,
          borderRadius: const BorderRadius.all(Radius.circular(18.0)),
        ),
        child: Row(
          children: [
            ImageIcon(
              AssetImage(iconPath),
              color: isActive ? kAppPrimary : kBlack,
            ),
            if (isActive) const SizedBox(width: 4.0),
            if (isActive)
              Text(
                label,
                style: const TextStyle(
                  color: kAppPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }
}