import 'package:app_post_it/controllers/tokenController.dart';
import 'package:app_post_it/controllers/userController.dart';
import 'package:app_post_it/models/userModel.dart';
import 'package:app_post_it/views/perfil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_post_it/controllers/postItController.dart';

class HomePage extends StatefulWidget {
  UserModel user;
  HomePage({required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final postItController = PostItController();
  final tokenController = TokenController();

  @override
  Widget build(BuildContext context) {
    void _addForm(BuildContext context) {
      TextEditingController titleController = TextEditingController();
      TextEditingController descriptionController = TextEditingController();

      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.deepPurple[50],
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await postItController.addPostIt(
                        titleController.text,
                        descriptionController.text,
                        tokenController.token!,
                        widget.user.id);
                    Navigator.pop(context);
                  },
                  child: Text('adicionar'),
                ),
              ],
            ),
          );
        },
      );
    }

    void _updateForm(BuildContext context, int postId) {
      TextEditingController titleController = TextEditingController();
      TextEditingController descriptionController = TextEditingController();

      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.deepPurple[50],
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await postItController.updatePostIt(
                        tokenController.token!,
                        titleController.text,
                        descriptionController.text,
                        widget.user.id,
                        postId);
                    Navigator.pop(context);
                  },
                  child: Text('editar'),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await tokenController.loadToken();
              await postItController.getPosts(
                  widget.user.id, tokenController.token!);
            },
            icon: Icon(Icons.autorenew),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return PerfilPage(
                      user: widget.user, posts: postItController.posts);
                }));
              },
              icon: Icon(Icons.person_2_outlined))
        ],
        title: Image.asset(
          "assets/logo.png",
          width: 55,
        ),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    controller: TextEditingController(),
                    cursorColor: Colors.pinkAccent,
                    padding: const EdgeInsets.all(15),
                    placeholder: "buscar usuarios",
                    placeholderStyle:
                        const TextStyle(color: Colors.white70, fontSize: 14),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Expanded(
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    itemCount: postItController.posts.length,
                    itemBuilder: (context, index) {
                      final post = postItController.posts[index];
                      return GestureDetector(
                        onTap: () {
                          print(index);
                          _updateForm(context, post.id);
                        },
                        onLongPress: () {
                          postItController.deletePostIt(
                              tokenController.token!,
                              post.title,
                              post.description,
                              post.author,
                              post.id);
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          margin: EdgeInsets.all(10),
                          width: 10,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[50],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${postItController.posts[index].title}",
                                    style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${postItController.posts[index].description}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        _updateForm(context, post.id);
                                      },
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        postItController.deletePostIt(
                                            tokenController.token!,
                                            post.title,
                                            post.description,
                                            post.author,
                                            post.id);
                                      },
                                      icon: Icon(Icons.delete)),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          _addForm(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
