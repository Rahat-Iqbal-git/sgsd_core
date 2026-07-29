// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DispatchItemsTable extends DispatchItems
    with TableInfo<$DispatchItemsTable, DispatchItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DispatchItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recipientNameMeta = const VerificationMeta(
    'recipientName',
  );
  @override
  late final GeneratedColumn<String> recipientName = GeneratedColumn<String>(
    'recipient_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipientEmailMeta = const VerificationMeta(
    'recipientEmail',
  );
  @override
  late final GeneratedColumn<String> recipientEmail = GeneratedColumn<String>(
    'recipient_email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteStatusMeta = const VerificationMeta(
    'remoteStatus',
  );
  @override
  late final GeneratedColumn<String> remoteStatus = GeneratedColumn<String>(
    'remote_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _destLatMeta = const VerificationMeta(
    'destLat',
  );
  @override
  late final GeneratedColumn<double> destLat = GeneratedColumn<double>(
    'dest_lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _destLngMeta = const VerificationMeta(
    'destLng',
  );
  @override
  late final GeneratedColumn<double> destLng = GeneratedColumn<double>(
    'dest_lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localStatusMeta = const VerificationMeta(
    'localStatus',
  );
  @override
  late final GeneratedColumn<String> localStatus = GeneratedColumn<String>(
    'local_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipientName,
    recipientEmail,
    remoteStatus,
    destLat,
    destLng,
    localStatus,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dispatch_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<DispatchItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipient_name')) {
      context.handle(
        _recipientNameMeta,
        recipientName.isAcceptableOrUnknown(
          data['recipient_name']!,
          _recipientNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recipientNameMeta);
    }
    if (data.containsKey('recipient_email')) {
      context.handle(
        _recipientEmailMeta,
        recipientEmail.isAcceptableOrUnknown(
          data['recipient_email']!,
          _recipientEmailMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recipientEmailMeta);
    }
    if (data.containsKey('remote_status')) {
      context.handle(
        _remoteStatusMeta,
        remoteStatus.isAcceptableOrUnknown(
          data['remote_status']!,
          _remoteStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remoteStatusMeta);
    }
    if (data.containsKey('dest_lat')) {
      context.handle(
        _destLatMeta,
        destLat.isAcceptableOrUnknown(data['dest_lat']!, _destLatMeta),
      );
    } else if (isInserting) {
      context.missing(_destLatMeta);
    }
    if (data.containsKey('dest_lng')) {
      context.handle(
        _destLngMeta,
        destLng.isAcceptableOrUnknown(data['dest_lng']!, _destLngMeta),
      );
    } else if (isInserting) {
      context.missing(_destLngMeta);
    }
    if (data.containsKey('local_status')) {
      context.handle(
        _localStatusMeta,
        localStatus.isAcceptableOrUnknown(
          data['local_status']!,
          _localStatusMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DispatchItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DispatchItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipient_name'],
      )!,
      recipientEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipient_email'],
      )!,
      remoteStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_status'],
      )!,
      destLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}dest_lat'],
      )!,
      destLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}dest_lng'],
      )!,
      localStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_status'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DispatchItemsTable createAlias(String alias) {
    return $DispatchItemsTable(attachedDatabase, alias);
  }
}

