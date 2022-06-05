import 'package:card/core/extensions/context_extension.dart';
import 'package:card/screens/cubit/card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DropdownColorWidget extends StatelessWidget {
  const DropdownColorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Colors',
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: context.h * 0.6,
            child: ColorPicker(
              pickerColor: context.watch<CardCubit>().colorConst,
              colorPickerWidth: context.w * 0.7,
              onColorChanged: (Color color) {
                context.read<CardCubit>().changeColor(color: color);
              },
            ),
          ),
        ),
      ],
    );
  }
}
