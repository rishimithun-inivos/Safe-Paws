import 'package:flutter/cupertino.dart';
import 'package:safe_paws/model/dog_image_model.dart';
import 'package:safe_paws/repositary/dog_image_repositary.dart';

class DogImageViewModel extends ChangeNotifier {
  DogImageRepository dogImageRepository = DogImageRepository();
  DogImageModel dogImageModel = DogImageModel();

  init() {
    fetchDogImage();
  }

  Future<void> fetchDogImage() async {
    await dogImageRepository.fetchDogImageApi().then(
      (value) {
        dogImageModel = value;
      },
    );
    notifyListeners();
  }
}
