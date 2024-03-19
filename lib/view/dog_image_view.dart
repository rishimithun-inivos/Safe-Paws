import 'package:flutter/material.dart';
import 'package:safe_paws/view/second_page.dart';
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
          appBar: AppBar(
            //backgroundColor: Color.fromRGBO(39, 130, 142, 1.0),
            elevation: 5,
            shadowColor: Colors.grey,
            centerTitle: true,
            title: Center(
              child: Text(
                "Dog Image Collections",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: viewModel.hasResponseArrived
              ? Column(children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: viewModel.dogImageList.message?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 200,
                            width: 100,
                            child: Image.network(
                                '${viewModel.dogImageList.message?[index]}'));
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(39, 130, 142, 1.0)),
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const Text(
                        "Next Page",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ])
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
