with open('test/ui_test.dart', 'r') as f:
    content = f.read()

content = content.replace("import 'package:hedon_haven/main.dart'; // Adjust if package name is different", "")

with open('test/ui_test.dart', 'w') as f:
    f.write(content)
