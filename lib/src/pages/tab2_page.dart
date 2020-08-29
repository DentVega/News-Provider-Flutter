import 'package:flutter/material.dart';
import 'package:newsprovider/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [Expanded(child: _ListaCategorias())],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return ListView.builder(
        physics: BouncingScrollPhysics(), //se vea igual en android e ios
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Icon(categories[index].icon),
                  SizedBox(
                    height: 5,
                  ),
                  Text(categories[index].name),
                ],
              ));
        });
  }
}
