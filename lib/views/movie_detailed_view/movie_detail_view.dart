import 'package:flutter/material.dart';
import 'package:mvvmprovider/models/movies_model.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key,  required this.movies});

  final  movies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movies.title),
      ),
    );
  }
}
