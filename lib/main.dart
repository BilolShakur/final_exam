import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_exam/view/screens/page_view.dart';
import 'package:final_exam/view/bloc/image_posst_bloc.dart';
import 'package:final_exam/view/bloc/image_posst_event.dart';
import 'package:final_exam/view_model/posts_reposotory.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (_) =>
              PostBloc(repository: PostRepository())..add(FetchPosts()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: InstagramFeedScreen(),
      ),
    );
  }
}
