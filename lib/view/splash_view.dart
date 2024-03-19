import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:safe_paws/viewmodel/splash_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:safe_paws/view/dog_image_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Stack(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/BgImage.png',
                  fit: BoxFit.fill,
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(70, 30, 20, 300),
                  child: Text(
                    "SafePaws",
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 400, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(39, 130, 142, 1.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DogImageView()));
                    },
                    child: Text(
                      "Let's Go",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
