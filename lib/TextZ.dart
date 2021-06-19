import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_extras/source/date_time_extensions.dart';

class PersistedStringCache {
  int _limit;
  String _cacheId;
  String _text;
  LinkedHashMap<String, dynamic> _cacheMap = LinkedHashMap();

  PersistedStringCache({String? text, int limit = 10, required String cacheId})
      : _text = text ?? '',
        _limit = limit,
        _cacheId = cacheId,
        assert(limit > 1),
        assert(cacheId.isNotEmpty);

  String get text {
    _add(_text);
    return _text;
  }

  set text(String newValue) => _text = newValue;

  List<String> cachedItems() {
    final List<String> result = [];
    _cacheMap.forEach((key, value) => result.add(value));
    final str = json.encode(_cacheMap);
    debugPrint('$str');
    _cacheMap = json.decode(str);
    return result;
  }

  void _add(String item) {
    if (item.isEmpty) return;
    _cacheMap[DateTimeExtension.unique().toIso8601String()] = item;

    /// Sort keys(aka timestamp) from most-to-least recent
    List<String> keyList = _cacheMap.keys.toList(growable: true)
      ..sort(
        (k1, k2) => _cacheMap[k2]!.compareTo(_cacheMap[k1]!), //k2 compareTo k1
      );

    /// remove the oldest when length exceeds limit
    while (keyList.length > _limit) {
      _cacheMap.remove(keyList.last);
      keyList.removeLast();
    }

    _cacheMap = LinkedHashMap.fromIterable(keyList, key: (k) => k, value: (k) => _cacheMap[k]!);
  }
}

////////////////////////////////////////////////////////////////////////
class TextEditingControllerWithCache extends TextEditingController {
  final int limit;
  final String cacheId;
  LinkedHashMap<String, String> _cacheMap = LinkedHashMap();

  TextEditingControllerWithCache({String? text, this.limit = 10, required this.cacheId})
      : assert(limit > 1),
        assert(cacheId.isNotEmpty),
        super(text: text);

  String get text {
    _add(super.text);
    return super.text;
  }

  @override
  dispose() {
    super.dispose();
  }

  void _add(String item) {
    PersistedStringCache(cacheId: 'Fi');
    if (item.isEmpty) return;
    _cacheMap[DateTime.now().toUtc().toIso8601String()] = item;

    /// Sort keys(aka timestamp) from most-to-least recent
    List<String> keyList = _cacheMap.keys.toList(growable: false)
      ..sort(
        (k1, k2) => _cacheMap[k2]!.compareTo(_cacheMap[k1]!), //k2 compareTo k1
      );

    /// remove the oldest when length exceeds limit
    while (keyList.length > limit) {
      _cacheMap.remove(keyList.last);
      keyList.removeLast();
    }
  }
}
