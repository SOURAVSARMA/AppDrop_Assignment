import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/widget_factory.dart';
import 'data/json.dart';
import 'models/page_model.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnimeDrop',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
        textTheme: GoogleFonts.poppinsTextTheme(),

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const DynamicPageScreen(),
    );
  }
}

class DynamicPageScreen extends StatefulWidget {
  const DynamicPageScreen({super.key});

  @override
  State<DynamicPageScreen> createState() => _DynamicPageScreenState();
}

class _DynamicPageScreenState extends State<DynamicPageScreen> {
  late Future<PageModel> _pageLoader;

  @override
  void initState() {
    super.initState();
    _pageLoader = _loadPageData();
  }

  Future<PageModel> _loadPageData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonData);
      return PageModel.fromJson(jsonMap);
    } catch (e) {
      throw Exception('Failed to parse JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimeDrop"),
        centerTitle: true,
      ),
      body: FutureBuilder<PageModel>(
        future: _pageLoader,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data found"));
          }

          final components = snapshot.data!.components;

          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 30),
            itemCount: components.length,
            itemBuilder: (context, index) {
              return WidgetFactory.buildComponent(components[index]);
            },
          );
        },
      ),
    );
  }
}