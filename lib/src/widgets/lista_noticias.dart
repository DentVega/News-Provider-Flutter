import 'package:flutter/material.dart';
import 'package:newsprovider/src/models/news_models.dart';
import 'package:newsprovider/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> notificas;

  const ListaNoticias(this.notificas);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.notificas.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(noticia: this.notificas[index], index: index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({@required this.noticia, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _TargetaTopBar(noticia, index),
          _TargetaTitulo(noticia),
          _TargetaImagen(noticia),
          _TargetaBody(noticia),
          _TargetaBotones(),
          SizedBox(
            height: 10,
          ),
          Divider()
        ],
      ),
    );
  }
}

class _TargetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: miTheme.accentColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10,),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _TargetaBody extends StatelessWidget {
  final Article noticia;

  const _TargetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description != null ? noticia.description : ''),
    );
  }
}

class _TargetaImagen extends StatelessWidget {
  final Article noticia;

  const _TargetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (noticia.urlToImage != null)
              ? FadeInImage(
                  placeholder: AssetImage('assets/giphy.gif'),
                  image: NetworkImage(noticia.urlToImage))
              : Image(
                  image: AssetImage('assets/no-image.png'),
                ),
        ),
      ),
    );
  }
}

class _TargetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TargetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TargetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TargetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}.',
            style: TextStyle(color: miTheme.accentColor),
          ),
          Text('${noticia.source.name}')
        ],
      ),
    );
  }
}
