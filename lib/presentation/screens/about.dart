import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meatz/application/application.dart';

import '../../data/models/info.dart';
import '../../domain/entities/info.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    context.read<AboutBloc>().add(GetAboutEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutBloc, AboutState>(builder: (context, state) {
      if (state is AboutLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is AboutError) {
        const Scaffold(
          body: Center(
            child: Text("Error"),
          ),
        );
      } else if (state is AboutLoaded) {
        return AboutSuccessScreen(
          about: state.about,
        );
      }
      return const SizedBox.shrink();
    });
  }
}

class AboutSuccessScreen extends StatelessWidget {
  const AboutSuccessScreen({super.key, required this.about});

  final Info about;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
