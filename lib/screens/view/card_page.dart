import 'dart:ffi';

import 'package:card/core/extensions/context_extension.dart';
import 'package:card/screens/cubit/card_cubit.dart';
import 'package:card/widgets/card_widget.dart';
import 'package:card/widgets/dropdown_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int groupValue = 1;
    String value1 = "Images";
    String value2 = "Colors";
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: context.w,
        child: Column(
          children: [
            SizedBox(height: context.h * 0.02),
            CardWidget(),
            DropdownImageWidget()
          ],
        ),
      ),
    ));
  }
}