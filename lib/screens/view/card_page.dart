import 'package:card/core/extensions/context_extension.dart';
import 'package:card/screens/cubit/card_cubit.dart';
import 'package:card/screens/state/card_state.dart';
import 'package:card/widgets/card_widget.dart';
import 'package:card/widgets/dropdown_color_widget.dart';
import 'package:card/widgets/dropdown_images_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CardCubit(), child: cardScaffold(context));
  }

  Scaffold cardScaffold(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CardCubit, CardState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CardCompleteState) {
            return SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: context.w,
                  child: Column(
                    children: [
                      SizedBox(height: context.h * 0.02),
                      CardWidget(),
                      SizedBox(height: context.h * 0.02),
                      DropdownImageWidget(),
                      DropdownColorWidget(),
                      ElevatedButton(
                          onPressed: () {
                            context.read<CardCubit>().fromGallery();
                          },
                          child: Text("Image from gallery")),
                      Slider(
                        max: 3.0,
                        value: context.watch<CardCubit>().blur,
                        onChanged: (data) {
                          context.read<CardCubit>().changeBLur(data: data);
                        },
                      ),
                      ElevatedButton(onPressed: (){
                        context.read<CardCubit>().saveData();
                      }, child: Text("Save"))
                    ],
                  ),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
