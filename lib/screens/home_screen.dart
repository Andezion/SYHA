import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        title: Text(
          AppStrings.home,
          style: AppTextStyles.h4.copyWith(color: AppColors.textOnPrimary),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Calendar widget placeholder
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.surface,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        setState(() {
                          _selectedDate = DateTime(
                            _selectedDate.year,
                            _selectedDate.month - 1,
                          );
                        });
                      },
                    ),
                    Text(
                      _getMonthYearString(_selectedDate),
                      style: AppTextStyles.h4,
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {
                        setState(() {
                          _selectedDate = DateTime(
                            _selectedDate.year,
                            _selectedDate.month + 1,
                          );
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Simplified calendar grid
                _buildCalendarGrid(),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Today's workout section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Сегодняшняя тренировка',
                    style: AppTextStyles.h3,
                  ),
                  const SizedBox(height: 16),

                  // Workout card
                  _buildWorkoutCard(),

                  const SizedBox(height: 24),

                  // Quick stats
                  Text(
                    'Статистика',
                    style: AppTextStyles.h4,
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          'Тренировок в этом месяце',
                          '12',
                          Icons.fitness_center,
                          AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          'Дней подряд',
                          '5',
                          Icons.local_fire_department,
                          AppColors.warning,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to workout start
        },
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        icon: const Icon(Icons.play_arrow),
        label: const Text(AppStrings.startWorkout),
      ),
    );
  }

  String _getMonthYearString(DateTime date) {
    const months = [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  Widget _buildCalendarGrid() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // Weekday headers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс']
                .map((day) => SizedBox(
                      width: 40,
                      child: Text(
                        day,
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 8),
          // Calendar days (simplified for now)
          Text(
            'Календарь (будет реализован)',
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.fitness_center,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Силовая тренировка А',
                        style: AppTextStyles.h4,
                      ),
                      Text(
                        'Пауэрлифтинг',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Упражнения:',
              style: AppTextStyles.body2.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            _buildExerciseItem('Приседания', '4x8'),
            _buildExerciseItem('Жим лежа', '4x8'),
            _buildExerciseItem('Становая тяга', '3x5'),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseItem(String name, String sets) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline,
              size: 16, color: AppColors.textSecondary),
          const SizedBox(width: 8),
          Text(name, style: AppTextStyles.body2),
          const Spacer(),
          Text(sets, style: AppTextStyles.caption),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String label, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: AppTextStyles.h2.copyWith(color: color),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.caption,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
