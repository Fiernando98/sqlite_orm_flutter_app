import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'models.g.dart';

const tableRestaurant = SqfEntityTable(
    tableName: 'restaurant',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    fields: [
      SqfEntityField('name', DbType.text, isNotNull: true),
      SqfEntityField('latitude', DbType.real, isNotNull: false),
      SqfEntityField('longitude', DbType.real, isNotNull: false)
    ]);

const tableFood = SqfEntityTable(
    tableName: 'food',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    fields: [
      SqfEntityField('name', DbType.text, isNotNull: true),
      SqfEntityField('calories', DbType.real, isNotNull: true),
      SqfEntityFieldRelationship(
          fieldName: "id_restaurant",
          parentTable: tableRestaurant,
          relationType: RelationType.ONE_TO_MANY,
          deleteRule: DeleteRule.CASCADE,
          isNotNull: true)
    ]);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
    modelName: 'MyDbModel',
    databaseName: 'sampleORM.db',
    databaseTables: [tableRestaurant, tableFood]);
