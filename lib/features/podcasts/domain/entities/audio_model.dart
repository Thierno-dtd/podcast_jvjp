
import 'package:equatable/equatable.dart';

class AudioModel extends Equatable {
  final String title;
  final String url;
  final String author;
  final String date;
  Duration? duration;

  AudioModel({required this.title, required this.url, required this.author, this.duration, required this.date});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}

List<AudioModel> audioList = [
  AudioModel(title: "plenty", url: "musics/plenty.m4a", author: "pasteur 1", date: "11/11/2024"),
  AudioModel(title: "jolie madame", url: "musics/jolie_madame.m4a",author: "pasteur 2", date: "10/11/2024"),
  AudioModel(title: "Post Malone congratulations", url: "musics/congratulations.mp3", author: "pasteur 1", date: "09/11/2024"),
  AudioModel(title: "plenty", url: "musics/plenty.m4a", author: "pasteur 1", date: "11/11/2024"),
  AudioModel(title: "jolie madame", url: "musics/jolie_madame.m4a",author: "pasteur 2", date: "11/11/2024"),
  AudioModel(title: "Post Malone congratulations", url: "musics/congratulations.mp3", author: "pasteur 1", date: "11/11/2024")

];