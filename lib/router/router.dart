import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../feature/memo/state/current_memo_document.dart';
import '../feature/memo/ui/memo_create_page.dart';
import '../feature/memo/ui/memo_index_page.dart';
import '../feature/memo/ui/memo_update_page.dart';
import '../feature/user/state/is_signed_in.dart';
import '../feature/user/ui/sign_up_page.dart';
import '../feature/user/ui/user_view_page.dart';

part 'router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final router = GoRouter(
    initialLocation: '/',
    routes: $appRoutes,
    redirect: (context, state) async {
      final isSignedIn = await ref.read(isSignedInProvider.future);
      if (!isSignedIn) {
        return const SignUpRoute().location;
      }
      return null;
    },
  );
  ref.onDispose(router.dispose);
  return router;
}

@TypedGoRoute<SignUpRoute>(
  path: '/sign-up',
)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpPage();
  }
}

@TypedGoRoute<MemoIndexRoute>(
  path: '/',
  routes: [
    TypedGoRoute<MemoCreateRoute>(
      path: 'memo/create',
    ),
    TypedGoRoute<MemoUpdateRoute>(
      path: 'memo/update/:memoId',
    ),
    TypedGoRoute<UserViewRoute>(
      path: 'user',
    ),
  ],
)
class MemoIndexRoute extends GoRouteData {
  const MemoIndexRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MemoIndexPage();
  }
}

class MemoCreateRoute extends GoRouteData {
  const MemoCreateRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MemoCreatePage();
  }
}

class MemoUpdateRoute extends GoRouteData {
  const MemoUpdateRoute({
    required this.memoId,
  });

  final String memoId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProviderScope(
      overrides: [
        currentMemoIdProvider.overrideWithValue(memoId),
      ],
      child: const MemoUpdatePage(),
    );
  }
}

class UserViewRoute extends GoRouteData {
  const UserViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserViewPage();
  }
}
