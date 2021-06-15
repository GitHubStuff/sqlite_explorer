// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_contents.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ActivityContent extends DataClass implements Insertable<ActivityContent> {
  final int id;
  final String activityId;
  final String amount;
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
  factory ActivityContent.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ActivityContent(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      activityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}activity_id'])!,
      amount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      confirmationCancel: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}confirmation_cancel'])!,
      confirmationSave: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}confirmation_save'])!,
      confirmationTitle: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}confirmation_title'])!,
      dateCompleteCaption: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}date_complete_caption'])!,
      dateFormat: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_format'])!,
      details: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}details'])!,
      imageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url'])!,
      language: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}language'])!,
      rewardType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reward_type'])!,
      sequences: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sequences'])!,
      setDateCaption: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}set_date_caption'])!,
      spinnerMessage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}spinner_message'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      validFrom: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}valid_from'])!,
      validUntil: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}valid_until'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['activity_id'] = Variable<String>(activityId);
    map['amount'] = Variable<String>(amount);
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

  factory ActivityContent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ActivityContent(
      id: serializer.fromJson<int>(json['id']),
      activityId: serializer.fromJson<String>(json['activityId']),
      amount: serializer.fromJson<String>(json['amount']),
      confirmationCancel:
          serializer.fromJson<String>(json['confirmationCancel']),
      confirmationSave: serializer.fromJson<String>(json['confirmationSave']),
      confirmationTitle: serializer.fromJson<String>(json['confirmationTitle']),
      dateCompleteCaption:
          serializer.fromJson<String>(json['dateCompleteCaption']),
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
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityId': serializer.toJson<String>(activityId),
      'amount': serializer.toJson<String>(amount),
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
          String? amount,
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
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          activityId.hashCode,
          $mrjc(
              amount.hashCode,
              $mrjc(
                  confirmationCancel.hashCode,
                  $mrjc(
                      confirmationSave.hashCode,
                      $mrjc(
                          confirmationTitle.hashCode,
                          $mrjc(
                              dateCompleteCaption.hashCode,
                              $mrjc(
                                  dateFormat.hashCode,
                                  $mrjc(
                                      details.hashCode,
                                      $mrjc(
                                          imageUrl.hashCode,
                                          $mrjc(
                                              language.hashCode,
                                              $mrjc(
                                                  rewardType.hashCode,
                                                  $mrjc(
                                                      sequences.hashCode,
                                                      $mrjc(
                                                          setDateCaption
                                                              .hashCode,
                                                          $mrjc(
                                                              spinnerMessage
                                                                  .hashCode,
                                                              $mrjc(
                                                                  title
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      validFrom
                                                                          .hashCode,
                                                                      validUntil
                                                                          .hashCode))))))))))))))))));
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
  final Value<String> amount;
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
    required String amount,
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
        amount = Value(amount),
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
    Expression<String>? amount,
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
      if (dateCompleteCaption != null)
        'date_complete_caption': dateCompleteCaption,
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
      Value<String>? amount,
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
      map['amount'] = Variable<String>(amount.value);
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
      map['date_complete_caption'] =
          Variable<String>(dateCompleteCaption.value);
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

