import 'package:card/core/extensions/context_extension.dart';
import 'package:card/screens/cubit/card_cubit.dart';
import 'package:flutter/material.dart';

class DropdownImageWidget extends StatelessWidget {
  const DropdownImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Images',
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: context.h * 0.3,
            child: GridView.builder(
              itemCount: CardCubit.imageList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    'assets/cardimages/${CardCubit.imageList[index]}',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
