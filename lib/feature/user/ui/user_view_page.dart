import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/data/firebase/firebase_auth.dart';
import '../../../core/ui/component/button_loading.dart';
import '../../../core/ui/component/riverpod.dart';
import '../use_case/sign_out.dart';

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
          Gap(32),
          _SignOutButton(),
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
    final asyncValue = ref.watch(firebaseUserProvider);
    return ListTile(
      title: const Text('UID'),
      subtitle: Text(asyncValue.valueOrNull?.uid ?? ''),
    );
  }
}

class _SignOutButton extends ConsumerWidget {
  const _SignOutButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listenAsync(signOutUseCaseProvider);
    final isLoading = ref.watch(signOutUseCaseProvider).isLoading;
    return TextButton(
      onPressed: () => ref.read(signOutUseCaseProvider.notifier).invoke(),
      child: isLoading ? const ButtonLoading() : const Text('サインアウト'),
    );
  }
}
