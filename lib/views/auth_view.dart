import 'package:flutter/material.dart';
import 'package:lxp_flutter_dart/view_models/auth_view_model.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key, required this.viewModel});

  final AuthViewModel viewModel;

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Authentication'),
          ),
          body: widget.viewModel.loggedIn
              ? LogoutForm(widget: widget)
              : LoginForm(widget: widget),
        );
      },
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.widget,
  });

  final AuthView widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Spacer(),
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => widget.viewModel.emailOnChange(value),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
              onChanged: (value) => widget.viewModel.passwordOnChange(value),
            ),
            TextButton(
              onPressed: () {
                widget.viewModel.login();
              },
              child: Text(
                'Signed In / Create Account',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Spacer(),
            Text(widget.viewModel.status),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class LogoutForm extends StatelessWidget {
  const LogoutForm({
    super.key,
    required this.widget,
  });

  final AuthView widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Spacer(),
          Text(
            'UID: ${widget.viewModel.user?.uid ?? ''}',
            textAlign: TextAlign.center,
          ),
          Text('Email: ${widget.viewModel.user?.email ?? ''}',
              textAlign: TextAlign.center),
          Text('Metadata: ${widget.viewModel.user?.metadata ?? ''}',
              textAlign: TextAlign.center),
          TextButton(
            onPressed: () {
              widget.viewModel.logout();
            },
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
