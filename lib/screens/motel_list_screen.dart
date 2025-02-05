import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/motel_provider.dart';
import '../widgets/motel_list_item.dart';

class MotelListScreen extends StatefulWidget {
  const MotelListScreen({super.key});

  @override
  State<MotelListScreen> createState() => _MotelListScreenState();
}

class _MotelListScreenState extends State<MotelListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<MotelProvider>().fetchMotels();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ir Agora'),
        backgroundColor: Colors.red.shade700,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.map),
      ),
      body: Consumer<MotelProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          return ListView.builder(
            itemCount: provider.motels.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == provider.motels.length - 1
                    ? const EdgeInsets.only(bottom: 100)
                    : EdgeInsets.zero,
                child: MotelListItem(
                  motel: provider.motels[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
