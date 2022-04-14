import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/text_styles.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String fullName;
  final String email;
  final String phone;
  final String cell;
  final String age;
  final String nationality;

  const DetailsPage({
    required this.image,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.cell,
    required this.age,
    required this.nationality,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text(Constants.titleApp),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.all(Constants.columnElementsPadding),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Constants.imageRadius),
                    ),
                    child: FadeInImage.assetNetwork(
                      placeholder: Constants.placeholder,
                      image: image,
                      height: Constants.imageSize,
                      width: Constants.imageSize,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.columnElementsPadding),
                child: Text(
                  fullName,
                  style: TextStyles.fullNameTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.columnElementsPadding),
                child: Text(
                  '${Constants.phoneLabel} $phone',
                  style: TextStyles.phoneTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.columnElementsPadding),
                child: Text(
                  '${Constants.cellLabel} $cell',
                  style: TextStyles.cellTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.columnElementsPadding),
                child: Text(
                  email,
                  style: TextStyles.emailTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.columnElementsPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.all(Constants.rowElementsPadding),
                      child: Text(
                        '$age ${Constants.ageLabel}',
                        textAlign: TextAlign.center,
                        style: TextStyles.ageTextStyle,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.all(Constants.rowElementsPadding),
                      child: Text(
                        '${Constants.nationalityLabel} $nationality',
                        style: TextStyles.nationalityTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
