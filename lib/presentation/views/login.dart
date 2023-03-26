import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../config/router/app_router.dart';
import '../cubits/remote/remote_login_cubit.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remoteLoginCubit = BlocProvider.of<RemoteLoginCubit>(context);

    return BlocBuilder<RemoteLoginCubit, RemoteLoginState>(builder: (_, state) {
      switch (state.runtimeType) {
        case RemoteLoginFailed:
          return const Center(child: Icon(Icons.refresh));
        case RemoteLoginSuccess:
          appRouter.navigate(const WineListRoute());
          return const SizedBox();
        default:
          return _buildLogin(remoteLoginCubit, state.email, state.password);
      }
    });
  }
}

Widget _buildLogin(
    RemoteLoginCubit remoteLoginCubit, String email, String password) {
  return Scaffold(
    appBar: AppBar(),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: SizedBox(
                width: 300,
                height: 150,
                child:
                    Center(child: Image.asset('assets/images/regent-logo.png')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter valid email id as abc@gmail.com',
              ),
              onChanged: (String text) {
                remoteLoginCubit.updateEmail(text);
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter a password',
                ),
                onChanged: (String text) {
                  remoteLoginCubit.updatePassword(text);
                },
              )),
          TextButton(
            onPressed: () {
              //TODO FORGOT PASSWORD SCREEN GOES HERE
            },
            child: const Text(
              'Forgot Password',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.grey)))),
              onPressed: () {
                remoteLoginCubit.login();
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          const Text('New User? Create Account')
        ],
      ),
    ),
  );
}
