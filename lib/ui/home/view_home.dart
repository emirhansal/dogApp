import 'package:dog/model/model_dog.dart';
import 'package:dog/services/bloc.dart';
import 'package:dog/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class ViewHome extends StatefulWidget {
  final List<ModelDog> data;
  final ProviderBloc bloc;
  const ViewHome({Key? key, required this.data, required this.bloc}) : super(key: key);

  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  FocusNode focusNode = FocusNode();
  TextEditingController textController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(context),
      backgroundColor: Colors.white,
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ListView.builder(
            itemCount: (widget.data.length / 2).ceil(),
            itemBuilder: (context, index) {
              final firstIndex = index * 2;
              final secondIndex = firstIndex + 1;
              if (firstIndex >= widget.data.length || secondIndex >= widget.data.length) {
                return Container();
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WidgetImageCard(
                    model: widget.data[firstIndex],
                    bloc: widget.bloc,
                  ),
                  WidgetImageCard(
                    model: widget.data[secondIndex],
                    bloc: widget.bloc,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
