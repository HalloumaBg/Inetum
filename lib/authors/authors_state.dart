import 'package:equatable/equatable.dart';
import 'package:inetum_ws/models/author.dart';

abstract class AuthorsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthorsInitState extends AuthorsState {}
class AuthorsLoading extends AuthorsState {}

class AuthorsLoaded extends AuthorsState {
  final List<Author> authors;
  AuthorsLoaded({this.authors});
}

class AuthorsListError extends AuthorsState {
  final error;
  AuthorsListError({this.error});
}
