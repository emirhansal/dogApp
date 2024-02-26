// ignore_for_file: must_be_immutable

import 'package:dog/model/model_dog.dart';
import 'package:dog/services/bloc.dart';
import 'package:dog/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class WidgetImageCard extends StatelessWidget {
  final ModelDog model;
  final ProviderBloc bloc;

  WidgetImageCard({Key? key, required this.model, required this.bloc}) : super(key: key);

  String randomPhoto = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              insetPadding: const EdgeInsets.all(20.0),
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        model.images.isNotEmpty ? model.images.first : "",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 8.0,
                                  right: 8.0,
                                  child: Container(
                                    width: 32.0,
                                    height: 32.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        size: 16.0,
                                        Icons.close,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Breed",
                                    style: TextStyle(
                                      color: HexColor("#0055D3"),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(
                                    color: HexColor("#F2F2F7"),
                                    thickness: 2.0,
                                    indent: 30,
                                    endIndent: 30,
                                  ),
                                  Text(
                                    model.breed[0].toUpperCase() + model.breed.substring(1),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    "Sub Breed",
                                    style: TextStyle(
                                      color: HexColor("#0055D3"),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(
                                    color: HexColor("#F2F2F7"),
                                    thickness: 2.0,
                                    indent: 30,
                                    endIndent: 30,
                                  ),
                                  Column(
                                    children: [
                                      for (var subBreed in model.subBreed)
                                        Text(
                                          subBreed[0].toUpperCase() + subBreed.substring(1),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      if (model.subBreed.isEmpty) const Text("No Sub Breed"),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(color: Colors.transparent),
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: ButtonBasic(
                                text: "Generate",
                                onPressed: () {
                                  bloc.add(RandomPhotoLoadedEvent(model));
                                  showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return GeneratedRandomPhotoDialog(bloc: bloc);
                                    }),
                                  );
                                },
                                bgColor: HexColor("#0055D3"),
                                textColor: Colors.white,
                                radius: 8.0,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        width: MediaQuery.of(context).size.width / 2.1,
        height: 169.0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Card(
              child: (model.images.isNotEmpty)
                  ? Image.network(
                      model.images.first,
                      fit: BoxFit.cover,
                    )
                  : const Center(
                      child: Text("No Image"),
                    ),
            ),
            Positioned(
              left: 8.0,
              bottom: 8.0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Text(
                  model.breed[0].toUpperCase() + model.breed.substring(1),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GeneratedRandomPhotoDialog extends StatelessWidget {
  final ProviderBloc bloc;
  const GeneratedRandomPhotoDialog({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        if (state is StateRandomPhotoLoaded) {
          showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                backgroundColor: Colors.transparent,
                content: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(state.photoResponse),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        }
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
      ),
    );
  }
}
