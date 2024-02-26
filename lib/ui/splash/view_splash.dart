import 'package:auto_route/auto_route.dart';
import 'package:dog/services/bloc.dart';
import 'package:dog/ui/pages/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ViewSplash extends StatefulWidget {
  const ViewSplash({super.key});
  @override
  _ViewSplashState createState() => _ViewSplashState();
}

class _ViewSplashState extends State<ViewSplash> {
  final keyScaffold = GlobalKey<ScaffoldState>();
  final bloc = ProviderBloc(StateBlocInitial());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchDataEvent());
  }

  Widget _getLogo(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo.jpeg'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        if (state is StateDataLoaded) {
          bloc.add(PhotoLoadedEvent(state.responseData));
        } else if (state is StatePhotoLoaded) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => PageControllerView(
              data: state.responseData,
              bloc: bloc,
            ),
          ));
        }
      },
      child: Scaffold(
        key: keyScaffold,
        body: Center(child: _getLogo(context)),
      ),
    );
  }
}
