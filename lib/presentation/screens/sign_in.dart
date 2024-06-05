import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/blocs/signin_form/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInFormBloc, SignInFormState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    failure.map(
                      serverError: 'Server error',
                      emailAlreadyInUse: 'Email already in use',
                      invalidEmailAndPasswordCombination:
                          'Invalid email and password combination',
                    ),
                  ),
                ));
              },
              (_) {
                // Navigate to another page
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  autocorrect: false,
                  onChanged: (value) =>
                      context.read<SignInFormBloc>().add(EmailChanged(value)),
                  validator: (_) => context
                      .read<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (f) => f.map(
                          invalidEmail: 'Invalid Email',
                          shortPassword: 'Short Password',
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => context
                      .read<SignInFormBloc>()
                      .add(PasswordChanged(value)),
                  validator: (_) =>
                      context.read<SignInFormBloc>().state.password.value.fold(
                            (f) => f.map(
                              shortPassword: 'Short Password',
                              invalidEmail: 'Invalid Email',
                            ),
                            (_) => null,
                          ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              RegisterWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('REGISTER'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              SignInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    context.read<SignInFormBloc>().add(
                          SignInWithGooglePressed(),
                        );
                  },
                  child: const Text(
                    'SIGN IN WITH GOOGLE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BlocBuilder<SignInFormBloc, SignInFormState>(
                    builder: (context, state) {
                  if (state.isSubmitting) {
                    return const Column(
                      children: [
                        SizedBox(height: 8),
                        LinearProgressIndicator(),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
