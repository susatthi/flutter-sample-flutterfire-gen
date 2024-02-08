import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui/component/button_loading.dart';
import '../../../core/ui/component/riverpod.dart';
import '../state/current_memo_document.dart';
import '../state/update_memo_document.dart';
import '../use_case/update_memo_document.dart';

class MemoUpdatePage extends ConsumerWidget {
  const MemoUpdatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(updateMemoDocumentNotifierProvider);
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
      updateMemoDocumentUseCaseProvider,
      success: (_) => context.pop(),
    );
    final isLoading = ref.watch(updateMemoDocumentUseCaseProvider).isLoading;
    return TextButton(
      onPressed: () =>
          ref.read(updateMemoDocumentUseCaseProvider.notifier).invoke(),
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
    final asyncValue = ref.watch(currentMemoDocumentProvider);
    return asyncValue.whenWidget(
      data: (memoDocument) {
        return TextField(
          controller: TextEditingController(text: memoDocument?.text),
          autofocus: true,
          onChanged: (value) => ref
              .read(updateMemoDocumentNotifierProvider.notifier)
              .updateText(value),
        );
      },
      loading: () => const SizedBox(),
    );
  }
}
