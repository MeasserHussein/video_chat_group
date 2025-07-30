import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_task/features/video_call/presentation/manager/call_cubit.dart';

import 'core/unit/service.dart';
import 'features/video_call/presentation/video_call_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StreamVideoInitializer.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CallCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Video Call Auto Join',
        home: VideoCallPage(),
      ),
    );
  }
}




