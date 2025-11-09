import 'package:flutter/material.dart';
import '../services/cat_service.dart';
import '../data_models/cat_fact_model.dart';

class CatWidget extends StatelessWidget {
  final CatService _service = CatService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CatFact>(
      future: _service.fetchCatFact(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                data.fact,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return const Center(child: Text('No cat fact available'));
        }
      },
    );
  }
}
