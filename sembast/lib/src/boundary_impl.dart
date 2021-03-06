import 'package:sembast/sembast.dart';
import 'package:sembast/src/api/boundary.dart';
import 'package:sembast/src/record_impl.dart';

/// Boundary implementation.
class SembastBoundary implements Boundary {
  /// The snapshot if any.
  final RecordSnapshot snapshot;

  /// The values if any.
  List<dynamic> values;

  ///
  /// default is [ascending] = true
  ///
  /// user withParam
  SembastBoundary({RecordSnapshot record, bool include, this.values})
      : include = include == true,
        snapshot = makeImmutableRecordSnapshot(record);

  Map<String, dynamic> _toDebugMap() {
    final debugMap = <String, dynamic>{};
    if (values != null) {
      debugMap['values'] = values.toString();
    } else if (snapshot != null) {
      debugMap['snapshot'] = snapshot.toString();
    }
    debugMap['include'] = include;
    return debugMap;
  }

  @override
  String toString() {
    return _toDebugMap().toString();
  }

  @override
  bool include;
}
