# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Test Commands
- Run tests: `dart test`
- Run a single test: `dart test test/civitai_api_test.dart`
- Format code: `dart format .`
- Analyze code: `dart analyze`
- Build package: `dart pub get`

## Code Style Guidelines
- **Imports**: Organize imports by library type (dart:, package:, relative)
- **Formatting**: Use 2-space indentation and single quotes for strings
- **Types**: Use strong typing with explicit return types and parameter types
- **Naming**: Use camelCase for variables/methods, PascalCase for classes, snake_case for files
- **Error Handling**: Return typed errors via exception hierarchy in src/exceptions/
- **Documentation**: Every public API must have dartdoc comments
- **Repository Pattern**: Follow the repository pattern for API endpoint implementations
- **Null Safety**: Use proper null safety with nullable types (Type?) and required named parameters

Follow all Dart lint rules specified in analysis_options.yaml when making changes.