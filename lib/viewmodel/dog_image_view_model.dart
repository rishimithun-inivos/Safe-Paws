

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_paws/main.dart';
import 'package:safe_paws/model/dog_image_model.dart';
import 'package:safe_paws/repositary/dog_image_repositary.dart';
import 'package:safe_paws/view/widgets/error_view.dart';

class DogImageViewModel extends ChangeNotifier {
  DogImageRepository dogImageRepository = DogImageRepository();
  DogImageList dogImageList = DogImageList();
  late bool hasResponseArrived;

  init() {
    hasResponseArrived = false;
    fetchDogImage();
  }

  Future<void> fetchDogImage() async {
    await dogImageRepository.fetchDogImageApi().then(
      (value) {
        hasResponseArrived = true;
        dogImageList = value;
        notifyListeners();
      },
    ).catchError(
      (error, stackTrace) {
        hasResponseArrived = true;
        Navigator.push(
          navigationKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
        notifyListeners();
      },
    );
  }
}
