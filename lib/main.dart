import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.push("/page_1");
              },
              child: const Text(
                "Use context.push",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.go("/page_1");
              },
              child: const Text(
                "Use context.go",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.go("/page_4");
              },
              child: const Text(
                "Use subroutes",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.go("/activity");
              },
              child: const Text(
                "Redirect",
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Icon(Icons.arrow_forward_ios),
          onPressed: () => context.push("/page_2/2/9"),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final int id1;
  final int id2;

  const Page2({
    super.key,
    required this.id1,
    required this.id2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2 : Id = $id1 ---------- $id2"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Icon(Icons.arrow_forward_ios),
          onPressed: () => context.push("/page_3?platform=Android"),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final String platform;

  const Page3({
    super.key,
    required this.platform,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3  Platform: $platform"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 4"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Icon(Icons.arrow_forward_ios),
          onPressed: () => context.go("/page_4/page_6"),
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 5"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ErrorPage"),
      ),
      body: const Text("404 Not Found"),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: const Text("User Page"),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Page"),
      ),
      body: const Text("Dashboard Page"),
    );
  }
}
