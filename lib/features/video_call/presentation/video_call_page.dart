import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart' hide CallState;
import 'call_screen.dart';
import 'manager/call_cubit.dart';

class VideoCallPage extends StatelessWidget {

  const VideoCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CallCubit>();
    return Scaffold(
      body: Center(
        child: BlocConsumer<CallCubit, CallState>(
          listener: (context,state){
            if(state is CallLoading){
              Center(child: CircularProgressIndicator());
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () async {
                await cubit.initAndJoinCall('test-room');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CallScreen(),
                  ),
                );
              },
              child: const Text('Join Call'),
            );
          },
        ),
      ),
    );
  }
}
