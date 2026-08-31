sed -i '1s/^/import '"'"'package:showcaseview\/showcaseview.dart'"'"';\n/' lib/ui/screens/home.dart

sed -i 's/class _HomeScreenState extends State<HomeScreen> {/class _HomeScreenState extends State<HomeScreen> {\n  final GlobalKey _searchKey = GlobalKey();\n  final GlobalKey _menuKey = GlobalKey();/g' lib/ui/screens/home.dart

sed -i 's/return Scaffold(/return ShowCaseWidget(\n      builder: (context) => Scaffold(/g' lib/ui/screens/home.dart

sed -i 's/          Spacer(),/          Spacer(),\n          Showcase(\n            key: _searchKey,\n            description: "Tap here to search for videos",\n            child: /g' lib/ui/screens/home.dart

sed -i '/onPressed: () => Navigator.push(/i \            ),\n          ),' lib/ui/screens/home.dart
