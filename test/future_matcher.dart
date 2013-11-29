part of all_tests;

/** A matcher for Future types. */
const isFuture = const _IsFuture();

class _IsFuture extends TypeMatcher {
  const _IsFuture() : super("Future");
  bool matches(item, Map matchState) => item is Future;
}