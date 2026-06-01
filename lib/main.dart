import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_gallery/core/theme/app_theme.dart';

import 'package:picsum_gallery/features/gallery/presentation/bloc/photo_bloc.dart';
import 'package:picsum_gallery/features/splash/presentation/pages/splash_page.dart';
import 'package:picsum_gallery/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencied();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PhotoBloc>(),
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}

// Save favorite locally
// Using Hive/shared_preferences. ,   README
//  Offline support

// Git cleanup
// Screenshots
// Final testing

//  Debounced search
//  SliverAppBar
//  Cached search results
//  Favorites
//  Dark mode
//  Skeleton loaders
//  Animated transitions
