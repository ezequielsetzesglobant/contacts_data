import 'package:flutter/material.dart';
import '../bloc/contact_interface_bloc.dart';
import '../utils/constants.dart';
import '../model/contact.dart';
import '../utils/text_styles.dart';

class HomePage extends StatelessWidget {
  final ContactInterfaceBloc bloc;

  HomePage(
    this.bloc,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: bloc.getContacts(),
          builder: (context, AsyncSnapshot<List<Contact>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Card(
                      color: Colors.grey,
                      child: SizedBox(
                        height: Constants.contactBoxHeight,
                        child: Center(
                          child: Text(
                            '${snapshot.data?[index].name.first} ${snapshot.data?[index].name.last}',
                            style: TextStyles.contactTextStyle,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
