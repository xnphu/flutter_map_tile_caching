import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/components/loading_indicator.dart';
import '../../../../../shared/state/general_provider.dart';

class MapView extends StatefulWidget {
  const MapView({
    Key? key,
  }) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) => Consumer<GeneralProvider>(
        builder: (context, provider, _) => FutureBuilder<Map<String, String>?>(
          future: provider.currentStore == null
              ? Future.sync(() => {})
              : FMTC.instance(provider.currentStore!).metadata.readAsync,
          builder: (context, metadata) {
            if (!metadata.hasData ||
                metadata.data == null ||
                (provider.currentStore != null && metadata.data!.isEmpty)) {
              return const LoadingIndicator(
                message:
                    'Loading Settings...\n\nSeeing this screen for a long time?\nThere may be a misconfiguration of the\nstore. Try disabling caching and deleting\n faulty stores.',
              );
            }
            return FlutterMap(
              options: MapOptions(
                center: LatLng(51.509364, -0.128928),
                zoom: 9.2,
                interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      provider.currentStore != null && metadata.data != null
                          ? metadata.data!['sourceURL']!
                          : 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  maxZoom: 20,
                  reset: provider.resetController.stream,
                  keepBuffer: 5,
                  backgroundColor: const Color(0xFFaad3df),
                ),
              ],
            );
          },
        ),
      );
}