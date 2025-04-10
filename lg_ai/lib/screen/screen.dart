import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String? inputValue;

  onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Form(
            child: Column(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '#BuildwithAI',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    inputValue = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the location';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Country, city, ....',
                    label: Text(
                      'Location',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                OutlinedButton(onPressed: () {}, child: Text('Search')),
                SizedBox(height: 20),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
