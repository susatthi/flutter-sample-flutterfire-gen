import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../core/ui/component/button_loading.dart';
import '../../../core/ui/component/riverpod.dart';
import '../state/user_document.dart';
import '../use_case/delete_user.dart';
import '../use_case/update_user_document.dart';

class UserViewPage extends StatelessWidget {
  const UserViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
    return const SingleChildScrollView(
      child: Column(
        children: [
          Gap(32),
          _UidListTile(),
          _NicknameListTile(),
          Gap(32),
          _DeleteUserButton(),
          Gap(32),
        ],
      ),
    );
  }
}

class _UidListTile extends ConsumerWidget {
  const _UidListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(firebaseUserIdProvider);
    return ListTile(
      title: const Text('UID'),
      subtitle: Text(asyncValue.valueOrNull ?? ''),
    );
  }
}

class _NicknameListTile extends ConsumerWidget {
  const _NicknameListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(userDocumentProvider);
    final nickname = asyncValue.valueOrNull?.nickname;
    return ListTile(
      onTap: () => showModalBottomSheet<void>(
        context: context,
        builder: (context) => _UpdateNicknameBottomSheet(
          nickname: nickname,
        ),
      ),
      title: const Text('ニックネーム'),
      subtitle: Text(nickname ?? '未設定'),
    );
  }
}

class _UpdateNicknameBottomSheet extends ConsumerStatefulWidget {
  const _UpdateNicknameBottomSheet({
    required this.nickname,
  });

  final String? nickname;

  @override
  ConsumerState<_UpdateNicknameBottomSheet> createState() =>
      _UpdateNicknameBottomSheetState();
}

class _UpdateNicknameBottomSheetState
    extends ConsumerState<_UpdateNicknameBottomSheet> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.nickname ?? '';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listenAsync(
      updateUserDocumentUseCaseProvider,
      success: (_) => Navigator.of(context).pop(),
    );
    final isLoading = ref.watch(updateUserDocumentUseCaseProvider).isLoading;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                autofocus: true,
              ),
            ),
            TextButton(
              onPressed: () =>
                  ref.read(updateUserDocumentUseCaseProvider.notifier).invoke(
                        nickname: controller.text,
                      ),
              child: isLoading ? const ButtonLoading() : const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeleteUserButton extends ConsumerWidget {
  const _DeleteUserButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listenAsync(deleteUserUseCaseProvider);
    final isLoading = ref.watch(deleteUserUseCaseProvider).isLoading;
    return TextButton(
      onPressed: () => ref.read(deleteUserUseCaseProvider.notifier).invoke(),
      child: isLoading ? const ButtonLoading() : const Text('ユーザー削除'),
    );
  }
}
