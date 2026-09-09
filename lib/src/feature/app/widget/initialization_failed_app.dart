import 'package:material_ui/material_ui.dart';

class const InitializationFailedApp({
  required final Object error,
  required final StackTrace stackTrace,
  final Future<void> Function()? onRetryInitialization,
  super.key,
}) extends StatefulWidget {
  @override
  State<InitializationFailedApp> createState() => _InitializationFailedAppState();
}

class _InitializationFailedAppState() extends State<InitializationFailedApp> {
  final _inProgress = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _inProgress.dispose();
    super.dispose();
  }

  Future<void> _retryInitialization() async {
    _inProgress.value = true;
    await widget.onRetryInitialization?.call();
    _inProgress.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme typography = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Initialization failed', style: typography.headlineMedium),
                  if (widget.onRetryInitialization != null)
                    IconButton(icon: const Icon(Icons.refresh), onPressed: _retryInitialization),
                ],
              ),
              const SizedBox(height: 16),
              Text('${widget.error}', style: typography.bodyLarge?.copyWith(color: colorScheme.error)),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text('${widget.stackTrace}', style: typography.bodyLarge),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
