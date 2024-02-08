import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dialog.dart';

extension WidgetRefX on WidgetRef {
  /// listen()のAsyncValue版
  void listenAsync<T>(
    ProviderListenable<AsyncValue<T>> provider, {
    void Function(T data)? success,
    void Function()? loading,
  }) {
    listen<AsyncValue<T>>(
      provider,
      (prev, next) async {
        await next.when(
          data: (data) {
            success?.call(data);
          },
          // エラーが起きたらダイアログメッセージを表示する。
          error: (err, stack) => showDialog<void>(
            context: context,
            builder: (context) => ErrorDialog(error: err),
          ),
          loading: () {
            loading?.call();
          },
        );
      },
      // エラーが起きたらダイアログメッセージを表示する。
      onError: (err, stack) => showDialog<void>(
        context: context,
        builder: (context) => ErrorDialog(error: err),
      ),
    );
  }
}

extension AsyncValueXX<T> on AsyncValue<T> {
  /// Widget用のwhen()
  Widget whenWidget({
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    required Widget Function(T data) data,
    Widget Function(Object error, StackTrace stackTrace)? error,
    Widget Function()? loading,
  }) {
    return when(
      skipError: skipError,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipLoadingOnReload: skipLoadingOnReload,
      data: data,
      // エラーが起きても何も表示しない。
      error: error ?? (err, stack) => const SizedBox(),
      loading: loading ??
          () => const Center(
                child: CircularProgressIndicator(),
              ),
    );
  }
}
