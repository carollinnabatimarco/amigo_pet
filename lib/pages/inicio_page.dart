import 'package:flutter/material.dart';

import '../style/app_styles.dart';
import 'cuidadores_page.dart';
import 'agendamentos_page.dart';
import 'perfil_page.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

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
              selected: true,

              selectedTileColor:
              AppStyles.verdeClaro,

              leading: const Icon(
                Icons.home_outlined,
                color: AppStyles.verdeEscuro,
              ),

              title: const Text(
                'Início',

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
              leading: const Icon(
                Icons.person_outline,
                color: AppStyles.verdeEscuro,
              ),

              title: const Text(
                'Perfil',

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
                    const PerfilPage(),
                  ),
                );
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
  // SERVIÇO
  // ==========================================================

  Widget _servico(
      IconData icone,
      String titulo,
      String descricao,
      ) {
    return Container(
      width: 145,

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(18),

        boxShadow:
        AppStyles.sombraCard,
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          Container(
            width: 42,
            height: 42,

            decoration: BoxDecoration(
              color: AppStyles.verdeClaro,

              borderRadius:
              BorderRadius.circular(12),
            ),

            child: Icon(
              icone,
              color: AppStyles.verdeEscuro,
              size: 22,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            titulo,

            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppStyles.texto,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            descricao,

            style: const TextStyle(
              fontSize: 8,
              color: AppStyles.textoSecundario,
              height: 1.3,
            ),
          ),
        ],
      ),
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
              'AmigoPet',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
            ),

            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    'Você não possui novas notificações.',
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // ========================================================
      // CORPO
      // ========================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          22,
          20,
          25,
        ),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            // ==================================================
            // SAUDAÇÃO
            // ==================================================

            const Text(
              'Olá, Carolina! 🐾',

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppStyles.texto,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Como podemos cuidar do seu pet hoje?',

              style: AppStyles.subtitulo,
            ),

            const SizedBox(height: 22),

            // ==================================================
            // BANNER
            // ==================================================

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: AppStyles.verdeEscuro,

                borderRadius:
                BorderRadius.circular(22),
              ),

              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [
                        const Text(
                          'Encontre quem cuida\ncom carinho.',

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight:
                            FontWeight.bold,
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 9),

                        const Text(
                          'Cuidadores de confiança perto de você.',

                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 9,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 15),

                        SizedBox(
                          height: 38,

                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (context) =>
                                  const CuidadoresPage(),
                                ),
                              );
                            },

                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              Colors.white,

                              foregroundColor:
                              AppStyles
                                  .verdeEscuro,

                              elevation: 0,

                              padding:
                              const EdgeInsets
                                  .symmetric(
                                horizontal: 16,
                              ),

                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                  20,
                                ),
                              ),
                            ),

                            child: const Text(
                              'Encontrar cuidador',

                              style: TextStyle(
                                fontSize: 9,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    width: 90,
                    height: 110,

                    decoration: BoxDecoration(
                      color: Colors.white24,

                      borderRadius:
                      BorderRadius.circular(20),
                    ),

                    child: const Icon(
                      Icons.pets,
                      color: Colors.white,
                      size: 55,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // SERVIÇOS
            // ==================================================

            const Text(
              'O que seu pet precisa?',

              style: AppStyles.titulo,
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 150,

              child: ListView(
                scrollDirection:
                Axis.horizontal,

                children: [
                  _servico(
                    Icons.directions_walk,
                    'Passeio',
                    'Passeios seguros e divertidos.',
                  ),

                  const SizedBox(width: 12),

                  _servico(
                    Icons.home_outlined,
                    'Hospedagem',
                    'Cuidados enquanto você viaja.',
                  ),

                  const SizedBox(width: 12),

                  _servico(
                    Icons.content_cut,
                    'Banho e tosa',
                    'Higiene e cuidado para seu pet.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // AGENDAMENTO
            // ==================================================

            const Text(
              'Próximo agendamento',

              style: AppStyles.titulo,
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(18),

                boxShadow:
                AppStyles.sombraCard,
              ),

              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,

                    decoration: BoxDecoration(
                      color:
                      AppStyles.verdeClaro,

                      borderRadius:
                      BorderRadius.circular(15),
                    ),

                    child: const Icon(
                      Icons.calendar_today_outlined,
                      color:
                      AppStyles.verdeEscuro,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Passeio com Ana Luiza',

                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          '20/09/2026 • 14:00',

                          style: TextStyle(
                            fontSize: 9,
                            color: AppStyles
                                .textoSecundario,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) =>
                          const AgendamentosPage(),
                        ),
                      );
                    },

                    icon: const Icon(
                      Icons.chevron_right,
                      color:
                      AppStyles.verdeEscuro,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // PERFIL
            // ==================================================

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(18),
              ),

              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,

                    decoration: const BoxDecoration(
                      color: AppStyles.verdeClaro,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.person_outline,
                      color:
                      AppStyles.verdeEscuro,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Meu perfil',

                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          'Gerencie seus dados e preferências.',

                          style: TextStyle(
                            fontSize: 8,
                            color: AppStyles
                                .textoSecundario,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) =>
                          const PerfilPage(),
                        ),
                      );
                    },

                    icon: const Icon(
                      Icons.chevron_right,
                      color:
                      AppStyles.verdeEscuro,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}