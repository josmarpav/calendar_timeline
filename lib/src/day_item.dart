import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  const DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    this.isSelected = false,
    this.dayColor,
    this.activeDayColor,
    this.activeDayBackgroundColor,
    this.available = true,
    this.showDot = false,
    this.showDayName = false,
    this.dotColor,
    this.dayNameColor,
    required this.height,
    required this.width,
    required this.shrinkHeight,
    required this.shrinkWidth,
    required this.fontSize,
    required this.shrinkFontSize,
    required this.dayNameFontSize,
    required this.shrinkDayNameFontSize,
    this.shrink = false,
  }) : super(key: key);
  final int dayNumber;
  final String shortName;
  final bool isSelected;
  final Function onTap;
  final Color? dayColor;
  final Color? activeDayColor;
  final Color? activeDayBackgroundColor;
  final bool available;
  final bool showDot;
  final Color? dotColor;
  final Color? dayNameColor;
  final double height;
  final double width;
  final double shrinkHeight;
  final double shrinkWidth;
  final double fontSize;
  final double shrinkFontSize;
  final double dayNameFontSize;
  final double shrinkDayNameFontSize;
  final bool shrink;
  final bool showDayName;

  GestureDetector _buildDay(BuildContext context) {
    final textStyle = TextStyle(
      color: available
          ? dayColor ?? Theme.of(context).colorScheme.secondary
          : dayColor?.withOpacity(0.5) ??
              Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      fontSize: shrink ? shrinkFontSize : fontSize,
      height: 0.8,
    );
    final selectedStyle = TextStyle(
      color: activeDayColor ?? Colors.white,
      fontSize: shrink ? shrinkFontSize : fontSize,
      fontWeight: FontWeight.bold,
      height: 0.8,
    );

    final dayTextColor = isSelected
        ? activeDayColor ?? dayNameColor ?? Colors.white
        : showDayName
            ? dayNameColor
            : Colors.transparent;

    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                color: activeDayBackgroundColor ??
                    Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              )
            : const BoxDecoration(color: Colors.transparent),
        height: shrink ? shrinkHeight : height,
        width: shrink ? shrinkWidth : width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (isSelected)
              Column(
                children: [
                  SizedBox(height: shrink ? 6 : 7),
                  if (!shrink) _buildDots(),
                  SizedBox(height: shrink ? 6 : 7),
                ],
              )
            else
              SizedBox(height: shrink ? 12 : 19),
            Center(
              child: Text(
                dayNumber.toString(),
                style: isSelected ? selectedStyle : textStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                shortName,
                style: TextStyle(
                  color: dayTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: shrink ? shrinkDayNameFontSize : dayNameFontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDots() {
    final dot = Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: dotColor ?? activeDayColor ?? Colors.white,
        shape: BoxShape.circle,
      ),
    );
    return dot;
  }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}
