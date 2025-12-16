import 'package:flutter/material.dart';

import '../../../core/enum/measure.dart';
import '../../../theme/app_constants.dart';

Widget buildWidgetMeasureState(
  String measure,
  TextEditingController amountController,
  TextEditingController measureDescriptionController,
  TextEditingController minutesController,
  TextEditingController repetitionsController,
  TextEditingController measureDescController,
) {
  MeasureEnum measureEnum = measureTextToEnum(measure);
  switch (measureEnum) {
    case MeasureEnum.quantity:
      return Column(
        children: [
          TextFormField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Cantidad',
              hintText: 'Ej: 8',
            ),
            validator: (value) {
              if (measureEnum != MeasureEnum.quantity) return null;
              if (value == null || value.trim().isEmpty) {
                return 'Requerido';
              }
              if (int.tryParse(value) == null) {
                return 'Introduce un número';
              }
              return null;
            },
          ),
          const SizedBox(height: AppConstants.spacingS),
          TextFormField(
            controller: measureDescriptionController,
            decoration: const InputDecoration(
              labelText: 'Descripción (opcional)',
              hintText: 'Ej: Litros',
            ),
          ),
        ],
      );
    case MeasureEnum.time:
      return Column(
        children: [
          TextFormField(
            controller: minutesController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Minutos',
              hintText: 'Ej: 30',
            ),
            validator: (value) {
              if (measureEnum != MeasureEnum.time) return null;
              if (value == null || value.trim().isEmpty) {
                return 'Requerido';
              }
              if (int.tryParse(value) == null) {
                return 'Ingresa un número';
              }
              return null;
            },
          ),
        ],
      );
    case MeasureEnum.repetitions:
      return Column(
        children: [
          TextFormField(
            controller: repetitionsController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Repeticiones',
              hintText: 'Ej: 2',
            ),
            validator: (v) {
              if (measureEnum != MeasureEnum.repetitions) return null;
              if (v == null || v.trim().isEmpty) {
                return 'Requerido';
              }
              if (int.tryParse(v) == null) return 'Ingresa un número';
              return null;
            },
          ),
          const SizedBox(height: AppConstants.spacingS),
          TextFormField(
            controller: measureDescController,
            decoration: const InputDecoration(
              labelText: 'Descripción (opcional)',
              hintText: 'Ej: Veces al día',
            ),
          ),
        ],
      );
  }
}
