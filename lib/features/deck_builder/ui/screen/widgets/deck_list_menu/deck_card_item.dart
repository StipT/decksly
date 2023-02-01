import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckCardItem extends StatelessWidget {
  const DeckCardItem({
    required this.name,
    required this.amount,
    required this.isLegendary,
    required this.cropImageUrl,
    required this.onTapPlus,
    required this.onTapMinus,
    required this.onTapInfo,
  });

  final String name;
  final String amount;
  final bool isLegendary;
  final String cropImageUrl;
  final VoidCallback onTapPlus;
  final VoidCallback onTapMinus;
  final VoidCallback onTapInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => onTapInfo,
      child: Container(
        child: Stack(
          children: [
            Image.network(
              cropImageUrl,
              fit: BoxFit.fill,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isLegendary
                      ? const Icon(
                          Icons.star,
                          color: AppColors.gold,
                        )
                      : Text(
                          amount,
                          style: FontStyles.bold11Gold,
                        ),
                  Text(
                    name,
                    style: FontStyles.bold11Gold,
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => onTapPlus,
                    child: Text(
                      "+",
                      style: FontStyles.bold11Gold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onTapPlus,
                    child: Text(
                      "-",
                      style: FontStyles.bold11Gold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 2.w,
        ),
      ),
    );
  }
}