class $ActivityContentsTable extends ActivityContents
    with TableInfo<$ActivityContentsTable, ActivityContent> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ActivityContentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _activityIdMeta = const VerificationMeta('activityId');
  @override
  late final GeneratedTextColumn activityId = _constructActivityId();
  GeneratedTextColumn _constructActivityId() {
    return GeneratedTextColumn('activity_id', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedTextColumn amount = _constructAmount();
  GeneratedTextColumn _constructAmount() {
    return GeneratedTextColumn('amount', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _confirmationCancelMeta =
      const VerificationMeta('confirmationCancel');
  @override
  late final GeneratedTextColumn confirmationCancel =
      _constructConfirmationCancel();
  GeneratedTextColumn _constructConfirmationCancel() {
    return GeneratedTextColumn('confirmation_cancel', $tableName, false,
        minTextLength: 7);
  }

  final VerificationMeta _confirmationSaveMeta =
      const VerificationMeta('confirmationSave');
  @override
  late final GeneratedTextColumn confirmationSave =
      _constructConfirmationSave();
  GeneratedTextColumn _constructConfirmationSave() {
    return GeneratedTextColumn('confirmation_save', $tableName, false,
        minTextLength: 4);
  }

  final VerificationMeta _confirmationTitleMeta =
      const VerificationMeta('confirmationTitle');
  @override
  late final GeneratedTextColumn confirmationTitle =
      _constructConfirmationTitle();
  GeneratedTextColumn _constructConfirmationTitle() {
    return GeneratedTextColumn('confirmation_title', $tableName, false,
        minTextLength: 5);
  }

  final VerificationMeta _dateCompleteCaptionMeta =
      const VerificationMeta('dateCompleteCaption');
  @override
  late final GeneratedTextColumn dateCompleteCaption =
      _constructDateCompleteCaption();
  GeneratedTextColumn _constructDateCompleteCaption() {
    return GeneratedTextColumn('date_complete_caption', $tableName, false,
        minTextLength: 4);
  }

  final VerificationMeta _dateFormatMeta = const VerificationMeta('dateFormat');
  @override
  late final GeneratedTextColumn dateFormat = _constructDateFormat();
  GeneratedTextColumn _constructDateFormat() {
    return GeneratedTextColumn('date_format', $tableName, false,
        minTextLength: 4,
        maxTextLength: 15,
        defaultValue: Constant('MM-dd-yyy'));
  }

  final VerificationMeta _detailsMeta = const VerificationMeta('details');
  @override
  late final GeneratedTextColumn details = _constructDetails();
  GeneratedTextColumn _constructDetails() {
    return GeneratedTextColumn('details', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  @override
  late final GeneratedTextColumn imageUrl = _constructImageUrl();
  GeneratedTextColumn _constructImageUrl() {
    return GeneratedTextColumn('image_url', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _languageMeta = const VerificationMeta('language');
  @override
  late final GeneratedTextColumn language = _constructLanguage();
  GeneratedTextColumn _constructLanguage() {
    return GeneratedTextColumn('language', $tableName, false,
        minTextLength: 2, maxTextLength: 2);
  }

  final VerificationMeta _rewardTypeMeta = const VerificationMeta('rewardType');
  @override
  late final GeneratedTextColumn rewardType = _constructRewardType();
  GeneratedTextColumn _constructRewardType() {
    return GeneratedTextColumn('reward_type', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _sequencesMeta = const VerificationMeta('sequences');
  @override
  late final GeneratedIntColumn sequences = _constructSequences();
  GeneratedIntColumn _constructSequences() {
    return GeneratedIntColumn('sequences', $tableName, false,
        defaultValue: Constant(1));
  }

  final VerificationMeta _setDateCaptionMeta =
      const VerificationMeta('setDateCaption');
  @override
  late final GeneratedTextColumn setDateCaption = _constructSetDateCaption();
  GeneratedTextColumn _constructSetDateCaption() {
    return GeneratedTextColumn('set_date_caption', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _spinnerMessageMeta =
      const VerificationMeta('spinnerMessage');
  @override
  late final GeneratedTextColumn spinnerMessage = _constructSpinnerMessage();
  GeneratedTextColumn _constructSpinnerMessage() {
    return GeneratedTextColumn('spinner_message', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _validFromMeta = const VerificationMeta('validFrom');
  @override
  late final GeneratedTextColumn validFrom = _constructValidFrom();
  GeneratedTextColumn _constructValidFrom() {
    return GeneratedTextColumn('valid_from', $tableName, false,
        minTextLength: 10);
  }

  final VerificationMeta _validUntilMeta = const VerificationMeta('validUntil');
  @override
  late final GeneratedTextColumn validUntil = _constructValidUntil();
  GeneratedTextColumn _constructValidUntil() {
    return GeneratedTextColumn('valid_until', $tableName, false,
        minTextLength: 10);
  }

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
  $ActivityContentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'activity_contents';
  @override
  final String actualTableName = 'activity_contents';
  @override
  VerificationContext validateIntegrity(Insertable<ActivityContent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('activity_id')) {
      context.handle(
          _activityIdMeta,
          activityId.isAcceptableOrUnknown(
              data['activity_id']!, _activityIdMeta));
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('confirmation_cancel')) {
      context.handle(
          _confirmationCancelMeta,
          confirmationCancel.isAcceptableOrUnknown(
              data['confirmation_cancel']!, _confirmationCancelMeta));
    } else if (isInserting) {
      context.missing(_confirmationCancelMeta);
    }
    if (data.containsKey('confirmation_save')) {
      context.handle(
          _confirmationSaveMeta,
          confirmationSave.isAcceptableOrUnknown(
              data['confirmation_save']!, _confirmationSaveMeta));
    } else if (isInserting) {
      context.missing(_confirmationSaveMeta);
    }
    if (data.containsKey('confirmation_title')) {
      context.handle(
          _confirmationTitleMeta,
          confirmationTitle.isAcceptableOrUnknown(
              data['confirmation_title']!, _confirmationTitleMeta));
    } else if (isInserting) {
      context.missing(_confirmationTitleMeta);
    }
    if (data.containsKey('date_complete_caption')) {
      context.handle(
          _dateCompleteCaptionMeta,
          dateCompleteCaption.isAcceptableOrUnknown(
              data['date_complete_caption']!, _dateCompleteCaptionMeta));
    } else if (isInserting) {
      context.missing(_dateCompleteCaptionMeta);
    }
    if (data.containsKey('date_format')) {
      context.handle(
          _dateFormatMeta,
          dateFormat.isAcceptableOrUnknown(
              data['date_format']!, _dateFormatMeta));
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta,
          details.isAcceptableOrUnknown(data['details']!, _detailsMeta));
    } else if (isInserting) {
      context.missing(_detailsMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('reward_type')) {
      context.handle(
          _rewardTypeMeta,
          rewardType.isAcceptableOrUnknown(
              data['reward_type']!, _rewardTypeMeta));
    } else if (isInserting) {
      context.missing(_rewardTypeMeta);
    }
    if (data.containsKey('sequences')) {
      context.handle(_sequencesMeta,
          sequences.isAcceptableOrUnknown(data['sequences']!, _sequencesMeta));
    }
    if (data.containsKey('set_date_caption')) {
      context.handle(
          _setDateCaptionMeta,
          setDateCaption.isAcceptableOrUnknown(
              data['set_date_caption']!, _setDateCaptionMeta));
    } else if (isInserting) {
      context.missing(_setDateCaptionMeta);
    }
    if (data.containsKey('spinner_message')) {
      context.handle(
          _spinnerMessageMeta,
          spinnerMessage.isAcceptableOrUnknown(
              data['spinner_message']!, _spinnerMessageMeta));
    } else if (isInserting) {
      context.missing(_spinnerMessageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('valid_from')) {
      context.handle(_validFromMeta,
          validFrom.isAcceptableOrUnknown(data['valid_from']!, _validFromMeta));
    } else if (isInserting) {
      context.missing(_validFromMeta);
    }
    if (data.containsKey('valid_until')) {
      context.handle(
          _validUntilMeta,
          validUntil.isAcceptableOrUnknown(
              data['valid_until']!, _validUntilMeta));
    } else if (isInserting) {
      context.missing(_validUntilMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityContent map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ActivityContent.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ActivityContentsTable createAlias(String alias) {
    return $ActivityContentsTable(_db, alias);
  }
}

class ActivityProgress extends DataClass
    implements Insertable<ActivityProgress> {
  final int id;
  final String activityId;
  final String amount;
  final String dateCompleted;
  final String memberId;
  final int sequenceNumber;
  ActivityProgress(
      {required this.id,
      required this.activityId,
      required this.amount,
      required this.dateCompleted,
      required this.memberId,
      required this.sequenceNumber});
  factory ActivityProgress.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ActivityProgress(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      activityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}activity_id'])!,
      amount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      dateCompleted: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_completed'])!,
      memberId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}member_id'])!,
      sequenceNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sequence_number'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['activity_id'] = Variable<String>(activityId);
    map['amount'] = Variable<String>(amount);
    map['date_completed'] = Variable<String>(dateCompleted);
    map['member_id'] = Variable<String>(memberId);
    map['sequence_number'] = Variable<int>(sequenceNumber);
    return map;
  }

  ActivityProgressionCompanion toCompanion(bool nullToAbsent) {
    return ActivityProgressionCompanion(
      id: Value(id),
      activityId: Value(activityId),
      amount: Value(amount),
      dateCompleted: Value(dateCompleted),
      memberId: Value(memberId),
      sequenceNumber: Value(sequenceNumber),
    );
  }

  factory ActivityProgress.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ActivityProgress(
      id: serializer.fromJson<int>(json['id']),
      activityId: serializer.fromJson<String>(json['activityId']),
      amount: serializer.fromJson<String>(json['amount']),
      dateCompleted: serializer.fromJson<String>(json['dateCompleted']),
      memberId: serializer.fromJson<String>(json['memberId']),
      sequenceNumber: serializer.fromJson<int>(json['sequenceNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityId': serializer.toJson<String>(activityId),
      'amount': serializer.toJson<String>(amount),
      'dateCompleted': serializer.toJson<String>(dateCompleted),
      'memberId': serializer.toJson<String>(memberId),
      'sequenceNumber': serializer.toJson<int>(sequenceNumber),
    };
  }

  ActivityProgress copyWith(
          {int? id,
          String? activityId,
          String? amount,
          String? dateCompleted,
          String? memberId,
          int? sequenceNumber}) =>
      ActivityProgress(
        id: id ?? this.id,
        activityId: activityId ?? this.activityId,
        amount: amount ?? this.amount,
        dateCompleted: dateCompleted ?? this.dateCompleted,
        memberId: memberId ?? this.memberId,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber,
      );
  @override
  String toString() {
    return (StringBuffer('ActivityProgress(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('amount: $amount, ')
          ..write('dateCompleted: $dateCompleted, ')
          ..write('memberId: $memberId, ')
          ..write('sequenceNumber: $sequenceNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          activityId.hashCode,
          $mrjc(
              amount.hashCode,
              $mrjc(dateCompleted.hashCode,
                  $mrjc(memberId.hashCode, sequenceNumber.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityProgress &&
          other.id == this.id &&
          other.activityId == this.activityId &&
          other.amount == this.amount &&
          other.dateCompleted == this.dateCompleted &&
          other.memberId == this.memberId &&
          other.sequenceNumber == this.sequenceNumber);
}

class ActivityProgressionCompanion extends UpdateCompanion<ActivityProgress> {
  final Value<int> id;
  final Value<String> activityId;
  final Value<String> amount;
  final Value<String> dateCompleted;
  final Value<String> memberId;
  final Value<int> sequenceNumber;
  const ActivityProgressionCompanion({
    this.id = const Value.absent(),
    this.activityId = const Value.absent(),
    this.amount = const Value.absent(),
    this.dateCompleted = const Value.absent(),
    this.memberId = const Value.absent(),
    this.sequenceNumber = const Value.absent(),
  });
  ActivityProgressionCompanion.insert({
    this.id = const Value.absent(),
    required String activityId,
    required String amount,
    required String dateCompleted,
    required String memberId,
    this.sequenceNumber = const Value.absent(),
  })  : activityId = Value(activityId),
        amount = Value(amount),
        dateCompleted = Value(dateCompleted),
        memberId = Value(memberId);
  static Insertable<ActivityProgress> custom({
    Expression<int>? id,
    Expression<String>? activityId,
    Expression<String>? amount,
    Expression<String>? dateCompleted,
    Expression<String>? memberId,
    Expression<int>? sequenceNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activityId != null) 'activity_id': activityId,
      if (amount != null) 'amount': amount,
      if (dateCompleted != null) 'date_completed': dateCompleted,
      if (memberId != null) 'member_id': memberId,
      if (sequenceNumber != null) 'sequence_number': sequenceNumber,
    });
  }

  ActivityProgressionCompanion copyWith(
      {Value<int>? id,
      Value<String>? activityId,
      Value<String>? amount,
      Value<String>? dateCompleted,
      Value<String>? memberId,
      Value<int>? sequenceNumber}) {
    return ActivityProgressionCompanion(
      id: id ?? this.id,
      activityId: activityId ?? this.activityId,
      amount: amount ?? this.amount,
      dateCompleted: dateCompleted ?? this.dateCompleted,
      memberId: memberId ?? this.memberId,
      sequenceNumber: sequenceNumber ?? this.sequenceNumber,
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
      map['amount'] = Variable<String>(amount.value);
    }
    if (dateCompleted.present) {
      map['date_completed'] = Variable<String>(dateCompleted.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (sequenceNumber.present) {
      map['sequence_number'] = Variable<int>(sequenceNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityProgressionCompanion(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('amount: $amount, ')
          ..write('dateCompleted: $dateCompleted, ')
          ..write('memberId: $memberId, ')
          ..write('sequenceNumber: $sequenceNumber')
          ..write(')'))
        .toString();
  }
}

class $ActivityProgressionTable extends ActivityProgression
    with TableInfo<$ActivityProgressionTable, ActivityProgress> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ActivityProgressionTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _activityIdMeta = const VerificationMeta('activityId');
  @override
  late final GeneratedTextColumn activityId = _constructActivityId();
  GeneratedTextColumn _constructActivityId() {
    return GeneratedTextColumn('activity_id', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedTextColumn amount = _constructAmount();
  GeneratedTextColumn _constructAmount() {
    return GeneratedTextColumn('amount', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _dateCompletedMeta =
      const VerificationMeta('dateCompleted');
  @override
  late final GeneratedTextColumn dateCompleted = _constructDateCompleted();
  GeneratedTextColumn _constructDateCompleted() {
    return GeneratedTextColumn('date_completed', $tableName, false,
        minTextLength: 8);
  }

  final VerificationMeta _memberIdMeta = const VerificationMeta('memberId');
  @override
  late final GeneratedTextColumn memberId = _constructMemberId();
  GeneratedTextColumn _constructMemberId() {
    return GeneratedTextColumn('member_id', $tableName, false,
        minTextLength: 4);
  }

  final VerificationMeta _sequenceNumberMeta =
      const VerificationMeta('sequenceNumber');
  @override
  late final GeneratedIntColumn sequenceNumber = _constructSequenceNumber();
  GeneratedIntColumn _constructSequenceNumber() {
    return GeneratedIntColumn('sequence_number', $tableName, false,
        defaultValue: Constant(1));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, activityId, amount, dateCompleted, memberId, sequenceNumber];
  @override
  $ActivityProgressionTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'activity_progression';
  @override
  final String actualTableName = 'activity_progression';
  @override
  VerificationContext validateIntegrity(Insertable<ActivityProgress> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('activity_id')) {
      context.handle(
          _activityIdMeta,
          activityId.isAcceptableOrUnknown(
              data['activity_id']!, _activityIdMeta));
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date_completed')) {
      context.handle(
          _dateCompletedMeta,
          dateCompleted.isAcceptableOrUnknown(
              data['date_completed']!, _dateCompletedMeta));
    } else if (isInserting) {
      context.missing(_dateCompletedMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('sequence_number')) {
      context.handle(
          _sequenceNumberMeta,
          sequenceNumber.isAcceptableOrUnknown(
              data['sequence_number']!, _sequenceNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityProgress map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ActivityProgress.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ActivityProgressionTable createAlias(String alias) {
    return $ActivityProgressionTable(_db, alias);
  }
}

class ActivityVersion extends DataClass implements Insertable<ActivityVersion> {
  final int id;
  final String activityId;
  final String timeStamp;
  final String title;
  ActivityVersion(
      {required this.id,
      required this.activityId,
      required this.timeStamp,
      required this.title});
  factory ActivityVersion.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ActivityVersion(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      activityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}activity_id'])!,
      timeStamp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_stamp'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['activity_id'] = Variable<String>(activityId);
    map['time_stamp'] = Variable<String>(timeStamp);
    map['title'] = Variable<String>(title);
    return map;
  }

  ActivityVersionsCompanion toCompanion(bool nullToAbsent) {
    return ActivityVersionsCompanion(
      id: Value(id),
      activityId: Value(activityId),
      timeStamp: Value(timeStamp),
      title: Value(title),
    );
  }

  factory ActivityVersion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ActivityVersion(
      id: serializer.fromJson<int>(json['id']),
      activityId: serializer.fromJson<String>(json['activityId']),
      timeStamp: serializer.fromJson<String>(json['timeStamp']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityId': serializer.toJson<String>(activityId),
      'timeStamp': serializer.toJson<String>(timeStamp),
      'title': serializer.toJson<String>(title),
    };
  }

  ActivityVersion copyWith(
          {int? id, String? activityId, String? timeStamp, String? title}) =>
      ActivityVersion(
        id: id ?? this.id,
        activityId: activityId ?? this.activityId,
        timeStamp: timeStamp ?? this.timeStamp,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('ActivityVersion(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(activityId.hashCode, $mrjc(timeStamp.hashCode, title.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityVersion &&
          other.id == this.id &&
          other.activityId == this.activityId &&
          other.timeStamp == this.timeStamp &&
          other.title == this.title);
}

class ActivityVersionsCompanion extends UpdateCompanion<ActivityVersion> {
  final Value<int> id;
  final Value<String> activityId;
  final Value<String> timeStamp;
  final Value<String> title;
  const ActivityVersionsCompanion({
    this.id = const Value.absent(),
    this.activityId = const Value.absent(),
    this.timeStamp = const Value.absent(),
    this.title = const Value.absent(),
  });
  ActivityVersionsCompanion.insert({
    this.id = const Value.absent(),
    required String activityId,
    required String timeStamp,
    required String title,
  })  : activityId = Value(activityId),
        timeStamp = Value(timeStamp),
        title = Value(title);
  static Insertable<ActivityVersion> custom({
    Expression<int>? id,
    Expression<String>? activityId,
    Expression<String>? timeStamp,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activityId != null) 'activity_id': activityId,
      if (timeStamp != null) 'time_stamp': timeStamp,
      if (title != null) 'title': title,
    });
  }

  ActivityVersionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? activityId,
      Value<String>? timeStamp,
      Value<String>? title}) {
    return ActivityVersionsCompanion(
      id: id ?? this.id,
      activityId: activityId ?? this.activityId,
      timeStamp: timeStamp ?? this.timeStamp,
      title: title ?? this.title,
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
    if (timeStamp.present) {
      map['time_stamp'] = Variable<String>(timeStamp.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityVersionsCompanion(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $ActivityVersionsTable extends ActivityVersions
    with TableInfo<$ActivityVersionsTable, ActivityVersion> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ActivityVersionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _activityIdMeta = const VerificationMeta('activityId');
  @override
  late final GeneratedTextColumn activityId = _constructActivityId();
  GeneratedTextColumn _constructActivityId() {
    return GeneratedTextColumn('activity_id', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _timeStampMeta = const VerificationMeta('timeStamp');
  @override
  late final GeneratedTextColumn timeStamp = _constructTimeStamp();
  GeneratedTextColumn _constructTimeStamp() {
    return GeneratedTextColumn('time_stamp', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false, minTextLength: 1);
  }

  @override
  List<GeneratedColumn> get $columns => [id, activityId, timeStamp, title];
  @override
  $ActivityVersionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'activity_versions';
  @override
  final String actualTableName = 'activity_versions';
  @override
  VerificationContext validateIntegrity(Insertable<ActivityVersion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('activity_id')) {
      context.handle(
          _activityIdMeta,
          activityId.isAcceptableOrUnknown(
              data['activity_id']!, _activityIdMeta));
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    if (data.containsKey('time_stamp')) {
      context.handle(_timeStampMeta,
          timeStamp.isAcceptableOrUnknown(data['time_stamp']!, _timeStampMeta));
    } else if (isInserting) {
      context.missing(_timeStampMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityVersion map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ActivityVersion.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ActivityVersionsTable createAlias(String alias) {
    return $ActivityVersionsTable(_db, alias);
  }
}

class ActivityPerMember extends DataClass
    implements Insertable<ActivityPerMember> {
  final int id;
  final String activityId;
  final String endingDate;
  final String memberId;
  final String memberName;
  final String startingDate;
  ActivityPerMember(
      {required this.id,
      required this.activityId,
      required this.endingDate,
      required this.memberId,
      required this.memberName,
      required this.startingDate});
  factory ActivityPerMember.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ActivityPerMember(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      activityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}activity_id'])!,
      endingDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ending_date'])!,
      memberId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}member_id'])!,
      memberName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}member_name'])!,
      startingDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}starting_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['activity_id'] = Variable<String>(activityId);
    map['ending_date'] = Variable<String>(endingDate);
    map['member_id'] = Variable<String>(memberId);
    map['member_name'] = Variable<String>(memberName);
    map['starting_date'] = Variable<String>(startingDate);
    return map;
  }

  ActivityPerMembersCompanion toCompanion(bool nullToAbsent) {
    return ActivityPerMembersCompanion(
      id: Value(id),
      activityId: Value(activityId),
      endingDate: Value(endingDate),
      memberId: Value(memberId),
      memberName: Value(memberName),
      startingDate: Value(startingDate),
    );
  }

  factory ActivityPerMember.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ActivityPerMember(
      id: serializer.fromJson<int>(json['id']),
      activityId: serializer.fromJson<String>(json['activityId']),
      endingDate: serializer.fromJson<String>(json['endingDate']),
      memberId: serializer.fromJson<String>(json['memberId']),
      memberName: serializer.fromJson<String>(json['memberName']),
      startingDate: serializer.fromJson<String>(json['startingDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityId': serializer.toJson<String>(activityId),
      'endingDate': serializer.toJson<String>(endingDate),
      'memberId': serializer.toJson<String>(memberId),
      'memberName': serializer.toJson<String>(memberName),
      'startingDate': serializer.toJson<String>(startingDate),
    };
  }

  ActivityPerMember copyWith(
          {int? id,
          String? activityId,
          String? endingDate,
          String? memberId,
          String? memberName,
          String? startingDate}) =>
      ActivityPerMember(
        id: id ?? this.id,
        activityId: activityId ?? this.activityId,
        endingDate: endingDate ?? this.endingDate,
        memberId: memberId ?? this.memberId,
        memberName: memberName ?? this.memberName,
        startingDate: startingDate ?? this.startingDate,
      );
  @override
  String toString() {
    return (StringBuffer('ActivityPerMember(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('endingDate: $endingDate, ')
          ..write('memberId: $memberId, ')
          ..write('memberName: $memberName, ')
          ..write('startingDate: $startingDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          activityId.hashCode,
          $mrjc(
              endingDate.hashCode,
              $mrjc(memberId.hashCode,
                  $mrjc(memberName.hashCode, startingDate.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityPerMember &&
          other.id == this.id &&
          other.activityId == this.activityId &&
          other.endingDate == this.endingDate &&
          other.memberId == this.memberId &&
          other.memberName == this.memberName &&
          other.startingDate == this.startingDate);
}

class ActivityPerMembersCompanion extends UpdateCompanion<ActivityPerMember> {
  final Value<int> id;
  final Value<String> activityId;
  final Value<String> endingDate;
  final Value<String> memberId;
  final Value<String> memberName;
  final Value<String> startingDate;
  const ActivityPerMembersCompanion({
    this.id = const Value.absent(),
    this.activityId = const Value.absent(),
    this.endingDate = const Value.absent(),
    this.memberId = const Value.absent(),
    this.memberName = const Value.absent(),
    this.startingDate = const Value.absent(),
  });
  ActivityPerMembersCompanion.insert({
    this.id = const Value.absent(),
    required String activityId,
    required String endingDate,
    required String memberId,
    required String memberName,
    required String startingDate,
  })  : activityId = Value(activityId),
        endingDate = Value(endingDate),
        memberId = Value(memberId),
        memberName = Value(memberName),
        startingDate = Value(startingDate);
  static Insertable<ActivityPerMember> custom({
    Expression<int>? id,
    Expression<String>? activityId,
    Expression<String>? endingDate,
    Expression<String>? memberId,
    Expression<String>? memberName,
    Expression<String>? startingDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activityId != null) 'activity_id': activityId,
      if (endingDate != null) 'ending_date': endingDate,
      if (memberId != null) 'member_id': memberId,
      if (memberName != null) 'member_name': memberName,
      if (startingDate != null) 'starting_date': startingDate,
    });
  }

  ActivityPerMembersCompanion copyWith(
      {Value<int>? id,
      Value<String>? activityId,
      Value<String>? endingDate,
      Value<String>? memberId,
      Value<String>? memberName,
      Value<String>? startingDate}) {
    return ActivityPerMembersCompanion(
      id: id ?? this.id,
      activityId: activityId ?? this.activityId,
      endingDate: endingDate ?? this.endingDate,
      memberId: memberId ?? this.memberId,
      memberName: memberName ?? this.memberName,
      startingDate: startingDate ?? this.startingDate,
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
    if (endingDate.present) {
      map['ending_date'] = Variable<String>(endingDate.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (memberName.present) {
      map['member_name'] = Variable<String>(memberName.value);
    }
    if (startingDate.present) {
      map['starting_date'] = Variable<String>(startingDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityPerMembersCompanion(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('endingDate: $endingDate, ')
          ..write('memberId: $memberId, ')
          ..write('memberName: $memberName, ')
          ..write('startingDate: $startingDate')
          ..write(')'))
        .toString();
  }
}

class $ActivityPerMembersTable extends ActivityPerMembers
    with TableInfo<$ActivityPerMembersTable, ActivityPerMember> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ActivityPerMembersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _activityIdMeta = const VerificationMeta('activityId');
  @override
  late final GeneratedTextColumn activityId = _constructActivityId();
  GeneratedTextColumn _constructActivityId() {
    return GeneratedTextColumn('activity_id', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _endingDateMeta = const VerificationMeta('endingDate');
  @override
  late final GeneratedTextColumn endingDate = _constructEndingDate();
  GeneratedTextColumn _constructEndingDate() {
    return GeneratedTextColumn('ending_date', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _memberIdMeta = const VerificationMeta('memberId');
  @override
  late final GeneratedTextColumn memberId = _constructMemberId();
  GeneratedTextColumn _constructMemberId() {
    return GeneratedTextColumn('member_id', $tableName, false,
        minTextLength: 4);
  }

  final VerificationMeta _memberNameMeta = const VerificationMeta('memberName');
  @override
  late final GeneratedTextColumn memberName = _constructMemberName();
  GeneratedTextColumn _constructMemberName() {
    return GeneratedTextColumn('member_name', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _startingDateMeta =
      const VerificationMeta('startingDate');
  @override
  late final GeneratedTextColumn startingDate = _constructStartingDate();
  GeneratedTextColumn _constructStartingDate() {
    return GeneratedTextColumn('starting_date', $tableName, false,
        minTextLength: 1);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, activityId, endingDate, memberId, memberName, startingDate];
  @override
  $ActivityPerMembersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'activity_per_members';
  @override
  final String actualTableName = 'activity_per_members';
  @override
  VerificationContext validateIntegrity(Insertable<ActivityPerMember> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('activity_id')) {
      context.handle(
          _activityIdMeta,
          activityId.isAcceptableOrUnknown(
              data['activity_id']!, _activityIdMeta));
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    if (data.containsKey('ending_date')) {
      context.handle(
          _endingDateMeta,
          endingDate.isAcceptableOrUnknown(
              data['ending_date']!, _endingDateMeta));
    } else if (isInserting) {
      context.missing(_endingDateMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('member_name')) {
      context.handle(
          _memberNameMeta,
          memberName.isAcceptableOrUnknown(
              data['member_name']!, _memberNameMeta));
    } else if (isInserting) {
      context.missing(_memberNameMeta);
    }
    if (data.containsKey('starting_date')) {
      context.handle(
          _startingDateMeta,
          startingDate.isAcceptableOrUnknown(
              data['starting_date']!, _startingDateMeta));
    } else if (isInserting) {
      context.missing(_startingDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityPerMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ActivityPerMember.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ActivityPerMembersTable createAlias(String alias) {
    return $ActivityPerMembersTable(_db, alias);
  }
}

abstract class _$RewardsDatabase extends GeneratedDatabase {
  _$RewardsDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ActivityContentsTable activityContents =
      $ActivityContentsTable(this);
  late final $ActivityProgressionTable activityProgression =
      $ActivityProgressionTable(this);
  late final $ActivityVersionsTable activityVersions =
      $ActivityVersionsTable(this);
  late final $ActivityPerMembersTable activityPerMembers =
      $ActivityPerMembersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        activityContents,
        activityProgression,
        activityVersions,
        activityPerMembers
      ];
}