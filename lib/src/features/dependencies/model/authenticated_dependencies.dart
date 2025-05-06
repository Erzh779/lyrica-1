import 'package:poem/src/features/music/controller/music_list_controller.dart';
import 'package:poem/src/features/poems/controller/poems_controller.dart';

/// {@template authenticated_dependencies}
/// AuthenticatedDependencies container
/// {@endtemplate}
class AuthenticatedDependencies {
  /// Poems controller
  late final PoemsController poemsController;

  /// Music list controller
  late final MusicListController musicListController;
}
