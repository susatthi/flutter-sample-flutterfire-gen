import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// ignore: invalid_use_of_internal_member
mixin UseCase on BuildlessAutoDisposeAsyncNotifier<void> {
  bool _mounted = true;

  @protected
  void setUnmounted() => _mounted = false;

  @protected
  bool get mounted => _mounted;

  @protected
  FutureOr<void> initUseCase() {
    ref.onDispose(setUnmounted);
  }

  @protected
  Future<void> guard(Future<void> Function() future) async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncValue.loading();
    final newState = await AsyncValue.guard(() async {
      return future();
    });
    if (_mounted) {
      state = newState;
    }
  }
}
