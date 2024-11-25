

import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_project/core/widgets/background_widget.dart';
import 'package:podcast_project/features/podcasts/domain/entities/audio_model.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  late final AudioPlayer player;
  Duration _duration = const Duration();
  Duration _position = const Duration();
  int currentIndex = 0;
  int isShow = 0;
  bool isPlaying = false;
  bool isShuffle = false;
  bool isRepeat = false;
  bool _showAppBar = false;
  @override
  void initState() {
    // TODO: implement initState
    initPlayer();
    super.initState();
    _loadDurations();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    player.dispose();
    super.dispose();
  }

  Future<void> _loadDurations() async {
    for (var audio in audioList) {
      final player = AudioPlayer();
      try {
        await player.setSource(
            AssetSource(audio.url));
        await player.resume();
        await Future.delayed(const Duration(
            milliseconds:
            100));
        audio.duration = await player.getDuration();
      } catch (e) {
        print("Erreur lors du chargement de la source audio: $e");
      }
      await player.dispose();
    }
    setState(() {});
  }


  Future initPlayer() async{
    player = AudioPlayer();

    player.onDurationChanged.listen((Duration d ) {
      setState(() => _duration = d);
    });

    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    player.onPlayerComplete.listen((_) {
      setState(() {
        if(_position == _duration) {
          if (isRepeat) {
            stopAudio();
            playAudio(audioList[currentIndex].url);
          } else {
            playNextAudio(audioList);
          }
        }
      });
    });
  }

  Future<void> stopAudio() async{
    setState(() {
      isPlaying = false;
    });
    await player.stop();
  }

  Future<void> playAudio(String url) async{
    setState(() {
      isPlaying = true;
    });
    await player.play(AssetSource(url));
  }

  Future<void> pauseAudio() async {
    setState(() {
      isPlaying = false;
    });
    await player.pause();
  }

  Future<void> playNextAudio(List<AudioModel> audioList) async {

    if (isShuffle) {
      currentIndex = (currentIndex + 1 + Random().nextInt(audioList.length - 1)) % audioList.length;
    } else if (currentIndex < audioList.length - 1) {
      currentIndex++;
    }else if(currentIndex ==audioList.length - 1){
      currentIndex =0;
    }
    await stopAudio();
    await playAudio(audioList[currentIndex].url);
  }

  Future<void> playPreviousAudio(List<AudioModel> audioList) async {
    if(currentIndex > 0){
      currentIndex--;

    }else if (currentIndex == 0){
      currentIndex = audioList.length - 1;
    }
    await stopAudio();
    await playAudio(audioList[currentIndex].url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "PODCASTS",
            style: GoogleFonts.quando(
              textStyle: TextStyle(
                color: Colors.white,
              )
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            gradient: LinearGradient(
              colors: [primary, secondary],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), 
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              
            },
            child: Icon(
              Icons.search, size: 40, color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              isShow == 1 ? Column(
                children: [
                  const Icon(Icons.music_note_outlined, size: 50),
                  const SizedBox(height: 8),
                  Text(
                    audioList[currentIndex].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20  
                    ),
                  ),
                  Slider(value: _position.inSeconds.toDouble(),
                      onChanged: (value) async{
                    await player.seek(Duration(seconds: value.toInt()));
                    setState(() {});
                      },
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    inactiveColor: Colors.deepPurple,
                    activeColor: Colors.deepPurple,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _duration.toString().substring(2, 7),
                          style: TextStyle(
                            color: Colors.deepOrange,
                          )
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isShuffle = !isShuffle;
                          });
                        },
                        icon: Icon(
                          isShuffle ? Icons.shuffle_on : Icons.shuffle,
                          size: 30,
                          color: isShuffle ? Colors.deepOrange : Colors.black,
                        ),
                      ),
                      IconButton(
                          onPressed: (){
                            playPreviousAudio(audioList);
                          },
                          icon: const Icon(Icons.skip_previous, size: 35, color: Colors.black,)
                      ),
                      IconButton(
                          onPressed: () {
                            isPlaying ? pauseAudio() : playAudio(audioList[currentIndex].url);
                          },
                          icon:Icon(
                            isPlaying ? Icons.pause_circle : Icons.play_circle, size: 65, color: Colors.deepOrange,
                          ),
                      ),
                      IconButton(
                          onPressed: () => playNextAudio(audioList),
                          icon: const Icon(Icons.skip_next, size: 35,color: Colors.black,)
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isRepeat = !isRepeat;
                          });
                        },
                        icon: Icon(
                          isRepeat ? Icons.repeat_on : Icons.repeat,
                          size: 30,
                          color: isRepeat ? Colors.deepOrange : Colors.black,
                        ),
                      ),
                    ],
                  ),
        
                ],
              ) : SizedBox.shrink(),
             Container(
                //decoration: BoxDecoration(),
               child: Expanded(
                 child: SafeArea(
                   child: Padding(
                     padding: EdgeInsets.all(2.0),
                     child: Scrollbar(
                       thumbVisibility: true,
                       child: ListView.builder(
                         itemCount: audioList.length,
                         itemBuilder: (BuildContext context, int index) {
                           AudioModel audio = audioList[index];
                           return InkWell(
                             onTap: () {
                               setState(() {
                                 isShow = 1;
                                 currentIndex = index;
                               });

                                playAudio(audioList[index].url);
                             },

                             splashColor: Colors.orange.withOpacity(0.2), // Couleur de l'ondulation
                             highlightColor: Colors.orange.withOpacity(0.3), // Couleur de surbrillance lors du clic
                             child: Container(
                               color: index % 2 == 0 ? Colors.white : Color(0xFFEDE7F6),
                               padding: EdgeInsets.all(16.0),
                               child: Row(
                                 children: [
                                   CircleAvatar(
                                     backgroundImage: AssetImage('assets/images/2.jpg'),
                    
                                     radius: 25,
                                   ),
                                   SizedBox(
                                     width: 10,
                                   ),
                                   Expanded(
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                       
                                            
                                             Text(
                                               audio.title,
                                               maxLines: 1,
                                               overflow: TextOverflow.ellipsis,
                                               style: TextStyle(
                                                   fontSize: 13, fontWeight: FontWeight.bold
                                                   ),
                                             ),
                                           
                                        
                                         Row(
                                           mainAxisAlignment:
                                           MainAxisAlignment.spaceBetween,
                                           children: [
                                             Text(
                                               audio.author,
                                               style: TextStyle(
                                                 fontSize: 15,
                                                 color: Colors.grey,
                                               ),
                                             ),
                                             Text(
                                               _formatDuration(audio.duration),
                                               style: TextStyle(
                                                   fontSize: 15, color: Colors.grey),
                                             )
                                           ],
                                         )
                                       ],
                                     ),
                                   ),
                                   SizedBox(
                                     width: 10,
                                   ),

                                   currentIndex ==index ? Icon(Icons.play_circle) : SizedBox.shrink()
                                 ],
                               ),
                             ),
                           );
                         },
                       ),
                     ),
                   ),
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}


SafeArea _buildTodoListPlay(){
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.all(2.0),
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
          itemCount: audioList.length,
          itemBuilder: (BuildContext context, int index) {
            AudioModel audio = audioList[index];
            return InkWell(
              onTap: () {

              },

              splashColor: Colors.orange.withOpacity(0.2), // Couleur de l'ondulation
              highlightColor: Colors.orange.withOpacity(0.3), // Couleur de surbrillance lors du clic
              child: Container(
                color: index % 2 == 0 ? Colors.white : Color(0xFFEDE7F6),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/2.jpg'),
                      radius: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            audio.title,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                audio.author,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                _formatDuration(audio.duration),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.play_circle)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}



String _formatDuration(Duration? duration) {
  if (duration == null) {
    return 'N/A';
  }
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}