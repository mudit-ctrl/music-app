import 'package:flutter/material.dart';
import 'package:musicapp/widget/musictile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Musiclist extends StatefulWidget {
  const Musiclist({super.key});

  @override
  State<Musiclist> createState() => _MusiclistState();
}

class _MusiclistState extends State<Musiclist> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Music'),
        ),
        body: FutureBuilder(
          future: firestore.collection('music-info').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else {
              final data = snapshot.data!.docs;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final docdata = data[index].data();
                  return Musictile(docdata['Artistname'], docdata['Musiclink'],
                      docdata['Poster'], docdata['Songname']);
                },
              );
            }
          },
        ));
  }
}
