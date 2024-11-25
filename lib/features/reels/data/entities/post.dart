import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String imagePath; // Image de profil
  final String name; // Nom du postulant
  final String subtitle; // Sous-titre du postulant
  final String postContent; // Lien de la photo ou vidéo
  final bool isVideo; // Pour distinguer entre photo et vidéo

  const Post({
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.postContent,
    this.isVideo = false, // Par défaut, c'est une image
  });
  
  @override
  // TODO: implement props
  List<Object?> get props =>  [imagePath, name, subtitle, postContent, isVideo];

  factory Post.fromMap(Map<String, dynamic> json) {
    return Post(
      imagePath: json['imagePath']?? "",
      name: json['name'] ?? "",
      subtitle: json['subtitle']?? "",
      postContent: json['postContent']?? "",
      isVideo: json['isVideo']?? false,
    );
  }

}