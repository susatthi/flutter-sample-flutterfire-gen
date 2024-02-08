import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui/component/button_loading.dart';
import '../../../core/ui/component/riverpod.dart';
import '../state/create_memo_document.dart';
import '../use_case/create_memo_document.dart';

class MemoCreatePage extends ConsumerWidget {
  const MemoCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(createMemoDocumentNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          _SaveButton(),
        ],
      ),
      body: const SafeArea(
        child: _Body(),
      ),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listenAsync(
      createMemoDocumentUseCaseProvider,
      success: (_) => context.pop(),
    );
    final isLoading = ref.watch(createMemoDocumentUseCaseProvider).isLoading;
    return TextButton(
      onPressed: () =>
          ref.read(createMemoDocumentUseCaseProvider.notifier).invoke(),
      child: isLoading ? const ButtonLoading() : const Text('保存'),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _MemoTextField(),
        ],
      ),
    );
  }
}

class _MemoTextField extends ConsumerWidget {
  const _MemoTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      autofocus: true,
      onChanged: (value) => ref
          .read(createMemoDocumentNotifierProvider.notifier)
          .updateText(value),
    );
  }
}
