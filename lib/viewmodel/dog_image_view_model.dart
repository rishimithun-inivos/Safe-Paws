import 'package:flutter/cupertino.dart';
import 'package:safe_paws/model/dog_image_model.dart';
import 'package:safe_paws/repositary/dog_image_repositary.dart';

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
      },
    ).catchError(
      (error, stackTrace) {

      },
    );
    notifyListeners();
  }
}
