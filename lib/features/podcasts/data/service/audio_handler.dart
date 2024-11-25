
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioHandler  extends BaseAudioHandler with QueueHandler, SeekHandler{

  AudioPlayer audioPlayer = AudioPlayer();

  UriAudioSource _createAudioSource(MediaItem item) {
    return ProgressiveAudioSource(Uri.parse(item.id));
  }

  void _listenForCurrentSongIdenxChanges(){
    audioPlayer.currentIndexStream.listen(
      (index) {
        final playlist = queue.value;
        if( index == null || playlist.isEmpty) return;
        mediaItem.add(playlist[index]);
      
      }
    );
  }

  void _broadcastState(PlaybackEvent event){
    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if(audioPlayer.playing) MediaControl.pause else MediaControl.play,
          MediaControl.skipToNext,
        ],
        systemActions:  const {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
        },
        processingState:  const {
          ProcessingState.idle:  AudioProcessingState.idle,
          ProcessingState.loading:  AudioProcessingState.loading,
          ProcessingState.buffering:  AudioProcessingState.buffering,
          ProcessingState.ready:  AudioProcessingState.ready,
          ProcessingState.completed:  AudioProcessingState.completed,
        }[audioPlayer.processingState]!,
        playing: audioPlayer.playing,
        updatePosition:  audioPlayer.position,
        bufferedPosition: audioPlayer.bufferedPosition,
        speed: audioPlayer.speed,
        queueIndex: event.currentIndex,
      )
    );


    // Function to initialize the songs and set up to audio player

    Future<void> initSongs({ required List<MediaItem> songs})async {

      audioPlayer.playbackEventStream.listen(_broadcastState);

      final audioSource = songs.map(_createAudioSource);

      await audioPlayer.setAudioSource(
        ConcatenatingAudioSource(children: audioSource.toList())
      );

      final newQueue = queue.value..addAll(songs);
      queue.add(newQueue);

      _listenForCurrentSongIdenxChanges();

      audioPlayer.processingStateStream.listen(
        (state) {
          if(state ==  ProcessingState.completed) skipToNext();
        },
      );
    }
  }

  //Play function to start playback
  @override
  Future<void> play() async => audioPlayer.play();


  @override
  Future<void> pause() async => audioPlayer.pause();

  @override
  Future<void> seek(Duration position) async => audioPlayer.seek(position);

  @override
  Future<void> skipToQueueItem(int index) async {
    await audioPlayer.seek(Duration.zero, index: index);
    play();
  }

  @override
  Future<void> SkipToNext() async => audioPlayer.seekToNext();

  @override
  Future<void> skipToPrevious() async => audioPlayer.seekToPrevious();
  

}