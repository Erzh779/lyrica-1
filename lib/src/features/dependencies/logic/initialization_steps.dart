import 'dart:async';

import 'package:dart_openai/dart_openai.dart';
import 'package:poem/src/features/auth/controller/auth_controller.dart';
import 'package:poem/src/features/auth/data/auth_repository_supabase.dart';
import 'package:poem/src/features/auth/model/user.dart';
import 'package:poem/src/features/dependencies/model/initialization_progress.dart';
import 'package:poem/src/features/music/data/music_repository.dart';
import 'package:poem/src/features/poems/data/poems_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

/// A function which represents a single initialization step.
typedef StepAction = Future<void>? Function(InitializationProgress progress);

/// A map of initialization steps.
mixin InitializationSteps {
  /// A map of initialization steps.
  final Map<String, StepAction> initializationSteps = {
    'Open AI Key': (progress) {
      OpenAI.apiKey = '';
      return null;
    },
    'Supabase': (progress) async => await supabase.Supabase.initialize(
          url: 'https://hwclviifbmmgbiyyezxt.supabase.co',
          anonKey:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh3Y2x2aWlmYm1tZ2JpeXllenh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY0NzkyOTcsImV4cCI6MjA2MjA1NTI5N30.DRCEIDfcBDDE2231GeqSMyuaQghR0hUthXL8hUXhDhM',
        ),
    'Auth Repository': (progress) async =>
        progress.dependencies.authRepository = AuthRepository$Supabase(),
    'Auth Controller': (progress) async =>
        progress.dependencies.authController = AuthController(
          repository: progress.dependencies.authRepository,
          initialState: AuthState.idle(
            user: User.notAuthenticated(),
          ),
        )..restore(),
    'Poems Repository': (progress) async =>
        progress.dependencies.poemsRepository = PoemsRepository$Supabase(),
    'Music Repository': (progress) async =>
        progress.dependencies.musicRepository = MusicRepository(),
  };
}