class DispatchItemRow extends DataClass implements Insertable<DispatchItemRow> {
  final int id;
  final String recipientName;
  final String recipientEmail;
  final String remoteStatus;
  final double destLat;
  final double destLng;
  final String localStatus;
  final DateTime updatedAt;
  const DispatchItemRow({
    required this.id,
    required this.recipientName,
    required this.recipientEmail,
    required this.remoteStatus,
    required this.destLat,
    required this.destLng,
    required this.localStatus,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipient_name'] = Variable<String>(recipientName);
    map['recipient_email'] = Variable<String>(recipientEmail);
    map['remote_status'] = Variable<String>(remoteStatus);
    map['dest_lat'] = Variable<double>(destLat);
    map['dest_lng'] = Variable<double>(destLng);
    map['local_status'] = Variable<String>(localStatus);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DispatchItemsCompanion toCompanion(bool nullToAbsent) {
    return DispatchItemsCompanion(
      id: Value(id),
      recipientName: Value(recipientName),
      recipientEmail: Value(recipientEmail),
      remoteStatus: Value(remoteStatus),
      destLat: Value(destLat),
      destLng: Value(destLng),
      localStatus: Value(localStatus),
      updatedAt: Value(updatedAt),
    );
  }

  factory DispatchItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DispatchItemRow(
      id: serializer.fromJson<int>(json['id']),
      recipientName: serializer.fromJson<String>(json['recipientName']),
      recipientEmail: serializer.fromJson<String>(json['recipientEmail']),
      remoteStatus: serializer.fromJson<String>(json['remoteStatus']),
      destLat: serializer.fromJson<double>(json['destLat']),
      destLng: serializer.fromJson<double>(json['destLng']),
      localStatus: serializer.fromJson<String>(json['localStatus']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipientName': serializer.toJson<String>(recipientName),
      'recipientEmail': serializer.toJson<String>(recipientEmail),
      'remoteStatus': serializer.toJson<String>(remoteStatus),
      'destLat': serializer.toJson<double>(destLat),
      'destLng': serializer.toJson<double>(destLng),
      'localStatus': serializer.toJson<String>(localStatus),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DispatchItemRow copyWith({
    int? id,
    String? recipientName,
    String? recipientEmail,
    String? remoteStatus,
    double? destLat,
    double? destLng,
    String? localStatus,
    DateTime? updatedAt,
  }) => DispatchItemRow(
    id: id ?? this.id,
    recipientName: recipientName ?? this.recipientName,
    recipientEmail: recipientEmail ?? this.recipientEmail,
    remoteStatus: remoteStatus ?? this.remoteStatus,
    destLat: destLat ?? this.destLat,
    destLng: destLng ?? this.destLng,
    localStatus: localStatus ?? this.localStatus,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DispatchItemRow copyWithCompanion(DispatchItemsCompanion data) {
    return DispatchItemRow(
      id: data.id.present ? data.id.value : this.id,
      recipientName: data.recipientName.present
          ? data.recipientName.value
          : this.recipientName,
      recipientEmail: data.recipientEmail.present
          ? data.recipientEmail.value
          : this.recipientEmail,
      remoteStatus: data.remoteStatus.present
          ? data.remoteStatus.value
          : this.remoteStatus,
      destLat: data.destLat.present ? data.destLat.value : this.destLat,
      destLng: data.destLng.present ? data.destLng.value : this.destLng,
      localStatus: data.localStatus.present
          ? data.localStatus.value
          : this.localStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DispatchItemRow(')
          ..write('id: $id, ')
          ..write('recipientName: $recipientName, ')
          ..write('recipientEmail: $recipientEmail, ')
          ..write('remoteStatus: $remoteStatus, ')
          ..write('destLat: $destLat, ')
          ..write('destLng: $destLng, ')
          ..write('localStatus: $localStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recipientName,
    recipientEmail,
    remoteStatus,
    destLat,
    destLng,
    localStatus,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DispatchItemRow &&
          other.id == this.id &&
          other.recipientName == this.recipientName &&
          other.recipientEmail == this.recipientEmail &&
          other.remoteStatus == this.remoteStatus &&
          other.destLat == this.destLat &&
          other.destLng == this.destLng &&
          other.localStatus == this.localStatus &&
          other.updatedAt == this.updatedAt);
}

class DispatchItemsCompanion extends UpdateCompanion<DispatchItemRow> {
  final Value<int> id;
  final Value<String> recipientName;
  final Value<String> recipientEmail;
  final Value<String> remoteStatus;
  final Value<double> destLat;
  final Value<double> destLng;
  final Value<String> localStatus;
  final Value<DateTime> updatedAt;
  const DispatchItemsCompanion({
    this.id = const Value.absent(),
    this.recipientName = const Value.absent(),
    this.recipientEmail = const Value.absent(),
    this.remoteStatus = const Value.absent(),
    this.destLat = const Value.absent(),
    this.destLng = const Value.absent(),
    this.localStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DispatchItemsCompanion.insert({
    this.id = const Value.absent(),
    required String recipientName,
    required String recipientEmail,
    required String remoteStatus,
    required double destLat,
    required double destLng,
    this.localStatus = const Value.absent(),
    required DateTime updatedAt,
  }) : recipientName = Value(recipientName),
       recipientEmail = Value(recipientEmail),
       remoteStatus = Value(remoteStatus),
       destLat = Value(destLat),
       destLng = Value(destLng),
       updatedAt = Value(updatedAt);
  static Insertable<DispatchItemRow> custom({
    Expression<int>? id,
    Expression<String>? recipientName,
    Expression<String>? recipientEmail,
    Expression<String>? remoteStatus,
    Expression<double>? destLat,
    Expression<double>? destLng,
    Expression<String>? localStatus,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipientName != null) 'recipient_name': recipientName,
      if (recipientEmail != null) 'recipient_email': recipientEmail,
      if (remoteStatus != null) 'remote_status': remoteStatus,
      if (destLat != null) 'dest_lat': destLat,
      if (destLng != null) 'dest_lng': destLng,
      if (localStatus != null) 'local_status': localStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DispatchItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? recipientName,
    Value<String>? recipientEmail,
    Value<String>? remoteStatus,
    Value<double>? destLat,
    Value<double>? destLng,
    Value<String>? localStatus,
    Value<DateTime>? updatedAt,
  }) {
    return DispatchItemsCompanion(
      id: id ?? this.id,
      recipientName: recipientName ?? this.recipientName,
      recipientEmail: recipientEmail ?? this.recipientEmail,
      remoteStatus: remoteStatus ?? this.remoteStatus,
      destLat: destLat ?? this.destLat,
      destLng: destLng ?? this.destLng,
      localStatus: localStatus ?? this.localStatus,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipientName.present) {
      map['recipient_name'] = Variable<String>(recipientName.value);
    }
    if (recipientEmail.present) {
      map['recipient_email'] = Variable<String>(recipientEmail.value);
    }
    if (remoteStatus.present) {
      map['remote_status'] = Variable<String>(remoteStatus.value);
    }
    if (destLat.present) {
      map['dest_lat'] = Variable<double>(destLat.value);
    }
    if (destLng.present) {
      map['dest_lng'] = Variable<double>(destLng.value);
    }
    if (localStatus.present) {
      map['local_status'] = Variable<String>(localStatus.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DispatchItemsCompanion(')
          ..write('id: $id, ')
          ..write('recipientName: $recipientName, ')
          ..write('recipientEmail: $recipientEmail, ')
          ..write('remoteStatus: $remoteStatus, ')
          ..write('destLat: $destLat, ')
          ..write('destLng: $destLng, ')
          ..write('localStatus: $localStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BreadcrumbsTable extends Breadcrumbs
    with TableInfo<$BreadcrumbsTable, BreadcrumbRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BreadcrumbsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double> speed = GeneratedColumn<double>(
    'speed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accuracyMeta = const VerificationMeta(
    'accuracy',
  );
  @override
  late final GeneratedColumn<double> accuracy = GeneratedColumn<double>(
    'accuracy',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressLabelMeta = const VerificationMeta(
    'addressLabel',
  );
  @override
  late final GeneratedColumn<String> addressLabel = GeneratedColumn<String>(
    'address_label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
    'synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextAttemptAtMeta = const VerificationMeta(
    'nextAttemptAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextAttemptAt =
      GeneratedColumn<DateTime>(
        'next_attempt_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lat,
    lng,
    speed,
    accuracy,
    recordedAt,
    addressLabel,
    synced,
    attempts,
    nextAttemptAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'breadcrumbs';
  @override
  VerificationContext validateIntegrity(
    Insertable<BreadcrumbRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('speed')) {
      context.handle(
        _speedMeta,
        speed.isAcceptableOrUnknown(data['speed']!, _speedMeta),
      );
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('accuracy')) {
      context.handle(
        _accuracyMeta,
        accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta),
      );
    } else if (isInserting) {
      context.missing(_accuracyMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('address_label')) {
      context.handle(
        _addressLabelMeta,
        addressLabel.isAcceptableOrUnknown(
          data['address_label']!,
          _addressLabelMeta,
        ),
      );
    }
    if (data.containsKey('synced')) {
      context.handle(
        _syncedMeta,
        synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta),
      );
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('next_attempt_at')) {
      context.handle(
        _nextAttemptAtMeta,
        nextAttemptAt.isAcceptableOrUnknown(
          data['next_attempt_at']!,
          _nextAttemptAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BreadcrumbRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BreadcrumbRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      )!,
      speed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speed'],
      )!,
      accuracy: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}accuracy'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      addressLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_label'],
      ),
      synced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      nextAttemptAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_attempt_at'],
      ),
    );
  }

  @override
  $BreadcrumbsTable createAlias(String alias) {
    return $BreadcrumbsTable(attachedDatabase, alias);
  }
}

class BreadcrumbRow extends DataClass implements Insertable<BreadcrumbRow> {
  final int id;
  final double lat;
  final double lng;
  final double speed;
  final double accuracy;
  final DateTime recordedAt;
  final String? addressLabel;
  final bool synced;
  final int attempts;
  final DateTime? nextAttemptAt;
  const BreadcrumbRow({
    required this.id,
    required this.lat,
    required this.lng,
    required this.speed,
    required this.accuracy,
    required this.recordedAt,
    this.addressLabel,
    required this.synced,
    required this.attempts,
    this.nextAttemptAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['speed'] = Variable<double>(speed);
    map['accuracy'] = Variable<double>(accuracy);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    if (!nullToAbsent || addressLabel != null) {
      map['address_label'] = Variable<String>(addressLabel);
    }
    map['synced'] = Variable<bool>(synced);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || nextAttemptAt != null) {
      map['next_attempt_at'] = Variable<DateTime>(nextAttemptAt);
    }
    return map;
  }

  BreadcrumbsCompanion toCompanion(bool nullToAbsent) {
    return BreadcrumbsCompanion(
      id: Value(id),
      lat: Value(lat),
      lng: Value(lng),
      speed: Value(speed),
      accuracy: Value(accuracy),
      recordedAt: Value(recordedAt),
      addressLabel: addressLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(addressLabel),
      synced: Value(synced),
      attempts: Value(attempts),
      nextAttemptAt: nextAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextAttemptAt),
    );
  }

  factory BreadcrumbRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BreadcrumbRow(
      id: serializer.fromJson<int>(json['id']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      speed: serializer.fromJson<double>(json['speed']),
      accuracy: serializer.fromJson<double>(json['accuracy']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      addressLabel: serializer.fromJson<String?>(json['addressLabel']),
      synced: serializer.fromJson<bool>(json['synced']),
      attempts: serializer.fromJson<int>(json['attempts']),
      nextAttemptAt: serializer.fromJson<DateTime?>(json['nextAttemptAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'speed': serializer.toJson<double>(speed),
      'accuracy': serializer.toJson<double>(accuracy),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'addressLabel': serializer.toJson<String?>(addressLabel),
      'synced': serializer.toJson<bool>(synced),
      'attempts': serializer.toJson<int>(attempts),
      'nextAttemptAt': serializer.toJson<DateTime?>(nextAttemptAt),
    };
  }

  BreadcrumbRow copyWith({
    int? id,
    double? lat,
    double? lng,
    double? speed,
    double? accuracy,
    DateTime? recordedAt,
    Value<String?> addressLabel = const Value.absent(),
    bool? synced,
    int? attempts,
    Value<DateTime?> nextAttemptAt = const Value.absent(),
  }) => BreadcrumbRow(
    id: id ?? this.id,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    speed: speed ?? this.speed,
    accuracy: accuracy ?? this.accuracy,
    recordedAt: recordedAt ?? this.recordedAt,
    addressLabel: addressLabel.present ? addressLabel.value : this.addressLabel,
    synced: synced ?? this.synced,
    attempts: attempts ?? this.attempts,
    nextAttemptAt: nextAttemptAt.present
        ? nextAttemptAt.value
        : this.nextAttemptAt,
  );
  BreadcrumbRow copyWithCompanion(BreadcrumbsCompanion data) {
    return BreadcrumbRow(
      id: data.id.present ? data.id.value : this.id,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      speed: data.speed.present ? data.speed.value : this.speed,
      accuracy: data.accuracy.present ? data.accuracy.value : this.accuracy,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      addressLabel: data.addressLabel.present
          ? data.addressLabel.value
          : this.addressLabel,
      synced: data.synced.present ? data.synced.value : this.synced,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      nextAttemptAt: data.nextAttemptAt.present
          ? data.nextAttemptAt.value
          : this.nextAttemptAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BreadcrumbRow(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('speed: $speed, ')
          ..write('accuracy: $accuracy, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('addressLabel: $addressLabel, ')
          ..write('synced: $synced, ')
          ..write('attempts: $attempts, ')
          ..write('nextAttemptAt: $nextAttemptAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lat,
    lng,
    speed,
    accuracy,
    recordedAt,
    addressLabel,
    synced,
    attempts,
    nextAttemptAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BreadcrumbRow &&
          other.id == this.id &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.speed == this.speed &&
          other.accuracy == this.accuracy &&
          other.recordedAt == this.recordedAt &&
          other.addressLabel == this.addressLabel &&
          other.synced == this.synced &&
          other.attempts == this.attempts &&
          other.nextAttemptAt == this.nextAttemptAt);
}

class BreadcrumbsCompanion extends UpdateCompanion<BreadcrumbRow> {
  final Value<int> id;
  final Value<double> lat;
  final Value<double> lng;
  final Value<double> speed;
  final Value<double> accuracy;
  final Value<DateTime> recordedAt;
  final Value<String?> addressLabel;
  final Value<bool> synced;
  final Value<int> attempts;
  final Value<DateTime?> nextAttemptAt;
  const BreadcrumbsCompanion({
    this.id = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.speed = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.addressLabel = const Value.absent(),
    this.synced = const Value.absent(),
    this.attempts = const Value.absent(),
    this.nextAttemptAt = const Value.absent(),
  });
  BreadcrumbsCompanion.insert({
    this.id = const Value.absent(),
    required double lat,
    required double lng,
    required double speed,
    required double accuracy,
    required DateTime recordedAt,
    this.addressLabel = const Value.absent(),
    this.synced = const Value.absent(),
    this.attempts = const Value.absent(),
    this.nextAttemptAt = const Value.absent(),
  }) : lat = Value(lat),
       lng = Value(lng),
       speed = Value(speed),
       accuracy = Value(accuracy),
       recordedAt = Value(recordedAt);
  static Insertable<BreadcrumbRow> custom({
    Expression<int>? id,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<double>? speed,
    Expression<double>? accuracy,
    Expression<DateTime>? recordedAt,
    Expression<String>? addressLabel,
    Expression<bool>? synced,
    Expression<int>? attempts,
    Expression<DateTime>? nextAttemptAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (speed != null) 'speed': speed,
      if (accuracy != null) 'accuracy': accuracy,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (addressLabel != null) 'address_label': addressLabel,
      if (synced != null) 'synced': synced,
      if (attempts != null) 'attempts': attempts,
      if (nextAttemptAt != null) 'next_attempt_at': nextAttemptAt,
    });
  }

  BreadcrumbsCompanion copyWith({
    Value<int>? id,
    Value<double>? lat,
    Value<double>? lng,
    Value<double>? speed,
    Value<double>? accuracy,
    Value<DateTime>? recordedAt,
    Value<String?>? addressLabel,
    Value<bool>? synced,
    Value<int>? attempts,
    Value<DateTime?>? nextAttemptAt,
  }) {
    return BreadcrumbsCompanion(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      speed: speed ?? this.speed,
      accuracy: accuracy ?? this.accuracy,
      recordedAt: recordedAt ?? this.recordedAt,
      addressLabel: addressLabel ?? this.addressLabel,
      synced: synced ?? this.synced,
      attempts: attempts ?? this.attempts,
      nextAttemptAt: nextAttemptAt ?? this.nextAttemptAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<double>(accuracy.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (addressLabel.present) {
      map['address_label'] = Variable<String>(addressLabel.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (nextAttemptAt.present) {
      map['next_attempt_at'] = Variable<DateTime>(nextAttemptAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreadcrumbsCompanion(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('speed: $speed, ')
          ..write('accuracy: $accuracy, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('addressLabel: $addressLabel, ')
          ..write('synced: $synced, ')
          ..write('attempts: $attempts, ')
          ..write('nextAttemptAt: $nextAttemptAt')
          ..write(')'))
        .toString();
  }
}

class $GeocodeCacheTable extends GeocodeCache
    with TableInfo<$GeocodeCacheTable, GeocodeCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeocodeCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _latRoundedMeta = const VerificationMeta(
    'latRounded',
  );
  @override
  late final GeneratedColumn<double> latRounded = GeneratedColumn<double>(
    'lat_rounded',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lngRoundedMeta = const VerificationMeta(
    'lngRounded',
  );
  @override
  late final GeneratedColumn<double> lngRounded = GeneratedColumn<double>(
    'lng_rounded',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    latRounded,
    lngRounded,
    address,
    fetchedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'geocode_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<GeocodeCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('lat_rounded')) {
      context.handle(
        _latRoundedMeta,
        latRounded.isAcceptableOrUnknown(data['lat_rounded']!, _latRoundedMeta),
      );
    } else if (isInserting) {
      context.missing(_latRoundedMeta);
    }
    if (data.containsKey('lng_rounded')) {
      context.handle(
        _lngRoundedMeta,
        lngRounded.isAcceptableOrUnknown(data['lng_rounded']!, _lngRoundedMeta),
      );
    } else if (isInserting) {
      context.missing(_lngRoundedMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {latRounded, lngRounded};
  @override
  GeocodeCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeocodeCacheRow(
      latRounded: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat_rounded'],
      )!,
      lngRounded: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng_rounded'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
    );
  }

  @override
  $GeocodeCacheTable createAlias(String alias) {
    return $GeocodeCacheTable(attachedDatabase, alias);
  }
}

class GeocodeCacheRow extends DataClass implements Insertable<GeocodeCacheRow> {
  final double latRounded;
  final double lngRounded;
  final String address;
  final DateTime fetchedAt;
  const GeocodeCacheRow({
    required this.latRounded,
    required this.lngRounded,
    required this.address,
    required this.fetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['lat_rounded'] = Variable<double>(latRounded);
    map['lng_rounded'] = Variable<double>(lngRounded);
    map['address'] = Variable<String>(address);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  GeocodeCacheCompanion toCompanion(bool nullToAbsent) {
    return GeocodeCacheCompanion(
      latRounded: Value(latRounded),
      lngRounded: Value(lngRounded),
      address: Value(address),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory GeocodeCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeocodeCacheRow(
      latRounded: serializer.fromJson<double>(json['latRounded']),
      lngRounded: serializer.fromJson<double>(json['lngRounded']),
      address: serializer.fromJson<String>(json['address']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'latRounded': serializer.toJson<double>(latRounded),
      'lngRounded': serializer.toJson<double>(lngRounded),
      'address': serializer.toJson<String>(address),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  GeocodeCacheRow copyWith({
    double? latRounded,
    double? lngRounded,
    String? address,
    DateTime? fetchedAt,
  }) => GeocodeCacheRow(
    latRounded: latRounded ?? this.latRounded,
    lngRounded: lngRounded ?? this.lngRounded,
    address: address ?? this.address,
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
  GeocodeCacheRow copyWithCompanion(GeocodeCacheCompanion data) {
    return GeocodeCacheRow(
      latRounded: data.latRounded.present
          ? data.latRounded.value
          : this.latRounded,
      lngRounded: data.lngRounded.present
          ? data.lngRounded.value
          : this.lngRounded,
      address: data.address.present ? data.address.value : this.address,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeocodeCacheRow(')
          ..write('latRounded: $latRounded, ')
          ..write('lngRounded: $lngRounded, ')
          ..write('address: $address, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(latRounded, lngRounded, address, fetchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeocodeCacheRow &&
          other.latRounded == this.latRounded &&
          other.lngRounded == this.lngRounded &&
          other.address == this.address &&
          other.fetchedAt == this.fetchedAt);
}

class GeocodeCacheCompanion extends UpdateCompanion<GeocodeCacheRow> {
  final Value<double> latRounded;
  final Value<double> lngRounded;
  final Value<String> address;
  final Value<DateTime> fetchedAt;
  final Value<int> rowid;
  const GeocodeCacheCompanion({
    this.latRounded = const Value.absent(),
    this.lngRounded = const Value.absent(),
    this.address = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GeocodeCacheCompanion.insert({
    required double latRounded,
    required double lngRounded,
    required String address,
    required DateTime fetchedAt,
    this.rowid = const Value.absent(),
  }) : latRounded = Value(latRounded),
       lngRounded = Value(lngRounded),
       address = Value(address),
       fetchedAt = Value(fetchedAt);
  static Insertable<GeocodeCacheRow> custom({
    Expression<double>? latRounded,
    Expression<double>? lngRounded,
    Expression<String>? address,
    Expression<DateTime>? fetchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (latRounded != null) 'lat_rounded': latRounded,
      if (lngRounded != null) 'lng_rounded': lngRounded,
      if (address != null) 'address': address,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GeocodeCacheCompanion copyWith({
    Value<double>? latRounded,
    Value<double>? lngRounded,
    Value<String>? address,
    Value<DateTime>? fetchedAt,
    Value<int>? rowid,
  }) {
    return GeocodeCacheCompanion(
      latRounded: latRounded ?? this.latRounded,
      lngRounded: lngRounded ?? this.lngRounded,
      address: address ?? this.address,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (latRounded.present) {
      map['lat_rounded'] = Variable<double>(latRounded.value);
    }
    if (lngRounded.present) {
      map['lng_rounded'] = Variable<double>(lngRounded.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeocodeCacheCompanion(')
          ..write('latRounded: $latRounded, ')
          ..write('lngRounded: $lngRounded, ')
          ..write('address: $address, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DispatchItemsTable dispatchItems = $DispatchItemsTable(this);
  late final $BreadcrumbsTable breadcrumbs = $BreadcrumbsTable(this);
  late final $GeocodeCacheTable geocodeCache = $GeocodeCacheTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dispatchItems,
    breadcrumbs,
    geocodeCache,
  ];
}

typedef $$DispatchItemsTableCreateCompanionBuilder =
    DispatchItemsCompanion Function({
      Value<int> id,
      required String recipientName,
      required String recipientEmail,
      required String remoteStatus,
      required double destLat,
      required double destLng,
      Value<String> localStatus,
      required DateTime updatedAt,
    });
typedef $$DispatchItemsTableUpdateCompanionBuilder =
    DispatchItemsCompanion Function({
      Value<int> id,
      Value<String> recipientName,
      Value<String> recipientEmail,
      Value<String> remoteStatus,
      Value<double> destLat,
      Value<double> destLng,
      Value<String> localStatus,
      Value<DateTime> updatedAt,
    });

class $$DispatchItemsTableFilterComposer
    extends Composer<_$AppDatabase, $DispatchItemsTable> {
  $$DispatchItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipientEmail => $composableBuilder(
    column: $table.recipientEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteStatus => $composableBuilder(
    column: $table.remoteStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get destLat => $composableBuilder(
    column: $table.destLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get destLng => $composableBuilder(
    column: $table.destLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localStatus => $composableBuilder(
    column: $table.localStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DispatchItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $DispatchItemsTable> {
  $$DispatchItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipientEmail => $composableBuilder(
    column: $table.recipientEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteStatus => $composableBuilder(
    column: $table.remoteStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get destLat => $composableBuilder(
    column: $table.destLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get destLng => $composableBuilder(
    column: $table.destLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localStatus => $composableBuilder(
    column: $table.localStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DispatchItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DispatchItemsTable> {
  $$DispatchItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recipientEmail => $composableBuilder(
    column: $table.recipientEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remoteStatus => $composableBuilder(
    column: $table.remoteStatus,
    builder: (column) => column,
  );

  GeneratedColumn<double> get destLat =>
      $composableBuilder(column: $table.destLat, builder: (column) => column);

  GeneratedColumn<double> get destLng =>
      $composableBuilder(column: $table.destLng, builder: (column) => column);

  GeneratedColumn<String> get localStatus => $composableBuilder(
    column: $table.localStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DispatchItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DispatchItemsTable,
          DispatchItemRow,
          $$DispatchItemsTableFilterComposer,
          $$DispatchItemsTableOrderingComposer,
          $$DispatchItemsTableAnnotationComposer,
          $$DispatchItemsTableCreateCompanionBuilder,
          $$DispatchItemsTableUpdateCompanionBuilder,
          (
            DispatchItemRow,
            BaseReferences<_$AppDatabase, $DispatchItemsTable, DispatchItemRow>,
          ),
          DispatchItemRow,
          PrefetchHooks Function()
        > {
  $$DispatchItemsTableTableManager(_$AppDatabase db, $DispatchItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DispatchItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DispatchItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DispatchItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> recipientName = const Value.absent(),
                Value<String> recipientEmail = const Value.absent(),
                Value<String> remoteStatus = const Value.absent(),
                Value<double> destLat = const Value.absent(),
                Value<double> destLng = const Value.absent(),
                Value<String> localStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DispatchItemsCompanion(
                id: id,
                recipientName: recipientName,
                recipientEmail: recipientEmail,
                remoteStatus: remoteStatus,
                destLat: destLat,
                destLng: destLng,
                localStatus: localStatus,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String recipientName,
                required String recipientEmail,
                required String remoteStatus,
                required double destLat,
                required double destLng,
                Value<String> localStatus = const Value.absent(),
                required DateTime updatedAt,
              }) => DispatchItemsCompanion.insert(
                id: id,
                recipientName: recipientName,
                recipientEmail: recipientEmail,
                remoteStatus: remoteStatus,
                destLat: destLat,
                destLng: destLng,
                localStatus: localStatus,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DispatchItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DispatchItemsTable,
      DispatchItemRow,
      $$DispatchItemsTableFilterComposer,
      $$DispatchItemsTableOrderingComposer,
      $$DispatchItemsTableAnnotationComposer,
      $$DispatchItemsTableCreateCompanionBuilder,
      $$DispatchItemsTableUpdateCompanionBuilder,
      (
        DispatchItemRow,
        BaseReferences<_$AppDatabase, $DispatchItemsTable, DispatchItemRow>,
      ),
      DispatchItemRow,
      PrefetchHooks Function()
    >;
typedef $$BreadcrumbsTableCreateCompanionBuilder =
    BreadcrumbsCompanion Function({
      Value<int> id,
      required double lat,
      required double lng,
      required double speed,
      required double accuracy,
      required DateTime recordedAt,
      Value<String?> addressLabel,
      Value<bool> synced,
      Value<int> attempts,
      Value<DateTime?> nextAttemptAt,
    });
typedef $$BreadcrumbsTableUpdateCompanionBuilder =
    BreadcrumbsCompanion Function({
      Value<int> id,
      Value<double> lat,
      Value<double> lng,
      Value<double> speed,
      Value<double> accuracy,
      Value<DateTime> recordedAt,
      Value<String?> addressLabel,
      Value<bool> synced,
      Value<int> attempts,
      Value<DateTime?> nextAttemptAt,
    });

class $$BreadcrumbsTableFilterComposer
    extends Composer<_$AppDatabase, $BreadcrumbsTable> {
  $$BreadcrumbsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get accuracy => $composableBuilder(
    column: $table.accuracy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressLabel => $composableBuilder(
    column: $table.addressLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get synced => $composableBuilder(
    column: $table.synced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BreadcrumbsTableOrderingComposer
    extends Composer<_$AppDatabase, $BreadcrumbsTable> {
  $$BreadcrumbsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get speed => $composableBuilder(
    column: $table.speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get accuracy => $composableBuilder(
    column: $table.accuracy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressLabel => $composableBuilder(
    column: $table.addressLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get synced => $composableBuilder(
    column: $table.synced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BreadcrumbsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BreadcrumbsTable> {
  $$BreadcrumbsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<double> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  GeneratedColumn<double> get accuracy =>
      $composableBuilder(column: $table.accuracy, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get addressLabel => $composableBuilder(
    column: $table.addressLabel,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => column,
  );
}

class $$BreadcrumbsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BreadcrumbsTable,
          BreadcrumbRow,
          $$BreadcrumbsTableFilterComposer,
          $$BreadcrumbsTableOrderingComposer,
          $$BreadcrumbsTableAnnotationComposer,
          $$BreadcrumbsTableCreateCompanionBuilder,
          $$BreadcrumbsTableUpdateCompanionBuilder,
          (
            BreadcrumbRow,
            BaseReferences<_$AppDatabase, $BreadcrumbsTable, BreadcrumbRow>,
          ),
          BreadcrumbRow,
          PrefetchHooks Function()
        > {
  $$BreadcrumbsTableTableManager(_$AppDatabase db, $BreadcrumbsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BreadcrumbsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BreadcrumbsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BreadcrumbsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lng = const Value.absent(),
                Value<double> speed = const Value.absent(),
                Value<double> accuracy = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<String?> addressLabel = const Value.absent(),
                Value<bool> synced = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime?> nextAttemptAt = const Value.absent(),
              }) => BreadcrumbsCompanion(
                id: id,
                lat: lat,
                lng: lng,
                speed: speed,
                accuracy: accuracy,
                recordedAt: recordedAt,
                addressLabel: addressLabel,
                synced: synced,
                attempts: attempts,
                nextAttemptAt: nextAttemptAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double lat,
                required double lng,
                required double speed,
                required double accuracy,
                required DateTime recordedAt,
                Value<String?> addressLabel = const Value.absent(),
                Value<bool> synced = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime?> nextAttemptAt = const Value.absent(),
              }) => BreadcrumbsCompanion.insert(
                id: id,
                lat: lat,
                lng: lng,
                speed: speed,
                accuracy: accuracy,
                recordedAt: recordedAt,
                addressLabel: addressLabel,
                synced: synced,
                attempts: attempts,
                nextAttemptAt: nextAttemptAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BreadcrumbsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BreadcrumbsTable,
      BreadcrumbRow,
      $$BreadcrumbsTableFilterComposer,
      $$BreadcrumbsTableOrderingComposer,
      $$BreadcrumbsTableAnnotationComposer,
      $$BreadcrumbsTableCreateCompanionBuilder,
      $$BreadcrumbsTableUpdateCompanionBuilder,
      (
        BreadcrumbRow,
        BaseReferences<_$AppDatabase, $BreadcrumbsTable, BreadcrumbRow>,
      ),
      BreadcrumbRow,
      PrefetchHooks Function()
    >;
typedef $$GeocodeCacheTableCreateCompanionBuilder =
    GeocodeCacheCompanion Function({
      required double latRounded,
      required double lngRounded,
      required String address,
      required DateTime fetchedAt,
      Value<int> rowid,
    });
typedef $$GeocodeCacheTableUpdateCompanionBuilder =
    GeocodeCacheCompanion Function({
      Value<double> latRounded,
      Value<double> lngRounded,
      Value<String> address,
      Value<DateTime> fetchedAt,
      Value<int> rowid,
    });

class $$GeocodeCacheTableFilterComposer
    extends Composer<_$AppDatabase, $GeocodeCacheTable> {
  $$GeocodeCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get latRounded => $composableBuilder(
    column: $table.latRounded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lngRounded => $composableBuilder(
    column: $table.lngRounded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GeocodeCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $GeocodeCacheTable> {
  $$GeocodeCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get latRounded => $composableBuilder(
    column: $table.latRounded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lngRounded => $composableBuilder(
    column: $table.lngRounded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GeocodeCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $GeocodeCacheTable> {
  $$GeocodeCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get latRounded => $composableBuilder(
    column: $table.latRounded,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lngRounded => $composableBuilder(
    column: $table.lngRounded,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);
}

class $$GeocodeCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GeocodeCacheTable,
          GeocodeCacheRow,
          $$GeocodeCacheTableFilterComposer,
          $$GeocodeCacheTableOrderingComposer,
          $$GeocodeCacheTableAnnotationComposer,
          $$GeocodeCacheTableCreateCompanionBuilder,
          $$GeocodeCacheTableUpdateCompanionBuilder,
          (
            GeocodeCacheRow,
            BaseReferences<_$AppDatabase, $GeocodeCacheTable, GeocodeCacheRow>,
          ),
          GeocodeCacheRow,
          PrefetchHooks Function()
        > {
  $$GeocodeCacheTableTableManager(_$AppDatabase db, $GeocodeCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GeocodeCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GeocodeCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GeocodeCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<double> latRounded = const Value.absent(),
                Value<double> lngRounded = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GeocodeCacheCompanion(
                latRounded: latRounded,
                lngRounded: lngRounded,
                address: address,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required double latRounded,
                required double lngRounded,
                required String address,
                required DateTime fetchedAt,
                Value<int> rowid = const Value.absent(),
              }) => GeocodeCacheCompanion.insert(
                latRounded: latRounded,
                lngRounded: lngRounded,
                address: address,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GeocodeCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GeocodeCacheTable,
      GeocodeCacheRow,
      $$GeocodeCacheTableFilterComposer,
      $$GeocodeCacheTableOrderingComposer,
      $$GeocodeCacheTableAnnotationComposer,
      $$GeocodeCacheTableCreateCompanionBuilder,
      $$GeocodeCacheTableUpdateCompanionBuilder,
      (
        GeocodeCacheRow,
        BaseReferences<_$AppDatabase, $GeocodeCacheTable, GeocodeCacheRow>,
      ),
      GeocodeCacheRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DispatchItemsTableTableManager get dispatchItems =>
      $$DispatchItemsTableTableManager(_db, _db.dispatchItems);
  $$BreadcrumbsTableTableManager get breadcrumbs =>
      $$BreadcrumbsTableTableManager(_db, _db.breadcrumbs);
  $$GeocodeCacheTableTableManager get geocodeCache =>
      $$GeocodeCacheTableTableManager(_db, _db.geocodeCache);
}
