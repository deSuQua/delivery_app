import 'package:delivery_app/src/feature/app/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  final supabase = await Supabase.initialize(
    url: 'https://wsqtteblpxjgionudxbo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndzcXR0ZWJscHhqZ2lvbnVkeGJvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTAyMTg1MDksImV4cCI6MjAyNTc5NDUwOX0.i-gRabXdyySwEzvM_lzA00yhKp4r47eq1_u8WTv3t3c',
  );

  final localStorage = await SharedPreferences.getInstance();

  runApp(
    App(
      localStorage: localStorage,
      supabase: supabase,
    ),
  );
}
