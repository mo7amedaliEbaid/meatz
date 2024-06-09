import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meatz/domain/use_case/about.dart';

import '../../../domain/entities/about.dart';

abstract class AboutEvent {}

class GetAboutEvent extends AboutEvent {}

abstract class AboutState {}

class AboutInitial extends AboutState {}

class AboutLoading extends AboutState {}

class AboutLoaded extends AboutState {
  final About about;

  AboutLoaded({
    required this.about,
  });
}

class AboutError extends AboutState {
  final String message;

  AboutError({
    required this.message,
  });
}

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final GetAbout getAbout;

  AboutBloc({
    required this.getAbout,
  }) : super(AboutInitial()) {
    on<GetAboutEvent>(_onGetAbout);
  }

  Future<void> _onGetAbout(
      GetAboutEvent event, Emitter<AboutState> emit) async {
    emit(AboutLoading());
    try {
      final about = await getAbout();
      emit(
        AboutLoaded(about: about),
      );
    } catch (e) {
      emit(
        AboutError(
          message: e.toString(),
        ),
      );
    }
  }
}
