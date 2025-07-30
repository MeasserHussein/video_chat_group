import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart' show StreamCallContainer, StreamCallContent, ToggleMicrophoneOption, ToggleCameraOption, LeaveCallOption, StreamCallControls, CallConnectOptions;

import 'manager/call_cubit.dart';


class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CallCubit, CallState>(
            builder: (context, state) {
              if (state is CallLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CallJoined) {
                final call = state.call;
                return StreamCallContainer(

                  call: call,
                  callContentBuilder: (_, __, callState) {
                    final localParticipant = callState.localParticipant;
                    if (localParticipant == null) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return StreamCallContent(
                      callAppBarBuilder: (_, __, ___) =>  PreferredSize(
                        preferredSize: Size.zero,
                        child: SizedBox.shrink(),
                      ),
                      call: call,
                      callState: callState,
                      callControlsBuilder: (context, call, callState) {
                        return StreamCallControls(
                          options: [
                            ToggleMicrophoneOption(
                              call: call,
                              localParticipant: localParticipant,
                            ),
                            ToggleCameraOption(
                              call: call,
                              localParticipant: localParticipant,
                            ),

                            LeaveCallOption(
                              call: call,
                              onLeaveCallTap: () {
                                SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              } else if (state is CallError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const Center(child: Text('Not in call'));
              }
            },
          ),
      ),
    );

  }
}
