import 'package:flutter/material.dart';
import '../bloc/interface/i_contact_bloc.dart';
import '../utils/constants.dart';
import '../model/contact.dart';
import '../utils/text_styles.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  final IContactBloc bloc;

  HomePage(
    this.bloc,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.titleApp),
      ),
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
                            '${snapshot.data?[index].fullName()}',
                            style: TextStyles.contactTextStyle,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            contact: snapshot.data![index],
                          ),
                        ),
                      );
                    },
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
