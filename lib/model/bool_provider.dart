class BoolProvider {
  int rebuildTimes = 0;
  bool? _isIt;
  String? key;
  BoolProvider(this._isIt, this.key);
  toSomething(bool? sth) {
    _isIt = sth;
    rebuildTimes++;
  }

  toReverse() {
    _isIt = !_isIt!;
    rebuildTimes++;
  }

  toTrue() {
    _isIt = true;
    rebuildTimes++;
  }

  toFalse() {
    _isIt = false;
    rebuildTimes++;
  }

  get value {
    /// uncomment the line below to check how many rebuilds happens
    // debugPrint('rebulid:${rebuildTimes.toString()} for ${key ?? 'sth'}');
    return _isIt;
  }
}
