import 'package:app_post_it/models/postItModel.dart';
import 'package:app_post_it/models/userModel.dart';
import 'package:app_post_it/views/login.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  UserModel user;
  List<PostItModel> posts;
  PerfilPage({required this.user, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              icon: Icon(Icons.person_off_outlined)),
        ],
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
              "@${user.username}",
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.all(10),
                      width: 10,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[50],
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${posts[index].title}",
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${posts[index].description}",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
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
