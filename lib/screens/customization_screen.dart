import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/theme_service.dart';
import '../constants/app_text_styles.dart';

class CustomizationScreen extends StatelessWidget {
  const CustomizationScreen({super.key});

  static const List<Color> _presetColors = [
    Colors.deepPurple,
    Colors.indigo,
    Colors.teal,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<AppColor>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Customization', style: AppTextStyles.h4),
        backgroundColor: appColor.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pick main color!', style: AppTextStyles.h3),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _presetColors
                  .map((c) => _buildColorTile(context, c))
                  .toList(),
            ),
            const SizedBox(height: 24),
            Text('Current color', style: AppTextStyles.body1),
            const SizedBox(height: 8),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: appColor.color,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorTile(BuildContext context, Color color) {
    final appColor = Provider.of<AppColor>(context, listen: false);
    final isSelected = appColor.color.value == color.value;

    return GestureDetector(
      onTap: () async {
        await appColor.setColor(color);
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? Border.all(color: Colors.black, width: 3) : null,
        ),
      ),
    );
  }
}
