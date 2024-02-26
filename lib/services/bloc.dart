import 'dart:async';

import 'package:dog/model/model_dog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Event
abstract class BlocEvent {}

class FetchDataEvent extends BlocEvent {}

class DataLoadedEvent extends BlocEvent {
  final List<ModelDog> responseData;
  DataLoadedEvent(this.responseData);
}

class PhotoLoadedEvent extends BlocEvent {
  final List<ModelDog> responseData;
  PhotoLoadedEvent(this.responseData);
}

class RandomPhotoLoadedEvent extends BlocEvent {
  final ModelDog model;
  RandomPhotoLoadedEvent(this.model);
}

//State
abstract class BlocState {}

class StateBlocInitial extends BlocState {}

class StateDataLoaded extends BlocState {
  final List<ModelDog> responseData;
  StateDataLoaded(this.responseData);
}

class ErrorState extends BlocState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class StatePhotoLoaded extends BlocState {
  final List<ModelDog> responseData;
  StatePhotoLoaded(this.responseData);
}

class StateRandomPhotoLoaded extends BlocState {
  final String photoResponse;
  StateRandomPhotoLoaded(this.photoResponse);
}

// Bloc
class ProviderBloc extends Bloc<BlocEvent, BlocState> {
  ProviderBloc(BlocState initialState) : super(initialState) {
    on<FetchDataEvent>((event, emit) async {
      try {
        final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          List<ModelDog> list = _convertResponseToModel(responseData);
          emit(StateDataLoaded(list));
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    on<RandomPhotoLoadedEvent>((event, emit) async {
      try {
        final response = await http.get(Uri.parse('https://dog.ceo/api/breed/${event.model.breed}/images/random'));
        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final String image = responseData['message'];
          emit(StateRandomPhotoLoaded(image));
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    on<PhotoLoadedEvent>((event, emit) async {
      try {
        List<ModelDog> data = event.responseData;

        List<Future<http.Response>> futures = data.map((element) => http.get(Uri.parse('https://dog.ceo/api/breed/${element.breed}/images'))).toList();

        List<http.Response> responses = await Future.wait(futures);

        for (int i = 0; i < responses.length; i++) {
          var response = responses[i];
          if (response.statusCode == 200) {
            final responseData = jsonDecode(response.body);
            data[i].images = _convertResponseToModelImages(responseData);
          } else {
            throw Exception('Failed to load data');
          }
        }

        emit(StatePhotoLoaded(data));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}

List<ModelDog> _convertResponseToModel(Map<String, dynamic> responseData) {
  List<ModelDog> dogs = [];
  responseData['message'].forEach((key, value) {
    dogs.add(ModelDog(breed: key, subBreed: List<String>.from(value)));
  });
  return dogs;
}

List<String> _convertResponseToModelImages(Map<String, dynamic> responseData) {
  List<String> images = [];

  responseData['message'].forEach((element) {
    images.add(element);
    return images;
  });
  return images;
}
