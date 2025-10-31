import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_app/core/enum/measure.dart';
import 'package:habits_app/core/providers/create_habit_provider.dart';

class MeasureScreen extends ConsumerWidget {
  const MeasureScreen({super.key});

  // Actualiza el provider y navega a otra pantalla.
  void _select(BuildContext context, WidgetRef ref, MeasureEnum measure) {
    // Reemplaza 'habitFormProvider' y 'setMeasureType' por tu provider y método reales.
    // Ejemplo: ref.read(createHabitProvider.notifier).setMeasureType(type);
    ref.read(selectedMeasureProvider.notifier).setMeasure(measure);

    // Reemplaza '/nextRoute' por la ruta a la que quieres navegar.
    // Navigator.of(context).pushNamed('/create-habit-form');
    context.go('/habits/measure/form');
  }

  Widget _buildCard({
    required BuildContext context,
    required WidgetRef ref,
    required IconData icon,
    required String title,
    required String description,
    required String example,
    required MeasureEnum measure,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _select(context, ref, measure),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary.withOpacity(0.12),
                child: Icon(icon, color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      example,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tipo de medida')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Elige cómo quieres medir tu hábito',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            _buildCard(
              context: context,
              ref: ref,
              icon: Icons.format_list_numbered,
              title: 'Cantidad',
              description: 'Medir por unidades o cantidad.',
              example: 'Ej: 2 páginas',
              measure: MeasureEnum.quantity,
            ),
            const SizedBox(height: 12),
            _buildCard(
              context: context,
              ref: ref,
              icon: Icons.timer,
              title: 'Tiempo',
              description: 'Medir por duración (tiempo).',
              example: 'Ej: leer por 10 minutos',
              measure: MeasureEnum.time,
            ),
            const SizedBox(height: 12),
            _buildCard(
              context: context,
              ref: ref,
              icon: Icons.repeat,
              title: 'Repeticiones',
              description: 'Medir por veces o repeticiones en un periodo.',
              example: 'Ej: 2 veces al día',
              measure: MeasureEnum.repetitions,
            ),
          ],
        ),
      ),
    );
  }
}
