// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Perfil'),
      ),
      body: const UserProfile(),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG3GwHJA0oGyd-vCDVnSzQBMnp45HTAG0wZw&usqp=CAU',
            ), // Substitua pelo caminho da imagem do usuário
          ),
          SizedBox(height: 10),
          Text(
            'Octávio Martins',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 0),
          Text(
            'octavio@gmail.com',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          _buildUserDataField('Idade', '25 anos'),
          _buildUserDataField('Peso', '70 kg'),
          _buildUserDataField('Altura', '1.76 m'),
          _buildUserDataField('Alérgia', 'Amendoim, Camarão'),
        ],
      ),
    );
  }

  Widget _buildUserDataField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
