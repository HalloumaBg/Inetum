import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inetum_ws/models/author.dart';
import 'package:inetum_ws/services/author_service.dart';
import 'package:inetum_ws/authors/authors_state.dart';
import 'package:inetum_ws/utils/exceptions.dart';
import 'authors_events.dart';

class AuthorsBloc extends Bloc<AuthorEvents, AuthorsState> {
  final AuthorRepo authorRepo;
  List<Author> authors;

  AuthorsBloc({this.authorRepo}) : super(AuthorsInitState());

  @override
  Stream<AuthorsState> mapEventToState(AuthorEvents event) async* {
    switch (event) {
      case AuthorEvents.fetchAuthors:
        yield AuthorsLoading();
        try {
          authors = await authorRepo.getAuthorsList();
          yield AuthorsLoaded(authors: authors);
        } on SocketException {
          yield AuthorsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield AuthorsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield AuthorsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          print(e);
          yield AuthorsListError(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}
