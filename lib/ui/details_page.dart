import 'package:flutter/material.dart';
import '../model/contact.dart';
import '../utils/constants.dart';
import '../utils/text_styles.dart';

class DetailsPage extends StatelessWidget {
  final Contact contact;

  const DetailsPage({
    required this.contact,
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
                      image: contact.picture.large,
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
                  contact.fullName(),
                  style: TextStyles.fullNameTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.columnElementsPadding),
                child: Text(
                  '${Constants.phoneLabel} ${contact.phone}',
                  style: TextStyles.phoneTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.columnElementsPadding),
                child: Text(
                  '${Constants.cellLabel} ${contact.cell}',
                  style: TextStyles.cellTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.columnElementsPadding),
                child: Text(
                  contact.email,
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
                        '${contact.dateOfBirth.age} ${Constants.ageLabel}',
                        textAlign: TextAlign.center,
                        style: TextStyles.ageTextStyle,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.all(Constants.rowElementsPadding),
                      child: Text(
                        '${Constants.nationalityLabel} ${contact.nationality}',
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
