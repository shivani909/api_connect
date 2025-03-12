import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    List<User> users = [];
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Rest Api call'),
        
      ),
      
      body: 
      
      ListView.builder(
        
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile( 
            onTap: () {
              
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(user.imageUrl),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Text(user.phone),
            
          );
      
        },
       
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: Icon(Icons.refresh),
        
      ),
     
    );
  }
  void fetchUsers() async {
    print('fetching users...');
    const url = 'https://randomuser.me/api/?results=200';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;

    final json = jsonDecode(body);
    final results = json['results'];
     setState(() {
      users = results.map<User>((json) => User.fromJson(json)).toList();
     });

 
  }  
}