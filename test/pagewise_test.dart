import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Pagewise Demo',
      home: new MyHomePage(),
    );
  }
}
// gradient: SweepGradient(
//   colors: [
//     Colors.red,
//     Colors.yellow,
//     Colors.green,
//     Colors.blue,
//   ],
//   stops: [0.0, 0.25, 0.5, 1.0],
// ),
// gradient: RadialGradient(
//   center: Alignment(0.5, 0.5),
//   radius: 0.8,
//   colors: [
//     Colors.blue,
//     Colors.green,
//     Colors.red,
//   ],
// ),
// image: DecorationImage(
//   image: NetworkImage(""),
//   fit: BoxFit.cover
// ),
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Pagewise'),
            bottom: TabBar(tabs: [
              Tab(
                text: 'List',
              ),
              Tab(text: 'Grid'),
              Tab(text: 'SliverList'),
              Tab(text: 'SliverGrid')
            ]),
          ),
          body: TabBarView(
            children: [
              PagewiseListViewExample(),
              PagewiseGridViewExample(),
              PagewiseSliverListExample(),
              PagewiseSliverGridExample()
            ],
          )),
    );
  }
}

class PagewiseGridViewExample extends StatelessWidget {
  static const int PAGE_SIZE = 6;

  @override
  Widget build(BuildContext context) {
    return PagewiseGridView<ImageModel>.count(
      pageSize: PAGE_SIZE,
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 0.555,
      padding: EdgeInsets.all(15.0),
      itemBuilder: this._itemBuilder,
      pageFuture: (pageIndex) =>
          BackendService.getImages(pageIndex! * PAGE_SIZE, PAGE_SIZE),
    );
  }

  Widget _itemBuilder(context, ImageModel entry, _) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[600]!),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      image: DecorationImage(
                          image: NetworkImage(entry.thumbnailUrl!),
                          fit: BoxFit.fill)),
                ),
              ),
              SizedBox(height: 8.0),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                        height: 30.0,
                        child: SingleChildScrollView(
                            child: Text(entry.title!,
                                style: TextStyle(fontSize: 12.0))))),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  entry.id,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8.0)
            ]));
  }
}

class PagewiseListViewExample extends StatelessWidget {
  static const int PAGE_SIZE = 10;

  @override
  Widget build(BuildContext context) {
    return PagewiseListView<PostModel>(
        pageSize: PAGE_SIZE,
        itemBuilder: this._itemBuilder,
        pageFuture: (pageIndex) =>
            BackendService.getPosts(pageIndex! * PAGE_SIZE, PAGE_SIZE)
    );
  }

  Widget _itemBuilder(context, PostModel entry, _) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.brown[200],
          ),
          title: Text(entry.title!),
          subtitle: Text(entry.body!),
        ),
        Divider()
      ],
    );
  }
}

class PagewiseSliverListExample extends StatelessWidget {
  static const int PAGE_SIZE = 6;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        title: Text('This is a sliver app bar'),
        snap: true,
        floating: true,
      ),
      PagewiseSliverList<PostModel>(
          pageSize: PAGE_SIZE,
          itemBuilder: this._itemBuilder,
          pageFuture: (pageIndex) =>
              BackendService.getPosts(pageIndex! * PAGE_SIZE, PAGE_SIZE))
    ]);
  }

  Widget _itemBuilder(context, PostModel entry, _) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.brown[200],
          ),
          title: Text(entry.title!),
          subtitle: Text(entry.body!),
        ),
        Divider()
      ],
    );
  }
}

class PagewiseSliverGridExample extends StatelessWidget {
  static const int PAGE_SIZE = 6;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('This is a sliver app bar'),
          floating: true,
          snap: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: PagewiseSliverGrid<ImageModel>.count(
            pageSize: 6,
            crossAxisCount: 3,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.555,
            itemBuilder: this._itemBuilder,
            pageFuture: (pageIndex) =>
                BackendService.getImages(pageIndex! * PAGE_SIZE, PAGE_SIZE),
          ),
        )
      ],
    );
  }

  Widget _itemBuilder(context, ImageModel entry, _) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[600]!),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      image: DecorationImage(
                          image: NetworkImage(entry.thumbnailUrl!),
                          fit: BoxFit.fill)),
                ),
              ),
              SizedBox(height: 8.0),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                        height: 30.0,
                        child: SingleChildScrollView(
                            child: Text(entry.title!,
                                style: TextStyle(fontSize: 12.0))))),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  entry.id,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8.0)
            ]));
  }
}

class BackendService {
  static Future<List<PostModel>> getPosts(offset, limit) async {
    final responseBody = (await Dio().get(
      'https://jsonplaceholder.typicode.com/posts',
      queryParameters: {
        '_start': offset,
        '_limit': limit,
      },
    )).data;

    // The response body is an array of items
    var postList = PostModel.fromJsonList(responseBody);
    if(postList == null) {
      postList = List<PostModel>.empty();
    }
    return postList;
  }

  static Future<List<ImageModel>> getImages(offset, limit) async {
    final responseBody = (await Dio().get(
      'https://jsonplaceholder.typicode.com/photos',
      queryParameters: {
        '_start': offset,
        '_limit': limit,
      },
    )).data;

    // The response body is an array of items.
    var imageList = ImageModel.fromJsonList(responseBody);
    if(imageList == null) {
      imageList = List<ImageModel>.empty();
    }
    return imageList;
  }
}

class PostModel {
  String? title;
  String? body;

  PostModel.fromJson(obj) {
    this.title = obj['title'];
    this.body = obj['body'];
  }

  static List<PostModel>? fromJsonList(jsonList) {
    return jsonList.map<PostModel>((obj) => PostModel.fromJson(obj)).toList();
  }
}

class ImageModel {
  String? title;
  late String id;
  String? thumbnailUrl;

  ImageModel.fromJson(obj) {
    this.title = obj['title'];
    this.id = obj['id'].toString();
    this.thumbnailUrl = obj['thumbnailUrl'];
  }

  static List<ImageModel>? fromJsonList(jsonList) {
    return jsonList.map<ImageModel>((obj) => ImageModel.fromJson(obj)).toList();
  }
}
class DragToMoveArea {
/*
  void _localNot() {
    final notification = LocalNotification(
      // 用来生成通用唯一识别码
      identifier: '3025885',
      title: '测试',
      subtitle: '测试-YaJie',
      body: '桃之夭夭，灼灼其华。之子于归，宜其室家。\n桃之夭夭，有蕡其实。之子于归，宜其家室。\n桃之夭夭，其叶蓁蓁。之子于归，宜其家人。',
      // 用来设置是否静音
      silent: true,
      actions: [
        LocalNotificationAction(text: '测试1'),
        LocalNotificationAction(text: '测试2'),
      ],
    );
    notification.onShow = () {
      BotToast.showText(text: '显示了一条通知');
    };
    notification.onClose = (vale) {
      BotToast.showText(text: '通知已经关闭');
    };
    notification.onClick = () {
      BotToast.showText(text: '通知被点击了');
    };
    notification.onClickAction = (index) {
      BotToast.showText(text: '你点击了通知的第$index个选项');
    };
    notification.show();
  }
 */
}
