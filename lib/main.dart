import 'package:flutter/material.dart';
import 'package:inetum_ws/authors/authors_bloc.dart';
import 'package:inetum_ws/services/author_service.dart';
import 'package:inetum_ws/views/authors_list_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authors ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => AuthorsBloc(authorRepo: AuthorService()),
        child: AuthorsListPage(),
      ),
    );
  }
}
