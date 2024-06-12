import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen(this.artistname, this.song, this.image, this.songname,
      {super.key});
  final String artistname;
  final String songname;
  final String image;
  final String song;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late AudioPlayer player;
  bool isplaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.durationStream.listen((event) {
      setState(() {
        duration = event!;
      });
    });
    player.positionStream.listen((event) {
      setState(() {
        position = event;
      });
    });
    player.setUrl(widget.song).then((_) {});
  }

  void playpauseaudio() {
    if (isplaying) {
      player.pause();
    } else {
      player.play();
    }
    setState(() {
      isplaying = !isplaying;
    });
  }

  void seekForward() {
    final newPosition = position + const Duration(seconds: 10);
    if (newPosition < duration) {
      player.seek(newPosition);
    }
  }

  void seekBackward() {
    final newPosition = position - const Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      player.seek(newPosition);
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Now Playing')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.image,
                  height: 180,
                  width: 180,
                )),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${widget.songname} by ${widget.artistname}',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Text(
              '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
            ),
            Slider(
              min: 0.0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                final newPosition = Duration(seconds: value.toInt());
                player.seek(newPosition);
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.replay_10),
                  iconSize: 48.0,
                  onPressed: seekBackward,
                ),
                IconButton(
                  icon: Icon(isplaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 64.0,
                  onPressed: playpauseaudio,
                ),
                IconButton(
                  icon: Icon(Icons.forward_10),
                  iconSize: 48.0,
                  onPressed: seekForward,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
