import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xiaomi Volume Control',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const VolumeControlPage(),
    );
  }
}

class VolumeControlPage extends StatefulWidget {
  const VolumeControlPage({super.key});

  @override
  State<VolumeControlPage> createState() => _VolumeControlPageState();
}

class _VolumeControlPageState extends State<VolumeControlPage> {
  double _volumeValue = 0.5;
  final VolumeController _volumeController = VolumeController();

  @override
  void initState() {
    super.initState();
    _initVolume();
  }

  Future<void> _initVolume() async {
    // Get current volume
    final volume = await _volumeController.getVolume();
    setState(() {
      _volumeValue = volume;
    });

    // Listen to volume changes
    _volumeController.listener((volume) {
      setState(() {
        _volumeValue = volume;
      });
    });
  }

  Future<void> _setVolume(double value) async {
    await _volumeController.setVolume(value);
    setState(() {
      _volumeValue = value;
    });
  }

  @override
  void dispose() {
    _volumeController.removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Xiaomi Volume Control'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _volumeValue > 0.5
                    ? Icons.volume_up
                    : _volumeValue > 0
                        ? Icons.volume_down
                        : Icons.volume_off,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 40),
              Text(
                '${(_volumeValue * 100).round()}%',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Icon(Icons.volume_mute,
                      color: Theme.of(context).colorScheme.secondary),
                  Expanded(
                    child: Slider(
                      value: _volumeValue,
                      min: 0.0,
                      max: 1.0,
                      divisions: 100,
                      label: '${(_volumeValue * 100).round()}%',
                      onChanged: (value) {
                        _setVolume(value);
                      },
                    ),
                  ),
                  Icon(Icons.volume_up,
                      color: Theme.of(context).colorScheme.secondary),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _setVolume(0.0),
                    icon: const Icon(Icons.volume_off),
                    label: const Text('Tắt tiếng'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _setVolume(0.5),
                    icon: const Icon(Icons.volume_down),
                    label: const Text('Trung bình'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _setVolume(1.0),
                    icon: const Icon(Icons.volume_up),
                    label: const Text('Tối đa'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
