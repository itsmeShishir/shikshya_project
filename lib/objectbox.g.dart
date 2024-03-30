// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;

import 'objectbox/productModel_objectbox.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 4113246739074512605),
      name: 'ProductModalObjectBox',
      lastPropertyId: const obx_int.IdUid(10, 4983685404115071743),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4306045011471429362),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7672477938190763126),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 55205758584119115),
            name: 'description',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 527777695461741007),
            name: 'price',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 8469590404184048526),
            name: 'ratings',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 8043797547782330955),
            name: 'category',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 3679134287157101465),
            name: 'stock',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 4304362490208090330),
            name: 'NoOfReviews',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 773759139227970654),
            name: 'createdAt',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(10, 4983685404115071743),
            name: 'time',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
obx.Store openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) {
  return obx.Store(getObjectBoxModel(),
      directory: directory,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 4113246739074512605),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    ProductModalObjectBox: obx_int.EntityDefinition<ProductModalObjectBox>(
        model: _entities[0],
        toOneRelations: (ProductModalObjectBox object) => [],
        toManyRelations: (ProductModalObjectBox object) => {},
        getId: (ProductModalObjectBox object) => object.id,
        setId: (ProductModalObjectBox object, int id) {
          object.id = id;
        },
        objectToFB: (ProductModalObjectBox object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          final categoryOffset = object.category == null
              ? null
              : fbb.writeString(object.category!);
          final createdAtOffset = object.createdAt == null
              ? null
              : fbb.writeString(object.createdAt!);
          final timeOffset =
              object.time == null ? null : fbb.writeString(object.time!);
          fbb.startTable(11);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addInt64(3, object.price);
          fbb.addFloat64(4, object.ratings);
          fbb.addOffset(5, categoryOffset);
          fbb.addInt64(6, object.stock);
          fbb.addInt64(7, object.NoOfReviews);
          fbb.addOffset(8, createdAtOffset);
          fbb.addOffset(9, timeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final priceParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final ratingsParam = const fb.Float64Reader()
              .vTableGetNullable(buffer, rootOffset, 12);
          final categoryParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 14);
          final stockParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 16);
          final NoOfReviewsParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 18);
          final createdAtParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 20);
          final timeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 22);
          final object = ProductModalObjectBox(
              name: nameParam,
              price: priceParam,
              ratings: ratingsParam,
              category: categoryParam,
              stock: stockParam,
              NoOfReviews: NoOfReviewsParam,
              createdAt: createdAtParam,
              time: timeParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..description = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [ProductModalObjectBox] entity fields to define ObjectBox queries.
class ProductModalObjectBox_ {
  /// see [ProductModalObjectBox.id]
  static final id = obx.QueryIntegerProperty<ProductModalObjectBox>(
      _entities[0].properties[0]);

  /// see [ProductModalObjectBox.name]
  static final name = obx.QueryStringProperty<ProductModalObjectBox>(
      _entities[0].properties[1]);

  /// see [ProductModalObjectBox.description]
  static final description = obx.QueryStringProperty<ProductModalObjectBox>(
      _entities[0].properties[2]);

  /// see [ProductModalObjectBox.price]
  static final price = obx.QueryIntegerProperty<ProductModalObjectBox>(
      _entities[0].properties[3]);

  /// see [ProductModalObjectBox.ratings]
  static final ratings = obx.QueryDoubleProperty<ProductModalObjectBox>(
      _entities[0].properties[4]);

  /// see [ProductModalObjectBox.category]
  static final category = obx.QueryStringProperty<ProductModalObjectBox>(
      _entities[0].properties[5]);

  /// see [ProductModalObjectBox.stock]
  static final stock = obx.QueryIntegerProperty<ProductModalObjectBox>(
      _entities[0].properties[6]);

  /// see [ProductModalObjectBox.NoOfReviews]
  static final NoOfReviews = obx.QueryIntegerProperty<ProductModalObjectBox>(
      _entities[0].properties[7]);

  /// see [ProductModalObjectBox.createdAt]
  static final createdAt = obx.QueryStringProperty<ProductModalObjectBox>(
      _entities[0].properties[8]);

  /// see [ProductModalObjectBox.time]
  static final time = obx.QueryStringProperty<ProductModalObjectBox>(
      _entities[0].properties[9]);
}