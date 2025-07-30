
import 'dart:math';
import 'package:stream_video_flutter/stream_video_flutter.dart';

class StreamVideoInitializer {
  static const _apiKey = 'mmhfdzb5evj2';
  static const _userId = 'Shmi_Skywalker';
  static final _name = 'user_${Random().nextInt(1000)}';
  static const _userToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL3Byb250by5nZXRzdHJlYW0uaW8iLCJzdWIiOiJ1c2VyL1NobWlfU2t5d2Fsa2VyIiwidXNlcl9pZCI6IlNobWlfU2t5d2Fsa2VyIiwidmFsaWRpdHlfaW5fc2Vjb25kcyI6NjA0ODAwLCJpYXQiOjE3NTM3ODU4MDMsImV4cCI6MTc1NDM5MDYwM30.exoOqVXINCGcNZ1ATcbbnKdECj79YxEE6Ro5Nu0LKKE';

  static Future<void> initialize() async {


    StreamVideo(
       _apiKey,
      user: User(info: UserInfo(id: _userId, name: _name)),
      userToken: _userToken,
    );
  }
}
