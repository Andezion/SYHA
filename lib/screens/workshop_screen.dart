import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_strings.dart';

class WorkshopScreen extends StatelessWidget {
  const WorkshopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        title: Text(
          AppStrings.workshop,
          style: AppTextStyles.h4.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Создайте свою тренировку',
            style: AppTextStyles.h3,
          ),
          const SizedBox(height: 8),
          Text(
            'Настройте программу под свои цели',
            style: AppTextStyles.body2,
          ),
          const SizedBox(height: 24),

          // Create new workout button
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                // TODO: Navigate to workout creation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Создание новой тренировки...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 48,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Создать новую тренировку',
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Мои тренировки',
            style: AppTextStyles.h4,
          ),
          const SizedBox(height: 12),

          // Custom workouts list (demo)
          _buildWorkoutCard(
            context,
            'Моя силовая программа',
            '4 упражнения',
            'Понедельник, Среда, Пятница',
            Icons.fitness_center,
            AppColors.primary,
          ),
          _buildWorkoutCard(
            context,
            'Тренировка рук',
            '6 упражнений',
            'Вторник, Четверг',
            Icons.sports_martial_arts,
            AppColors.accent,
          ),
          _buildWorkoutCard(
            context,
            'Программа для ног',
            '5 упражнений',
            'Суббота',
            Icons.directions_run,
            AppColors.success,
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard(
    BuildContext context,
    String title,
    String exerciseCount,
    String schedule,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: AppTextStyles.body1.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(exerciseCount, style: AppTextStyles.caption),
            Text(schedule, style: AppTextStyles.caption),
          ],
        ),
        trailing: PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                children: [
                  const Icon(Icons.edit, size: 20),
                  const SizedBox(width: 8),
                  Text(AppStrings.edit),
                ],
              ),
              onTap: () {
                // TODO: Edit workout
              },
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  const Icon(Icons.delete, size: 20, color: AppColors.error),
                  const SizedBox(width: 8),
                  Text(AppStrings.delete,
                      style: const TextStyle(color: AppColors.error)),
                ],
              ),
              onTap: () {
                // TODO: Delete workout
              },
            ),
          ],
        ),
        onTap: () {
          // TODO: Navigate to workout details
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Открыть: $title'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}
