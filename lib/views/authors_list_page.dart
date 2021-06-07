import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inetum_ws/authors/authors_bloc.dart';
import 'package:inetum_ws/authors/authors_events.dart';
import 'package:inetum_ws/authors/authors_state.dart';
import 'package:inetum_ws/models/author.dart';
import 'package:inetum_ws/utils/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inetum_ws/widgets/author_card.dart';
import 'package:inetum_ws/widgets/error.dart';
import 'package:inetum_ws/widgets/loading.dart';


class AuthorsListPage extends StatefulWidget {
  @override
  _AuthorsListPageState createState() => _AuthorsListPageState();
}

class _AuthorsListPageState extends State<AuthorsListPage> {

  @override
  void initState() {
    _loadAuthors();
    super.initState();
  }

  _loadAuthors() async {
    context.read<AuthorsBloc>().add(AuthorEvents.fetchAuthors);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        centerTitle: false,
        title: Text("Authors List : ", style: Style.blackTitle),
      ),
      body: _body(),

    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AuthorsBloc, AuthorsState>(
                  builder: (BuildContext context, AuthorsState state) {
                    if (state is AuthorsListError) {
                      String message = '${state.error.message}\nTap to Retry.';
                      return ErrorTxt(
                        message: message,
                        onTap: () => _loadAuthors(),
                      );
                    }
                    if (state is AuthorsLoaded) {
                      List<Author> authors = state.authors;
                      return _list(authors);
                    }
                    return Loading();
                  }
        ),
      ],
    );
  }


  Widget _list(List<Author> authors) {
    return Expanded(
      child: ListView.builder(
        itemCount: authors.length,
        itemBuilder: (_, index) {
          Author author = authors[index];
          return AuthorCard(author: author);
        },
      ),
    );
  }

}
