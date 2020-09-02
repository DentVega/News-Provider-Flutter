import 'package:flutter/material.dart';
import 'package:newsprovider/src/models/category_model.dart';
import 'package:newsprovider/src/services/news_service.dart';
import 'package:newsprovider/src/theme/tema.dart';
import 'package:newsprovider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class TabsPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),
            Expanded(
                child: ListaNoticias(newService.getArticlesCategorySelected))
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: BouncingScrollPhysics(), //se vea igual en android e ios
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final cName = categories[index].name;
            return Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    _CategoryButton(categories[index]),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
                  ],
                ));
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        print(categoria.name);
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categoria.icon,
          color: (newsService.selectCategory == categoria.name)
              ? miTheme.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}
