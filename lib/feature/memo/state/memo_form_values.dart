import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/memo_document.dart';

part 'memo_form_values.freezed.dart';
part 'memo_form_values.g.dart';

@freezed
class MemoFormValues with _$MemoFormValues {
  const factory MemoFormValues({
    @Default('') String text,
  }) = _MemoFormValues;
  const MemoFormValues._();

  CreateMemoDocument toCreateMemoDocument() => CreateMemoDocument(
        text: text,
      );
}

@riverpod
class MemoFormValuesNotifier extends _$MemoFormValuesNotifier {
  @override
  MemoFormValues build() {
    return const MemoFormValues();
  }

  void updateText(String text) {
    state = state.copyWith(text: text);
  }
}
