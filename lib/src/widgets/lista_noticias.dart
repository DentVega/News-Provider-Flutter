import 'package:flutter/material.dart';
import 'package:newsprovider/src/models/news_models.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> notificas;

  const ListaNoticias(this.notificas);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.notificas.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(this.notificas[index].title);
      },
    );
  }
}
