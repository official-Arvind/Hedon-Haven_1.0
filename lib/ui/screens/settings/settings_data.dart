import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '/services/database_manager.dart';
import '/ui/utils/toast_notification.dart';
import '/utils/global_vars.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  Future<void> _exportData() async {
    try {
      final watchHistory = await getAllFrom("watch_history");
      final searchHistory = await getAllFrom("search_history");
      final favorites = await getAllFrom("favorites");

      Map<String, dynamic> exportData = {
        "watch_history": watchHistory,
        "search_history": searchHistory,
        "favorites": favorites,
      };

      String jsonStr = jsonEncode(exportData);

      String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Please select an output file:',
        fileName: 'hedon_haven_export.json',
      );

      if (outputFile != null) {
        File file = File(outputFile);
        await file.writeAsString(jsonStr);
        if (mounted) showToast("Data exported successfully", context);
      }
    } catch (e) {
      if (mounted) showToast("Failed to export data: $e", context);
    }
  }

  Future<void> _importData() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null && result.files.single.path != null) {
        File file = File(result.files.single.path!);
        String jsonStr = await file.readAsString();
        Map<String, dynamic> importData = jsonDecode(jsonStr);

        if (mounted) showToast("Importing data...", context);

        if (importData.containsKey("watch_history")) {
          await importTableData("watch_history", importData["watch_history"]);
        }
        if (importData.containsKey("search_history")) {
          await importTableData("search_history", importData["search_history"]);
        }
        if (importData.containsKey("favorites")) {
          await importTableData("favorites", importData["favorites"]);
        }

        if (mounted) showToast("Data imported successfully!", context);
      }
    } catch (e) {
      if (mounted) showToast("Failed to import data: $e", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data & Storage")),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Export Data"),
              subtitle: const Text("Export history and favorites to a JSON file"),
              trailing: const Icon(Icons.upload_file),
              onTap: _exportData,
            ),
            ListTile(
              title: const Text("Import Data"),
              subtitle: const Text("Import history and favorites from a JSON file"),
              trailing: const Icon(Icons.download),
              onTap: _importData,
            ),
          ],
        ),
      ),
    );
  }
}
