import 'package:flutter/material.dart';
import 'package:safe_paws/viewmodel/dog_image_view_model.dart';
import 'package:stacked/stacked.dart';

class DogImageView extends StatefulWidget {
  const DogImageView({super.key});

  @override
  State<DogImageView> createState() => _DogImageViewState();
}

class _DogImageViewState extends State<DogImageView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DogImageViewModel>.reactive(
      viewModelBuilder: () => DogImageViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 300),
              child: Text(
                '${viewModel.dogImageModel.message}',
                style: TextStyle(fontSize: 14),
              ),),
            ],
          ),
        );
      },
    );
  }
}
