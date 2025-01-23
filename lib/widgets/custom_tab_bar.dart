import 'package:flutter/material.dart';
import 'package:speedforcetest/constants/app_constants.dart';

class TabButtons extends StatefulWidget {
  final String firstTabText;
  final String secondTabText;
  final ValueChanged<int> onTabSelected;
  final int initialSelectedIndex;

  const TabButtons({
    Key? key,
    required this.firstTabText,
    required this.secondTabText,
    required this.onTabSelected,
    this.initialSelectedIndex = 0,
  }) : super(key: key);

  @override
  _TabButtonsState createState() => _TabButtonsState();
}

class _TabButtonsState extends State<TabButtons> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  void handleSelection(int index) {
    if (index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
      widget.onTabSelected(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // First Tab
        Transform.translate(
          offset: Offset( -80,  0),
          child: _buildTab(
            text: widget.firstTabText,
            isSelected: selectedIndex == 0,
            onTap: () => handleSelection(0), isLeftTab: true,
          ),
        ),
        // Second Tab
        Transform.translate(
          offset: Offset(80 , 0),
          child: _buildTab(
            text: widget.secondTabText,
            isSelected: selectedIndex == 1,
            onTap: () => handleSelection(1), isLeftTab: false,
          ),
        ),
      ],
    );
  }

  Widget _buildTab({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isLeftTab,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 50,
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 5), // Slight separation
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.accentColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: _getBoxShadows(isLeftTab),

        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: isSelected ? AppColors.accentColor  : AppColors.primaryColor ,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  List<BoxShadow> _getBoxShadows(bool isLeftTab) {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: isLeftTab ? const Offset(3, 3) : const Offset(-3, 3),
        blurRadius: 5,
        spreadRadius: 1,
      ),
      if (isLeftTab)
        const BoxShadow(
          color: Colors.transparent, // No shadow on the right side
          offset: Offset(-3, 0),
        ),
      if (!isLeftTab)
        const BoxShadow(
          color: Colors.transparent, // No shadow on the left side
          offset: Offset(3, 0),
        ),
    ];
  }
}
