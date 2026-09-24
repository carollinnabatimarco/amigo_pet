import 'package:flutter/material.dart';

import '../style/app_styles.dart';
import 'inicio_page.dart';
import 'cuidadores_page.dart';
import 'agendamentos_page.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  // ==========================================================
  // DRAWER
  // ==========================================================

  Widget _drawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,

      child: SafeArea(
        child: Column(
          children: [
            // ==================================================
            // CABEÇALHO
            // ==================================================

            Container(
              width: double.infinity,

              padding: const EdgeInsets.fromLTRB(
                22,
                25,
                22,
                25,
              ),

              decoration: const BoxDecoration(
                color: AppStyles.verdeEscuro,

                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Container(
                    width: 65,
                    height: 65,

                    padding: const EdgeInsets.all(7),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(18),
                    ),

                    child: Image.asset(
                      'assets/logo_pet.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'AmigoPet',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Cuidados que aproximam',

                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // ==================================================
            // INÍCIO
            // ==================================================

            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: AppStyles.verdeEscuro,
              ),

              title: const Text(
                'Início',

                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              onTap: () {
                Navigator.pop(context);

                Navigator.pushAndRemoveUntil(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                    const InicioPage(),
                  ),

                      (route) => false,
                );
              },
            ),

            // ==================================================
            // CUIDADORES
            // ==================================================

            ListTile(
              leading: const Icon(
                Icons.pets_outlined,
                color: AppStyles.verdeEscuro,
              ),

              title: const Text(
                'Cuidadores',

                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                    const CuidadoresPage(),
                  ),
                );
              },
            ),

            // ==================================================
            // AGENDAMENTOS
            // ==================================================

            ListTile(
              leading: const Icon(
                Icons.calendar_month_outlined,
                color: AppStyles.verdeEscuro,
              ),

              title: const Text(
                'Meus agendamentos',

                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                    const AgendamentosPage(),
                  ),
                );
              },
            ),

            // ==================================================
            // PERFIL
            // ==================================================

            ListTile(
              selected: true,

              selectedTileColor:
              AppStyles.verdeClaro,

              leading: const Icon(
                Icons.person_outline,
                color: AppStyles.verdeEscuro,
              ),

              title: const Text(
                'Perfil',

                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppStyles.verdeEscuro,
                ),
              ),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Divider(
              indent: 20,
              endIndent: 20,
            ),

            // ==================================================
            // CONFIGURAÇÕES
            // ==================================================

            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                color: AppStyles.verdeEscuro,
              ),

              title: const Text(
                'Configurações',

                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Configurações em breve.',
                    ),
                  ),
                );
              },
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),

              child: Text(
                'AmigoPet • 2026',

                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // CAMPO DO PERFIL
  // ==========================================================

  Widget _campoPerfil(
      IconData icone,
      String titulo,
      String valor,
      ) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.only(
        bottom: 10,
      ),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(15),
      ),

      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,

            decoration: BoxDecoration(
              color: AppStyles.verdeClaro,

              borderRadius:
              BorderRadius.circular(11),
            ),

            child: Icon(
              icone,
              size: 19,
              color: AppStyles.verdeEscuro,
            ),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [
              Text(
                titulo,

                style: const TextStyle(
                  fontSize: 8,
                  color:
                  AppStyles.textoSecundario,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                valor,

                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppStyles.texto,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // OPÇÃO DO PERFIL
  // ==========================================================

  Widget _opcaoPerfil(
      IconData icone,
      String titulo,
      ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: Icon(
        icone,
        color: AppStyles.verdeEscuro,
      ),

      title: Text(
        titulo,

        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),

      trailing: const Icon(
        Icons.chevron_right,
        size: 20,
        color: AppStyles.textoSecundario,
      ),

      onTap: () {},
    );
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.creme,

      drawer: _drawer(context),

      // ========================================================
      // APPBAR
      // ========================================================

      appBar: AppBar(
        backgroundColor:
        AppStyles.verdeEscuro,

        foregroundColor: Colors.white,

        elevation: 0,

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
              ),

              onPressed: () {
                Scaffold.of(context)
                    .openDrawer();
              },
            );
          },
        ),

        titleSpacing: 0,

        title: Row(
          children: [
            Container(
              width: 35,
              height: 35,

              padding: const EdgeInsets.all(4),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(10),
              ),

              child: Image.asset(
                'assets/logo_pet.png',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: 9),

            const Text(
              'Meu perfil',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      // ========================================================
      // CORPO
      // ========================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            // ==================================================
            // FOTO E NOME
            // ==================================================

            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,

                    decoration: const BoxDecoration(
                      color: AppStyles.verdeClaro,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.person,
                      size: 55,
                      color: AppStyles.verdeEscuro,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Carolina',

                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: AppStyles.texto,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Tutora de pets',

                    style: TextStyle(
                      fontSize: 10,
                      color:
                      AppStyles.textoSecundario,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // DADOS PESSOAIS
            // ==================================================

            const Text(
              'Dados pessoais',
              style: AppStyles.titulo,
            ),

            const SizedBox(height: 12),

            _campoPerfil(
              Icons.person_outline,
              'Nome',
              'Carolina',
            ),

            _campoPerfil(
              Icons.email_outlined,
              'E-mail',
              'carolina@email.com',
            ),

            _campoPerfil(
              Icons.phone_outlined,
              'Telefone',
              '(11) 99999-9999',
            ),

            const SizedBox(height: 20),

            // ==================================================
            // LOCALIZAÇÃO
            // ==================================================

            const Text(
              'Localização',
              style: AppStyles.titulo,
            ),

            const SizedBox(height: 12),

            _campoPerfil(
              Icons.location_on_outlined,
              'Localização',
              'São Paulo - SP',
            ),

            const SizedBox(height: 20),

            // ==================================================
            // EDITAR PERFIL
            // ==================================================

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Edição de perfil em breve.',
                      ),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.edit_outlined,
                  size: 18,
                ),

                label: const Text(
                  'Editar perfil',
                ),

                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  AppStyles.verdeEscuro,

                  foregroundColor:
                  Colors.white,

                  elevation: 0,

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(25),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // ==================================================
            // PREFERÊNCIAS
            // ==================================================

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(18),
              ),

              child: Column(
                children: [
                  _opcaoPerfil(
                    Icons.notifications_none,
                    'Notificações',
                  ),

                  const Divider(),

                  _opcaoPerfil(
                    Icons.lock_outline,
                    'Privacidade e segurança',
                  ),

                  const Divider(),

                  _opcaoPerfil(
                    Icons.help_outline,
                    'Ajuda e suporte',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}