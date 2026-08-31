sed -i 's/deleteAllFrom("watch_history");/List<Map<String, Object?>> backup = await getAllFrom("watch_history");\n                          await deleteAllFrom("watch_history");\n                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Watch history cleared"), action: SnackBarAction(label: "UNDO", onPressed: () => importTableData("watch_history", backup))));/g' lib/ui/screens/settings/settings_history.dart

sed -i 's/showToast("Watch history cleared", context);/\/\/ showToast("Watch history cleared", context);/g' lib/ui/screens/settings/settings_history.dart

sed -i 's/deleteAllFrom("search_history");/List<Map<String, Object?>> backup = await getAllFrom("search_history");\n                          await deleteAllFrom("search_history");\n                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Search history cleared"), action: SnackBarAction(label: "UNDO", onPressed: () => importTableData("search_history", backup))));/g' lib/ui/screens/settings/settings_history.dart

sed -i 's/showToast("Search history cleared", context);/\/\/ showToast("Search history cleared", context);/g' lib/ui/screens/settings/settings_history.dart

sed -i 's/deleteAllFrom("favorites");/List<Map<String, Object?>> backup = await getAllFrom("favorites");\n                          await deleteAllFrom("favorites");\n                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All favorites deleted"), action: SnackBarAction(label: "UNDO", onPressed: () => importTableData("favorites", backup))));/g' lib/ui/screens/settings/settings_history.dart

sed -i 's/showToast("All favorites deleted", context);/\/\/ showToast("All favorites deleted", context);/g' lib/ui/screens/settings/settings_history.dart
