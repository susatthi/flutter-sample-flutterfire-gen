import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/ui/component/button_loading.dart';
import '../../../core/ui/component/riverpod.dart';
import '../state/memo_form_values.dart';
import '../use_case/add_memo_document.dart';

class MemoAddPage extends StatelessWidget {
  const MemoAddPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      addMemoDocumentUseCaseProvider,
      success: (_) => context.pop(),
    );
    final isLoading = ref.watch(addMemoDocumentUseCaseProvider).isLoading;
    return TextButton(
      onPressed: () =>
          ref.read(addMemoDocumentUseCaseProvider.notifier).invoke(),
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
          _NicknameTextField(),
        ],
      ),
    );
  }
}

class _NicknameTextField extends ConsumerWidget {
  const _NicknameTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(memoFormValuesNotifierProvider);
    return TextField(
      autofocus: true,
      onChanged: (value) =>
          ref.read(memoFormValuesNotifierProvider.notifier).updateText(value),
    );
  }
}
