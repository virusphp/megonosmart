import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/core/assets/assets.gen.dart';
import 'package:megonopos/core/components/buttons.dart';
import 'package:megonopos/core/components/custom_text_field.dart';
import 'package:megonopos/core/components/spaces.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/presentation/auth/bloc/login/login_bloc.dart';
import 'package:megonopos/presentation/home/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(80.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130.0),
              child: Image.asset(
                Assets.images.loginUiCaffe.path,
                width: 100,
                height: 100,
              )),
          const SpaceHeight(24.0),
          const Center(
            child: Text(
              "Megono POS",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const SpaceHeight(8.0),
          const Center(
            child: Text(
              "Masuk untuk kasir",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
          const SpaceHeight(40.0),
          CustomTextField(
            textInputAction: TextInputAction.next,
            controller: emailController,
            label: 'Email',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            textInputAction: TextInputAction.done,
            controller: passwordController,
            label: 'Password',
            obscureText: isObscure,
            suffixIcon: true,
            onPressed: () => {
              setState(() {
                isObscure = !isObscure;
              })
            },
          ),
          const SpaceHeight(24.0),
          BlocListener<LoginBloc, LoginState>(listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (authResponseModel) {
                AuthLocalDatasource().saveAuthData(authResponseModel);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardPage(),
                  ),
                );
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          }, child:
              BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            return state.maybeWhen(orElse: () {
              return Button.filled(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        LoginEvent.login(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                },
                label: 'Masuk',
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
          }))
        ],
      ),
    );
  }
}
