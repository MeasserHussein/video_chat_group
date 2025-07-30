import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

import '../call_screen.dart';

part 'call_state.dart';

class CallCubit extends Cubit<CallState> {
  Call? _call;

  CallCubit() : super(CallInitial());

  Future<void> initAndJoinCall(String callId) async {
    emit(CallLoading());

    final cameraStatus = await Permission.camera.request();
    final micStatus = await Permission.microphone.request();

    if (!cameraStatus.isGranted || !micStatus.isGranted) {
      emit(CallError('Camera and microphone permissions are required.'));
      return;
    }

    _call = StreamVideo.instance.makeCall(
      callType: StreamCallType(),
      id: callId,
    );

    try {
      await _call!.getOrCreate();
      await _call!.join();
      emit(CallJoined(_call!));
    } catch (e) {
      emit(CallError(e.toString()));
    }
  }

  Future<void> leaveCall() async {
    await _call?.leave();
    emit(CallLeft());
  }
}
