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
    const mainColor = Color(0xFFFF7742);

    return Scaffold(
      appBar: const CustomAppBar(title: 'About Us'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenue chez KOA Home',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'KOA Home est votre destination idéale pour l’achat de meubles de qualité. '
                'Nous vous proposons une large gamme de meubles modernes, élégants et fonctionnels pour tous les styles et tous les espaces.',
                style: const TextStyle(fontSize: 17, height: 1.6),
              ),
              const SizedBox(height: 24),
              Text(
                'Nos services :',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              const SizedBox(height: 12),
              ...[
                '- Mobilier pour salon, chambre, salle à manger et bureau',
                '- Produits tendance et designs uniques',
                '- Navigation simple et expérience d’achat fluide',
                '- Livraison rapide et service client à l’écoute',
              ].map(
                (service) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    service,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Notre mission est de vous aider à meubler votre intérieur avec style et confort. '
                'Merci de faire confiance à KOA Home !',
                style: const TextStyle(fontSize: 17, height: 1.6),
              ),
              const SizedBox(height: 32),

              // Carte Google Map avec ombre et coins arrondis
              Container(
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _KOALocation,
                      zoom: 16,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('KAO_marker'),
                        position: _KOALocation,
                        infoWindow: const InfoWindow(title: 'KOA HQ'),
                      ),
                    },
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
