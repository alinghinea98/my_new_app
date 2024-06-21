import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // add http to dependency
import 'dart:convert';


class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  List<dynamic> _users = [];
  List<dynamic> _filteredUsers = [];

  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    const callUrl = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(callUrl));
    if (response.statusCode == 200) {
      setState(() {
        _users = json.decode(response.body);
        _filteredUsers = List.from(_users);
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  void _filterUsers(String name) {
    setState(() {
      _filteredUsers = _users.where((user) => user['name']
                      .toString()
                      .toLowerCase()
                      .contains(name.toLowerCase()))
                      .toList();
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users list'),
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: _filterUsers,
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder()
            ),
          ),
          ),
          Expanded(child: _filteredUsers.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                          itemCount: _filteredUsers.length,
                          itemBuilder: (context, index) {
                            final user = _filteredUsers[index];
                            return ListTile(
                              title: Text(user['name']),
                              subtitle: Text(user['email']),
                            );
                          },
                        ))
        ],
      )
    );
  }
}

class Person {
  late String name;
  late String email;

  Person(this.name, this.email);

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  void usersEmail() {
    debugPrint('The email for the user $name is $email');
  }

}