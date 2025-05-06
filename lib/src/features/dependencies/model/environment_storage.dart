/// {@template environment_storage}
/// An interface for storing environment variables.
/// {@endtemplate}
abstract class IEnvironmentStorage {
  /// Sentry DSN.
  String get sentryDsn;

  /// Database name.
  String get databaseName;

  /// Supabase URL.
  String get supabaseUrl;

  /// Supabase key.
  String get supabaseKey;
}

/// {@template environment_storage}
/// A class which stores environment variables.
/// {@endtemplate}
class EnvironmentStorage implements IEnvironmentStorage {
  /// {@macro environment_storage}
  const EnvironmentStorage();

  @override
  String get sentryDsn => const String.fromEnvironment(
        'SENTRY_DSN',
      );

  @override
  String get databaseName => const String.fromEnvironment(
        'DATABASE_NAME',
        defaultValue: 'poem_database',
      );

  @override
  String get supabaseUrl => const String.fromEnvironment(
        'SUPABASE_URL',
      );

  @override
  String get supabaseKey => const String.fromEnvironment(
        'SUPABASE_KEY',
      );
}
