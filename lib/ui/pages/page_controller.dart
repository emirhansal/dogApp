import 'package:dog/model/model_dog.dart';
import 'package:dog/services/bloc.dart';
import 'package:dog/ui/home/view_home.dart';
import 'package:dog/ui/settings/view_settings.dart';
import 'package:dog/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class PageControllerView extends StatefulWidget {
  final List<ModelDog> data;
  final ProviderBloc bloc;
  const PageControllerView({Key? key, required this.data, required this.bloc}) : super(key: key);

  @override
  _PageControllerState createState() => _PageControllerState();
}

class _PageControllerState extends State<PageControllerView> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          "DogApp",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: PageView(
        physics: const PageScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          ViewHome(data: widget.data, bloc: widget.bloc),
          ViewSettings(),
        ],
        onPageChanged: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
