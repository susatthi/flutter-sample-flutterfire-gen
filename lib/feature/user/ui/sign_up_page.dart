import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/component/button_loading.dart';
import '../../../core/ui/component/riverpod.dart';
import '../use_case/sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SignUpButton(),
        ],
      ),
    );
  }
}

class _SignUpButton extends ConsumerWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listenAsync(signUpUseCaseProvider);
    final isLoading = ref.watch(signUpUseCaseProvider).isLoading;
    return TextButton(
      onPressed: () => ref.read(signUpUseCaseProvider.notifier).invoke(),
      child: isLoading ? const ButtonLoading() : const Text('サインアップ'),
    );
  }
}
