import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/ui/component/button_loading.dart';
import '../../../core/ui/component/riverpod.dart';
import '../../../router/router.dart';
import '../data/memo_document.dart';
import '../state/memo_document.dart';
import '../use_case/delete_memo_document.dart';

class MemoIndexPage extends StatelessWidget {
  const MemoIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メモ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => const MemoAddRoute().go(context),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => const UserViewRoute().go(context),
          ),
        ],
      ),
      body: const SafeArea(
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const _MemoListView();
  }
}

class _MemoListView extends ConsumerWidget {
  const _MemoListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(memoDocumentsProvider);
    return asyncValue.whenWidget(
      data: (memoDocuments) {
        if (memoDocuments.isEmpty) {
          return const Center(
            child: Text('メモがありません'),
          );
        }
        return ListView.separated(
          itemCount: memoDocuments.length,
          itemBuilder: (context, index) {
            final memoDocument = memoDocuments[index];
            return _ListTile(
              memoDocument: memoDocument,
            );
          },
          separatorBuilder: (context, index) => const _Divider(),
        );
      },
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.memoDocument,
  });

  final ReadMemoDocument memoDocument;

  @override
  Widget build(BuildContext context) {
    final createdAt = memoDocument.createdAt;
    return ListTile(
      title: Text(memoDocument.text),
      subtitle: Text(
        createdAt != null
            ? '${DateFormat.yMEd('ja').format(createdAt)} '
                '${DateFormat.Hm('ja').format(createdAt)}'
            : '',
      ),
      trailing: _DeleteButton(memoDocument: memoDocument),
    );
  }
}

class _DeleteButton extends ConsumerWidget {
  const _DeleteButton({
    required this.memoDocument,
  });

  final ReadMemoDocument memoDocument;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCaseProvider =
        deleteMemoDocumentUseCaseProvider(memoDocument.memoId);
    ref.listenAsync(useCaseProvider);
    final isLoading = ref.watch(useCaseProvider).isLoading;
    return IconButton(
      onPressed: () => ref.read(useCaseProvider.notifier).invoke(),
      icon: isLoading ? const ButtonLoading() : const Icon(Icons.delete),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 16,
      endIndent: 16,
    );
  }
}
