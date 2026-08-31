sed -i '/Future<void> createDefaultTables() async {/i \
Future<void> importTableData(String tableName, List<dynamic> data) async {\
  for (var row in data) {\
    if (row is Map<String, dynamic>) {\
      try {\
        await _database.insert(tableName, row, conflictAlgorithm: ConflictAlgorithm.replace);\
      } catch (e) {\
        logger.e("Failed to insert row into $tableName: $e");\
      }\
    }\
  }\
}' lib/services/database_manager.dart
