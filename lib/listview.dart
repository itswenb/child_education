import 'package:flutter/material.dart';
import './post_show.dart';
import './post.dart';

class BigCategory extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
        // color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Material(
          child: InkWell(
            child: Text(
              titles[index],
              style: TextStyle(fontSize: 23, color: Colors.black87),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text('${titles[index]}'),
                          elevation: 0.0,
                        ),
                        body: ListViewDemo(bigIndex: index,),
                      )));
            },
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: _itemBuilder,
    );
  }
}

class ListViewDemo extends StatelessWidget {

  final int bigIndex;

  ListViewDemo({
    @required
    this.bigIndex,
  });

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child:
                        Image.network(posts[bigIndex][index].imageUrl, fit: BoxFit.cover),
                  ),
                  SizedBox(height: 16.0),
                  Text(posts[bigIndex][index].title,
                      style: Theme.of(context).textTheme.title),
                  Text(posts[bigIndex][index].author,
                      style: Theme.of(context).textTheme.subhead),
                  SizedBox(height: 16.0),
                ],
              ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PostShow(post: posts[bigIndex][index]))
                  );
                }
              ),
            ),
          )]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts[bigIndex].length,
      itemBuilder: _listItemBuilder,
    );
  }
}
