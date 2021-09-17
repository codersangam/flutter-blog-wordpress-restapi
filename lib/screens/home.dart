import 'package:flutter/material.dart';

import '../wp-api.dart';
import 'package:html/parser.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Blog Wp-Api"),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchPost(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wppost = snapshot.data[index];
                  var imageUrl =
                      wppost['_embedded']['wp:featuredmedia'][0]['source_url'];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.network(imageUrl),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            parse((wppost['title']['rendered']).toString())
                                .documentElement!
                                .text,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(parse((wppost['excerpt']['rendered']).toString())
                              .documentElement!
                              .text),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
