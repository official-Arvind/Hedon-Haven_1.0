import re

with open('lib/ui/screens/home.dart', 'r') as f:
    content = f.read()

# find IconButton with missing closing parenthesis
# It currently has:
#          IconButton(
#            icon: Icon(
#                color: Theme.of(context).colorScheme.primary, Icons.search),
#          ),
#            onPressed: () => Navigator.push(

search_str = """          IconButton(
            icon: Icon(
                color: Theme.of(context).colorScheme.primary, Icons.search),
          ),
            onPressed: () => Navigator.push("""
replace_str = """          Tooltip(
            message: "Search for videos",
            child: IconButton(
              icon: Icon(
                  color: Theme.of(context).colorScheme.primary, Icons.search),
              onPressed: () => Navigator.push("""
content = content.replace(search_str, replace_str)

search_str2 = """                        child: FadeTransition(                            opacity: curved, child: child));                  },                ),              ),            ),          ),"""
replace_str2 = """                        child: FadeTransition(                            opacity: curved, child: child));                  },                ),              ),            ),"""
content = content.replace(search_str2, replace_str2)

with open('lib/ui/screens/home.dart', 'w') as f:
    f.write(content)
