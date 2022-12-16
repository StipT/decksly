import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardGalleryScreen extends StatefulWidget {
  const CardGalleryScreen({super.key});

  @override
  State<CardGalleryScreen> createState() => _CardGalleryScreenState();
}

class _CardGalleryScreenState extends State<CardGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CardGalleryBloc, CardGalleryState>(
      listener: (ctx, state) => {},
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
