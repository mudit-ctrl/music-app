import 'package:flutter/material.dart';
import 'package:musicapp/musicplayer.dart';

class Musictile extends StatefulWidget {
  const Musictile(this.artistname, this.song, this.image, this.songname,
      {super.key});
  final String artistname;
  final String songname;
  final String image;
  final String song;

  @override
  State<Musictile> createState() => _MusictileState();
}

class _MusictileState extends State<Musictile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlayerScreen(
              widget.artistname, widget.song, widget.image, widget.songname),
        ));
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.image,
                      height: 70,
                      width: 70,
                    )),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.songname),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(widget.artistname),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
