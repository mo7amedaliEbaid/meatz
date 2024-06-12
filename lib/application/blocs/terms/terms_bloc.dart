import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meatz/domain/use_case/terms.dart';

import '../../../domain/entities/info.dart';

abstract class TermsEvent {}

class GetTermsEvent extends TermsEvent {}

abstract class TermsState {}

class TermsInitialState extends TermsState {}

class TermsErrorState extends TermsState {
  final String message;

  TermsErrorState({
    required this.message,
  });
}

class TermsLoadedState extends TermsState {
  final Info terms;

  TermsLoadedState({
    required this.terms,
  });
}

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  final GetTerms getTerms;

  TermsBloc({
    required this.getTerms,
  }) : super(
          TermsInitialState(),
        );
}
