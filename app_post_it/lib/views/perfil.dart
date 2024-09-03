import 'package:app_post_it/repositories/apiRepository.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_rounded)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.blue,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/perfil.png",
              width: 200,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "@teste",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'User $index',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(Icons.person, color: Colors.white),
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
