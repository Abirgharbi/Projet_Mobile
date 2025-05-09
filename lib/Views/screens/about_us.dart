import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/app_bar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  late GoogleMapController mapController;

  final LatLng _KOALocation = const LatLng(36.8090, 10.0975);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'About Us'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bienvenue chez AKO Home',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'AKO Home est votre destination idéale pour l’achat de meubles de qualité. '
                'Nous vous proposons une large gamme de meubles modernes, élégants et fonctionnels pour tous les styles et tous les espaces.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Nos services :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              const Text(
                '- Mobilier pour salon, chambre, salle à manger et bureau',
              ),
              const Text('- Produits tendance et designs uniques'),
              const Text('- Navigation simple et expérience d’achat fluide'),
              const Text('- Livraison rapide et service client à l’écoute'),
              const SizedBox(height: 16.0),
              const Text(
                'Notre mission est de vous aider à meubler votre intérieur avec style et confort. '
                'Merci de faire confiance à AKO Home !',
              ),

              const SizedBox(height: 20.0),

              // --- Google Map Section ---
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _KOALocation,
                    zoom: 16.0,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('KAO_marker'),
                      position: _KOALocation,
                      infoWindow: const InfoWindow(title: 'KAO HQ'),
                    ),
                  },
                  zoomControlsEnabled: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
