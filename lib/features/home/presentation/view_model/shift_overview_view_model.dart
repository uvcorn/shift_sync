import 'package:flutter_riverpod/legacy.dart';

class ShiftItem {
  final String name;
  final String date;

  ShiftItem({required this.name, required this.date});
}

class ShiftOverviewState {
  final List<ShiftItem> shifts;

  ShiftOverviewState({required this.shifts});

  ShiftOverviewState copyWith({List<ShiftItem>? shifts}) {
    return ShiftOverviewState(shifts: shifts ?? this.shifts);
  }
}

class ShiftOverviewViewModel extends StateNotifier<ShiftOverviewState> {
  ShiftOverviewViewModel()
    : super(
        ShiftOverviewState(
          shifts: [
            ShiftItem(name: "Morning Shift", date: "12 Jan 2025"),
            ShiftItem(name: "Evening Shift", date: "13 Jan 2025"),
            ShiftItem(name: "Night Shift", date: "14 Jan 2025"),
            ShiftItem(name: "Evening Shift", date: "15 Jan 2025"),
            ShiftItem(name: "Night Shift", date: "16 Jan 2025"),
          ],
        ),
      );
}

final shiftOverviewProvider =
    StateNotifierProvider<ShiftOverviewViewModel, ShiftOverviewState>(
      (ref) => ShiftOverviewViewModel(),
    );
