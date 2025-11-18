import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_strings.dart';

class ProgramsScreen extends StatelessWidget {
  const ProgramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        title: Text(
          AppStrings.programs,
          style: AppTextStyles.h4.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Выберите программу тренировок',
            style: AppTextStyles.h3,
          ),
          const SizedBox(height: 16),

          // Streetlifting
          _buildProgramCategory(
            context,
            AppStrings.streetlifting,
            'Тренировки с собственным весом',
            Icons.sports_gymnastics,
            AppColors.streetlifting,
            [
              'Базовая программа для начинающих',
              'Продвинутая программа',
              'Программа для выхода силой',
            ],
          ),

          const SizedBox(height: 16),

          // Armwrestling
          _buildProgramCategory(
            context,
            AppStrings.armwrestling,
            'Специализированные тренировки',
            Icons.back_hand,
            AppColors.armwrestling,
            [
              'Базовая программа армрестлинга',
              'Тренировка хвата и предплечий',
              'Программа для соревнований',
            ],
          ),

          const SizedBox(height: 16),

          // Powerlifting
          _buildProgramCategory(
            context,
            AppStrings.powerlifting,
            'Программы для максимальной силы',
            Icons.fitness_center,
            AppColors.powerlifting,
            [
              'Начальная программа 5x5',
              'Программа для среднего уровня',
              'Программа предсоревновательной подготовки',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgramCategory(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    List<String> programs,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          title: Text(
            title,
            style: AppTextStyles.h4.copyWith(color: color),
          ),
          subtitle: Text(
            description,
            style: AppTextStyles.caption,
          ),
          children: programs.map((program) {
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              leading: Icon(Icons.play_arrow, color: color, size: 20),
              title: Text(program, style: AppTextStyles.body2),
              trailing: const Icon(Icons.chevron_right, size: 20),
              onTap: () {
                // TODO: Navigate to program details
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Открыть программу: $program'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
