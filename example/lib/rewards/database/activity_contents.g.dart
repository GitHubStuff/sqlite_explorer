// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_contents.dart';

// **************************************************************************
// DriftGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ActivityContent extends DataClass implements Insertable<ActivityContent> {
  final int id;
  final String activityId;
  final double amount;
  final String confirmationCancel;
  final String confirmationSave;
  final String confirmationTitle;
  final String dateCompleteCaption;
  final String dateFormat;
  final String details;
  final String imageUrl;
  final String language;
  final String rewardType;
  final int sequences;
  final String setDateCaption;
  final String spinnerMessage;
  final String title;
  final String validFrom;
  final String validUntil;
  ActivityContent(
      {required this.id,
      required this.activityId,
      required this.amount,
      required this.confirmationCancel,
      required this.confirmationSave,
      required this.confirmationTitle,
      required this.dateCompleteCaption,
      required this.dateFormat,
      required this.details,
      required this.imageUrl,
      required this.language,
      required this.rewardType,
      required this.sequences,
      required this.setDateCaption,
      required this.spinnerMessage,
      required this.title,
      required this.validFrom,
      required this.validUntil});
  factory ActivityContent.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ActivityContent(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      activityId: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}activity_id'])!,
      amount: const RealType().mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      confirmationCancel: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}confirmation_cancel'])!,
      confirmationSave: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}confirmation_save'])!,
      confirmationTitle: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}confirmation_title'])!,
      dateCompleteCaption: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}date_complete_caption'])!,
      dateFormat: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}date_format'])!,
      details: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}details'])!,
      imageUrl: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}image_url'])!,
      language: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}language'])!,
      rewardType: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}reward_type'])!,
      sequences: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}sequences'])!,
      setDateCaption: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}set_date_caption'])!,
      spinnerMessage: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}spinner_message'])!,
      title: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      validFrom: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}valid_from'])!,
      validUntil: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}valid_until'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['activity_id'] = Variable<String>(activityId);
    map['amount'] = Variable<double>(amount);
    map['confirmation_cancel'] = Variable<String>(confirmationCancel);
    map['confirmation_save'] = Variable<String>(confirmationSave);
    map['confirmation_title'] = Variable<String>(confirmationTitle);
    map['date_complete_caption'] = Variable<String>(dateCompleteCaption);
    map['date_format'] = Variable<String>(dateFormat);
    map['details'] = Variable<String>(details);
    map['image_url'] = Variable<String>(imageUrl);
    map['language'] = Variable<String>(language);
    map['reward_type'] = Variable<String>(rewardType);
    map['sequences'] = Variable<int>(sequences);
    map['set_date_caption'] = Variable<String>(setDateCaption);
    map['spinner_message'] = Variable<String>(spinnerMessage);
    map['title'] = Variable<String>(title);
    map['valid_from'] = Variable<String>(validFrom);
    map['valid_until'] = Variable<String>(validUntil);
    return map;
  }

  ActivityContentsCompanion toCompanion(bool nullToAbsent) {
    return ActivityContentsCompanion(
      id: Value(id),
      activityId: Value(activityId),
      amount: Value(amount),
      confirmationCancel: Value(confirmationCancel),
      confirmationSave: Value(confirmationSave),
      confirmationTitle: Value(confirmationTitle),
      dateCompleteCaption: Value(dateCompleteCaption),
      dateFormat: Value(dateFormat),
      details: Value(details),
      imageUrl: Value(imageUrl),
      language: Value(language),
      rewardType: Value(rewardType),
      sequences: Value(sequences),
      setDateCaption: Value(setDateCaption),
      spinnerMessage: Value(spinnerMessage),
      title: Value(title),
      validFrom: Value(validFrom),
      validUntil: Value(validUntil),
    );
  }

  factory ActivityContent.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityContent(
      id: serializer.fromJson<int>(json['id']),
      activityId: serializer.fromJson<String>(json['activityId']),
      amount: serializer.fromJson<double>(json['amount']),
      confirmationCancel: serializer.fromJson<String>(json['confirmationCancel']),
      confirmationSave: serializer.fromJson<String>(json['confirmationSave']),
      confirmationTitle: serializer.fromJson<String>(json['confirmationTitle']),
      dateCompleteCaption: serializer.fromJson<String>(json['dateCompleteCaption']),
      dateFormat: serializer.fromJson<String>(json['dateFormat']),
      details: serializer.fromJson<String>(json['details']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      language: serializer.fromJson<String>(json['language']),
      rewardType: serializer.fromJson<String>(json['rewardType']),
      sequences: serializer.fromJson<int>(json['sequences']),
      setDateCaption: serializer.fromJson<String>(json['setDateCaption']),
      spinnerMessage: serializer.fromJson<String>(json['spinnerMessage']),
      title: serializer.fromJson<String>(json['title']),
      validFrom: serializer.fromJson<String>(json['validFrom']),
      validUntil: serializer.fromJson<String>(json['validUntil']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityId': serializer.toJson<String>(activityId),
      'amount': serializer.toJson<double>(amount),
      'confirmationCancel': serializer.toJson<String>(confirmationCancel),
      'confirmationSave': serializer.toJson<String>(confirmationSave),
      'confirmationTitle': serializer.toJson<String>(confirmationTitle),
      'dateCompleteCaption': serializer.toJson<String>(dateCompleteCaption),
      'dateFormat': serializer.toJson<String>(dateFormat),
      'details': serializer.toJson<String>(details),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'language': serializer.toJson<String>(language),
      'rewardType': serializer.toJson<String>(rewardType),
      'sequences': serializer.toJson<int>(sequences),
      'setDateCaption': serializer.toJson<String>(setDateCaption),
      'spinnerMessage': serializer.toJson<String>(spinnerMessage),
      'title': serializer.toJson<String>(title),
      'validFrom': serializer.toJson<String>(validFrom),
      'validUntil': serializer.toJson<String>(validUntil),
    };
  }

  ActivityContent copyWith(
          {int? id,
          String? activityId,
          double? amount,
          String? confirmationCancel,
          String? confirmationSave,
          String? confirmationTitle,
          String? dateCompleteCaption,
          String? dateFormat,
          String? details,
          String? imageUrl,
          String? language,
          String? rewardType,
          int? sequences,
          String? setDateCaption,
          String? spinnerMessage,
          String? title,
          String? validFrom,
          String? validUntil}) =>
      ActivityContent(
        id: id ?? this.id,
        activityId: activityId ?? this.activityId,
        amount: amount ?? this.amount,
        confirmationCancel: confirmationCancel ?? this.confirmationCancel,
        confirmationSave: confirmationSave ?? this.confirmationSave,
        confirmationTitle: confirmationTitle ?? this.confirmationTitle,
        dateCompleteCaption: dateCompleteCaption ?? this.dateCompleteCaption,
        dateFormat: dateFormat ?? this.dateFormat,
        details: details ?? this.details,
        imageUrl: imageUrl ?? this.imageUrl,
        language: language ?? this.language,
        rewardType: rewardType ?? this.rewardType,
        sequences: sequences ?? this.sequences,
        setDateCaption: setDateCaption ?? this.setDateCaption,
        spinnerMessage: spinnerMessage ?? this.spinnerMessage,
        title: title ?? this.title,
        validFrom: validFrom ?? this.validFrom,
        validUntil: validUntil ?? this.validUntil,
      );
  @override
  String toString() {
    return (StringBuffer('ActivityContent(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('amount: $amount, ')
          ..write('confirmationCancel: $confirmationCancel, ')
          ..write('confirmationSave: $confirmationSave, ')
          ..write('confirmationTitle: $confirmationTitle, ')
          ..write('dateCompleteCaption: $dateCompleteCaption, ')
          ..write('dateFormat: $dateFormat, ')
          ..write('details: $details, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('language: $language, ')
          ..write('rewardType: $rewardType, ')
          ..write('sequences: $sequences, ')
          ..write('setDateCaption: $setDateCaption, ')
          ..write('spinnerMessage: $spinnerMessage, ')
          ..write('title: $title, ')
          ..write('validFrom: $validFrom, ')
          ..write('validUntil: $validUntil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, activityId, amount, confirmationCancel, confirmationSave, confirmationTitle, dateCompleteCaption, dateFormat, details, imageUrl, language,
      rewardType, sequences, setDateCaption, spinnerMessage, title, validFrom, validUntil);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityContent &&
          other.id == this.id &&
          other.activityId == this.activityId &&
          other.amount == this.amount &&
          other.confirmationCancel == this.confirmationCancel &&
          other.confirmationSave == this.confirmationSave &&
          other.confirmationTitle == this.confirmationTitle &&
          other.dateCompleteCaption == this.dateCompleteCaption &&
          other.dateFormat == this.dateFormat &&
          other.details == this.details &&
          other.imageUrl == this.imageUrl &&
          other.language == this.language &&
          other.rewardType == this.rewardType &&
          other.sequences == this.sequences &&
          other.setDateCaption == this.setDateCaption &&
          other.spinnerMessage == this.spinnerMessage &&
          other.title == this.title &&
          other.validFrom == this.validFrom &&
          other.validUntil == this.validUntil);
}

class ActivityContentsCompanion extends UpdateCompanion<ActivityContent> {
  final Value<int> id;
  final Value<String> activityId;
  final Value<double> amount;
  final Value<String> confirmationCancel;
  final Value<String> confirmationSave;
  final Value<String> confirmationTitle;
  final Value<String> dateCompleteCaption;
  final Value<String> dateFormat;
  final Value<String> details;
  final Value<String> imageUrl;
  final Value<String> language;
  final Value<String> rewardType;
  final Value<int> sequences;
  final Value<String> setDateCaption;
  final Value<String> spinnerMessage;
  final Value<String> title;
  final Value<String> validFrom;
  final Value<String> validUntil;
  const ActivityContentsCompanion({
    this.id = const Value.absent(),
    this.activityId = const Value.absent(),
    this.amount = const Value.absent(),
    this.confirmationCancel = const Value.absent(),
    this.confirmationSave = const Value.absent(),
    this.confirmationTitle = const Value.absent(),
    this.dateCompleteCaption = const Value.absent(),
    this.dateFormat = const Value.absent(),
    this.details = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.language = const Value.absent(),
    this.rewardType = const Value.absent(),
    this.sequences = const Value.absent(),
    this.setDateCaption = const Value.absent(),
    this.spinnerMessage = const Value.absent(),
    this.title = const Value.absent(),
    this.validFrom = const Value.absent(),
    this.validUntil = const Value.absent(),
  });
  ActivityContentsCompanion.insert({
    this.id = const Value.absent(),
    required String activityId,
    this.amount = const Value.absent(),
    required String confirmationCancel,
    required String confirmationSave,
    required String confirmationTitle,
    required String dateCompleteCaption,
    this.dateFormat = const Value.absent(),
    required String details,
    required String imageUrl,
    required String language,
    required String rewardType,
    this.sequences = const Value.absent(),
    required String setDateCaption,
    required String spinnerMessage,
    required String title,
    required String validFrom,
    required String validUntil,
  })  : activityId = Value(activityId),
        confirmationCancel = Value(confirmationCancel),
        confirmationSave = Value(confirmationSave),
        confirmationTitle = Value(confirmationTitle),
        dateCompleteCaption = Value(dateCompleteCaption),
        details = Value(details),
        imageUrl = Value(imageUrl),
        language = Value(language),
        rewardType = Value(rewardType),
        setDateCaption = Value(setDateCaption),
        spinnerMessage = Value(spinnerMessage),
        title = Value(title),
        validFrom = Value(validFrom),
        validUntil = Value(validUntil);
  static Insertable<ActivityContent> custom({
    Expression<int>? id,
    Expression<String>? activityId,
    Expression<double>? amount,
    Expression<String>? confirmationCancel,
    Expression<String>? confirmationSave,
    Expression<String>? confirmationTitle,
    Expression<String>? dateCompleteCaption,
    Expression<String>? dateFormat,
    Expression<String>? details,
    Expression<String>? imageUrl,
    Expression<String>? language,
    Expression<String>? rewardType,
    Expression<int>? sequences,
    Expression<String>? setDateCaption,
    Expression<String>? spinnerMessage,
    Expression<String>? title,
    Expression<String>? validFrom,
    Expression<String>? validUntil,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activityId != null) 'activity_id': activityId,
      if (amount != null) 'amount': amount,
      if (confirmationCancel != null) 'confirmation_cancel': confirmationCancel,
      if (confirmationSave != null) 'confirmation_save': confirmationSave,
      if (confirmationTitle != null) 'confirmation_title': confirmationTitle,
      if (dateCompleteCaption != null) 'date_complete_caption': dateCompleteCaption,
      if (dateFormat != null) 'date_format': dateFormat,
      if (details != null) 'details': details,
      if (imageUrl != null) 'image_url': imageUrl,
      if (language != null) 'language': language,
      if (rewardType != null) 'reward_type': rewardType,
      if (sequences != null) 'sequences': sequences,
      if (setDateCaption != null) 'set_date_caption': setDateCaption,
      if (spinnerMessage != null) 'spinner_message': spinnerMessage,
      if (title != null) 'title': title,
      if (validFrom != null) 'valid_from': validFrom,
      if (validUntil != null) 'valid_until': validUntil,
    });
  }

  ActivityContentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? activityId,
      Value<double>? amount,
      Value<String>? confirmationCancel,
      Value<String>? confirmationSave,
      Value<String>? confirmationTitle,
      Value<String>? dateCompleteCaption,
      Value<String>? dateFormat,
      Value<String>? details,
      Value<String>? imageUrl,
      Value<String>? language,
      Value<String>? rewardType,
      Value<int>? sequences,
      Value<String>? setDateCaption,
      Value<String>? spinnerMessage,
      Value<String>? title,
      Value<String>? validFrom,
      Value<String>? validUntil}) {
    return ActivityContentsCompanion(
      id: id ?? this.id,
      activityId: activityId ?? this.activityId,
      amount: amount ?? this.amount,
      confirmationCancel: confirmationCancel ?? this.confirmationCancel,
      confirmationSave: confirmationSave ?? this.confirmationSave,
      confirmationTitle: confirmationTitle ?? this.confirmationTitle,
      dateCompleteCaption: dateCompleteCaption ?? this.dateCompleteCaption,
      dateFormat: dateFormat ?? this.dateFormat,
      details: details ?? this.details,
      imageUrl: imageUrl ?? this.imageUrl,
      language: language ?? this.language,
      rewardType: rewardType ?? this.rewardType,
      sequences: sequences ?? this.sequences,
      setDateCaption: setDateCaption ?? this.setDateCaption,
      spinnerMessage: spinnerMessage ?? this.spinnerMessage,
      title: title ?? this.title,
      validFrom: validFrom ?? this.validFrom,
      validUntil: validUntil ?? this.validUntil,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activityId.present) {
      map['activity_id'] = Variable<String>(activityId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (confirmationCancel.present) {
      map['confirmation_cancel'] = Variable<String>(confirmationCancel.value);
    }
    if (confirmationSave.present) {
      map['confirmation_save'] = Variable<String>(confirmationSave.value);
    }
    if (confirmationTitle.present) {
      map['confirmation_title'] = Variable<String>(confirmationTitle.value);
    }
    if (dateCompleteCaption.present) {
      map['date_complete_caption'] = Variable<String>(dateCompleteCaption.value);
    }
    if (dateFormat.present) {
      map['date_format'] = Variable<String>(dateFormat.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (rewardType.present) {
      map['reward_type'] = Variable<String>(rewardType.value);
    }
    if (sequences.present) {
      map['sequences'] = Variable<int>(sequences.value);
    }
    if (setDateCaption.present) {
      map['set_date_caption'] = Variable<String>(setDateCaption.value);
    }
    if (spinnerMessage.present) {
      map['spinner_message'] = Variable<String>(spinnerMessage.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (validFrom.present) {
      map['valid_from'] = Variable<String>(validFrom.value);
    }
    if (validUntil.present) {
      map['valid_until'] = Variable<String>(validUntil.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityContentsCompanion(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('amount: $amount, ')
          ..write('confirmationCancel: $confirmationCancel, ')
          ..write('confirmationSave: $confirmationSave, ')
          ..write('confirmationTitle: $confirmationTitle, ')
          ..write('dateCompleteCaption: $dateCompleteCaption, ')
          ..write('dateFormat: $dateFormat, ')
          ..write('details: $details, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('language: $language, ')
          ..write('rewardType: $rewardType, ')
          ..write('sequences: $sequences, ')
          ..write('setDateCaption: $setDateCaption, ')
          ..write('spinnerMessage: $spinnerMessage, ')
          ..write('title: $title, ')
          ..write('validFrom: $validFrom, ')
          ..write('validUntil: $validUntil')
          ..write(')'))
        .toString();
  }
}

class $ActivityContentsTable extends ActivityContents with TableInfo<$ActivityContentsTable, ActivityContent> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ActivityContentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id =
      GeneratedColumn<int?>('id', aliasedName, false, typeName: 'INTEGER', requiredDuringInsert: false, defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _activityIdMeta = const VerificationMeta('activityId');
  late final GeneratedColumn<String?> activityId = GeneratedColumn<String?>('activity_id', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double?> amount = GeneratedColumn<double?>('amount', aliasedName, false, typeName: 'REAL', requiredDuringInsert: false, defaultValue: Constant(0.0));
  final VerificationMeta _confirmationCancelMeta = const VerificationMeta('confirmationCancel');
  late final GeneratedColumn<String?> confirmationCancel = GeneratedColumn<String?>('confirmation_cancel', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _confirmationSaveMeta = const VerificationMeta('confirmationSave');
  late final GeneratedColumn<String?> confirmationSave = GeneratedColumn<String?>('confirmation_save', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _confirmationTitleMeta = const VerificationMeta('confirmationTitle');
  late final GeneratedColumn<String?> confirmationTitle = GeneratedColumn<String?>('confirmation_title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _dateCompleteCaptionMeta = const VerificationMeta('dateCompleteCaption');
  late final GeneratedColumn<String?> dateCompleteCaption = GeneratedColumn<String?>('date_complete_caption', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 4,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _dateFormatMeta = const VerificationMeta('dateFormat');
  late final GeneratedColumn<String?> dateFormat = GeneratedColumn<String?>('date_format', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 15), typeName: 'TEXT', requiredDuringInsert: false, defaultValue: Constant('MM-dd-yyy'));
  final VerificationMeta _detailsMeta = const VerificationMeta('details');
  late final GeneratedColumn<String?> details = GeneratedColumn<String?>('details', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  late final GeneratedColumn<String?> imageUrl = GeneratedColumn<String?>('image_url', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _languageMeta = const VerificationMeta('language');
  late final GeneratedColumn<String?> language = GeneratedColumn<String?>('language', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 2), typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _rewardTypeMeta = const VerificationMeta('rewardType');
  late final GeneratedColumn<String?> rewardType = GeneratedColumn<String?>('reward_type', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _sequencesMeta = const VerificationMeta('sequences');
  late final GeneratedColumn<int?> sequences = GeneratedColumn<int?>('sequences', aliasedName, false, typeName: 'INTEGER', requiredDuringInsert: false, defaultValue: Constant(1));
  final VerificationMeta _setDateCaptionMeta = const VerificationMeta('setDateCaption');
  late final GeneratedColumn<String?> setDateCaption = GeneratedColumn<String?>('set_date_caption', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _spinnerMessageMeta = const VerificationMeta('spinnerMessage');
  late final GeneratedColumn<String?> spinnerMessage = GeneratedColumn<String?>('spinner_message', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>('title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _validFromMeta = const VerificationMeta('validFrom');
  late final GeneratedColumn<String?> validFrom = GeneratedColumn<String?>('valid_from', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _validUntilMeta = const VerificationMeta('validUntil');
  late final GeneratedColumn<String?> validUntil = GeneratedColumn<String?>('valid_until', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
        minTextLength: 1,
      ),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        activityId,
        amount,
        confirmationCancel,
        confirmationSave,
        confirmationTitle,
        dateCompleteCaption,
        dateFormat,
        details,
        imageUrl,
        language,
        rewardType,
        sequences,
        setDateCaption,
        spinnerMessage,
        title,
        validFrom,
        validUntil
      ];
  @override
  String get aliasedName => _alias ?? 'activity_contents';
  @override
  String get actualTableName => 'activity_contents';
  @override
  VerificationContext validateIntegrity(Insertable<ActivityContent> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('activity_id')) {
      context.handle(_activityIdMeta, activityId.isAcceptableOrUnknown(data['activity_id']!, _activityIdMeta));
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta, amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('confirmation_cancel')) {
      context.handle(_confirmationCancelMeta, confirmationCancel.isAcceptableOrUnknown(data['confirmation_cancel']!, _confirmationCancelMeta));
    } else if (isInserting) {
      context.missing(_confirmationCancelMeta);
    }
    if (data.containsKey('confirmation_save')) {
      context.handle(_confirmationSaveMeta, confirmationSave.isAcceptableOrUnknown(data['confirmation_save']!, _confirmationSaveMeta));
    } else if (isInserting) {
      context.missing(_confirmationSaveMeta);
    }
    if (data.containsKey('confirmation_title')) {
      context.handle(_confirmationTitleMeta, confirmationTitle.isAcceptableOrUnknown(data['confirmation_title']!, _confirmationTitleMeta));
    } else if (isInserting) {
      context.missing(_confirmationTitleMeta);
    }
    if (data.containsKey('date_complete_caption')) {
      context.handle(_dateCompleteCaptionMeta, dateCompleteCaption.isAcceptableOrUnknown(data['date_complete_caption']!, _dateCompleteCaptionMeta));
    } else if (isInserting) {
      context.missing(_dateCompleteCaptionMeta);
    }
    if (data.containsKey('date_format')) {
      context.handle(_dateFormatMeta, dateFormat.isAcceptableOrUnknown(data['date_format']!, _dateFormatMeta));
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta, details.isAcceptableOrUnknown(data['details']!, _detailsMeta));
    } else if (isInserting) {
      context.missing(_detailsMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta, imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta, language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('reward_type')) {
      context.handle(_rewardTypeMeta, rewardType.isAcceptableOrUnknown(data['reward_type']!, _rewardTypeMeta));
    } else if (isInserting) {
      context.missing(_rewardTypeMeta);
    }
    if (data.containsKey('sequences')) {
      context.handle(_sequencesMeta, sequences.isAcceptableOrUnknown(data['sequences']!, _sequencesMeta));
    }
    if (data.containsKey('set_date_caption')) {
      context.handle(_setDateCaptionMeta, setDateCaption.isAcceptableOrUnknown(data['set_date_caption']!, _setDateCaptionMeta));
    } else if (isInserting) {
      context.missing(_setDateCaptionMeta);
    }
    if (data.containsKey('spinner_message')) {
      context.handle(_spinnerMessageMeta, spinnerMessage.isAcceptableOrUnknown(data['spinner_message']!, _spinnerMessageMeta));
    } else if (isInserting) {
      context.missing(_spinnerMessageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(_titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('valid_from')) {
      context.handle(_validFromMeta, validFrom.isAcceptableOrUnknown(data['valid_from']!, _validFromMeta));
    } else if (isInserting) {
      context.missing(_validFromMeta);
    }
    if (data.containsKey('valid_until')) {
      context.handle(_validUntilMeta, validUntil.isAcceptableOrUnknown(data['valid_until']!, _validUntilMeta));
    } else if (isInserting) {
      context.missing(_validUntilMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityContent map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ActivityContent.fromData(data, prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ActivityContentsTable createAlias(String alias) {
    return $ActivityContentsTable(_db, alias);
  }
}

abstract class _$RewardsDatabase extends GeneratedDatabase {
  _$RewardsDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ActivityContentsTable activityContents = $ActivityContentsTable(this);
  late final ActivityContentDao activityContentDao = ActivityContentDao(this as RewardsDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [activityContents];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ActivityContentDaoMixin on DatabaseAccessor<RewardsDatabase> {
  $ActivityContentsTable get activityContents => attachedDatabase.activityContents;
}
