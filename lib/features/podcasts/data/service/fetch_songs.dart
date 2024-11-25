import 'dart:convert';
import 'dart:typed_data';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

OnAudioQuery  onAudioQuery = OnAudioQuery();

// Function to request an check storage permission

Future<void> accessstorage() async =>
  await Permission.storage.status.isGranted.then(
    (granted) async {
      if(granted == false){
        // request storage permission and open app settings

        PermissionStatus permissionStatus = 
          await Permission.storage.request();
        if (permissionStatus == PermissionStatus.permanentlyDenied) {
          await openAppSettings();
        }
      }
    }
  );

  Future<Uint8List?> art({required int id}) async {
    return await onAudioQuery.queryArtwork(id, ArtworkType.AUDIO, quality: 100);
  }

  // Function to convert a Uri to an Image

  Future<Uint8List> toImage({required Uri uri}) async{
    return base64.decode(uri.data!.toString().split(',').last);
  }

  //class to fetch songs annd convert them to MediaItem format

  class FetchSongs {

    // static method to excecute fetching songs asynchronously
    static Future<List<MediaItem>> excecute() async {
      
      List<MediaItem> items = [];

      await accessstorage().then(
        (_) async {
          List<SongModel> songs = await onAudioQuery.querySongs();

          for (SongModel song in songs) {
            if(song.isMusic == true){
              Uint8List? uint8list = await art(id: song.id);
              List<int> bytes = [];
              if (uint8list != null){
                bytes = uint8list.toList();


                items.add(
                  MediaItem(
                    id: song.uri!, 
                    title: song.title,
                    artist: song.artist,
                    duration: Duration(microseconds: song.duration!),
                    artUri: uint8list == null ? null : Uri.dataFromBytes(bytes),
                    )
                );
              }
            }
          }
          
        }
      );
    return items;
    }
  }