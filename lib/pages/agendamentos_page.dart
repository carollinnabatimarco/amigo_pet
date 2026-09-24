import 'package:flutter/material.dart';

import '../style/app_styles.dart';
import 'inicio_page.dart';
import 'cuidadores_page.dart';
import 'perfil_page.dart';

class AgendamentosPage extends StatelessWidget {
  const AgendamentosPage({super.key});

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
              selected: true,

              selectedTileColor:
              AppStyles.verdeClaro,

              leading: const Icon(
                Icons.calendar_month_outlined,
                color: AppStyles.verdeEscuro,
              ),

              title: const Text(
                'Meus agendamentos',

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
  // CARD DE AGENDAMENTO
  // ==========================================================

  Widget _agendamentoCard({
    required String cuidador,
    required String servico,
    required String data,
    required String horario,
    required String status,
    required bool ativo,
  }) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.only(
        bottom: 14,
      ),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(18),

        boxShadow:
        AppStyles.sombraCard,
      ),

      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,

                decoration: BoxDecoration(
                  color:
                  AppStyles.verdeClaro,

                  borderRadius:
                  BorderRadius.circular(15),
                ),

                child: Icon(
                  ativo
                      ? Icons.pets
                      : Icons.event_busy_outlined,

                  color: ativo
                      ? AppStyles.verdeEscuro
                      : Colors.red.shade500,

                  size: 25,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Text(
                      cuidador,

                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight:
                        FontWeight.bold,
                        color:
                        AppStyles.texto,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      servico,

                      style:
                      const TextStyle(
                        fontSize: 9,
                        color: AppStyles
                            .textoSecundario,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  color: ativo
                      ? AppStyles.verdeClaro
                      : Colors.red.shade50,

                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                ),

                child: Text(
                  status,

                  style: TextStyle(
                    fontSize: 8,
                    fontWeight:
                    FontWeight.bold,

                    color: ativo
                        ? AppStyles.verdeEscuro
                        : Colors.red.shade600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          const Divider(height: 1),

          const SizedBox(height: 13),

          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons
                          .calendar_today_outlined,
                      size: 16,
                      color:
                      AppStyles.verdeEscuro,
                    ),

                    const SizedBox(width: 7),

                    Text(
                      data,

                      style:
                      const TextStyle(
                        fontSize: 9,
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons
                          .access_time_outlined,
                      size: 16,
                      color:
                      AppStyles.verdeEscuro,
                    ),

                    const SizedBox(width: 7),

                    Text(
                      horario,

                      style:
                      const TextStyle(
                        fontSize: 9,
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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

        title: const Text(
          'Meus agendamentos',

          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ========================================================
      // CORPO
      // ========================================================

      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          20,
          20,
          0,
        ),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            const Text(
              'Meus agendamentos',

              style: AppStyles.titulo,
            ),

            const SizedBox(height: 5),

            const Text(
              'Acompanhe seus próximos cuidados.',
              style: AppStyles.subtitulo,
            ),

            const SizedBox(height: 20),

            // ==================================================
            // ABAS
            // ==================================================

            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(
                      vertical: 10,
                    ),

                    decoration: BoxDecoration(
                      color:
                      AppStyles.verdeEscuro,

                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: const Text(
                      'Próximos',

                      textAlign:
                      TextAlign.center,

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(
                      vertical: 10,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: const Text(
                      'Histórico',

                      textAlign:
                      TextAlign.center,

                      style: TextStyle(
                        color:
                        AppStyles
                            .textoSecundario,
                        fontSize: 10,
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // ==================================================
            // LISTA DE AGENDAMENTOS
            // ==================================================

            Expanded(
              child: ListView(
                children: [
                  _agendamentoCard(
                    cuidador: 'Ana Luiza',
                    servico: 'Passeio',
                    data: '20/09/2026',
                    horario: '14:00',
                    status: 'Confirmado',
                    ativo: true,
                  ),

                  _agendamentoCard(
                    cuidador: 'Mariana Silva',
                    servico: 'Hospedagem',
                    data: '25/09/2026',
                    horario: '09:00',
                    status: 'Confirmado',
                    ativo: true,
                  ),

                  _agendamentoCard(
                    cuidador: 'Beatriz Santos',
                    servico: 'Banho e tosa',
                    data: '02/10/2026',
                    horario: '15:30',
                    status: 'Confirmado',
                    ativo: true,
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