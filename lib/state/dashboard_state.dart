import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_state.g.dart';

@riverpod
class SelectedIndex extends _$SelectedIndex {
  @override
  int build() => 0;

  void set(int value) => state = value;
}