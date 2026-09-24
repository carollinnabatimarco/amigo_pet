import 'package:flutter/material.dart';

import '../style/app_styles.dart';
import 'detalhes_page.dart';
import 'inicio_page.dart';
import 'agendamentos_page.dart';
import 'perfil_page.dart';

class CuidadoresPage extends StatefulWidget {
  const CuidadoresPage({super.key});

  @override
  State<CuidadoresPage> createState() =>
      _CuidadoresPageState();
}

class _CuidadoresPageState
    extends State<CuidadoresPage> {
  String filtro = 'Mais próximos';

  final List<Map<String, String>> cuidadores = [
    {
      'nome': 'Ana Luiza',
      'avaliacao': '4,9',
      'distancia': '0,8 km',
      'servico': 'Passeio e hospedagem',
    },
    {
      'nome': 'Mariana Silva',
      'avaliacao': '4,8',
      'distancia': '1,2 km',
      'servico': 'Passeio',
    },
    {
      'nome': 'Lucas Oliveira',
      'avaliacao': '4,9',
      'distancia': '1,5 km',
      'servico': 'Hospedagem',
    },
    {
      'nome': 'Beatriz Santos',
      'avaliacao': '4,7',
      'distancia': '2,1 km',
      'servico': 'Banho e tosa',
    },
    {
      'nome': 'Gabriel Costa',
      'avaliacao': '4,8',
      'distancia': '2,6 km',
      'servico': 'Passeio e hospedagem',
    },
    {
      'nome': 'Julia Martins',
      'avaliacao': '5,0',
      'distancia': '3,0 km',
      'servico': 'Passeio',
    },
  ];

  // ==========================================================
  // DRAWER
  // ==========================================================

  Widget _drawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
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

            // INÍCIO

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

            // CUIDADORES

            ListTile(
              selected: true,
              selectedTileColor:
              AppStyles.verdeClaro,
              leading: const Icon(
                Icons.pets_outlined,
                color: AppStyles.verdeEscuro,
              ),
              title: const Text(
                'Cuidadores',
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

            // AGENDAMENTOS

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

            // PERFIL

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

            // CONFIGURAÇÕES

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
  // POPUP MENU
  // ==========================================================

  void _abrirFiltro(String opcao) {
    setState(() {
      filtro = opcao;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          'Ordenado por: $opcao',
        ),
      ),
    );
  }

  // ==========================================================
  // CARD DO CUIDADOR
  // ==========================================================

  Widget _cardCuidador(
      Map<String, String> cuidador,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetalhesCuidadorPage(
                  nome: cuidador['nome']!,
                  avaliacao:
                  cuidador['avaliacao']!,
                  distancia:
                  cuidador['distancia']!,
                  descricao:
                  'Cuidador disponível na sua região para cuidar do seu pet com carinho e segurança.',
                ),
          ),
        );
      },

      child: Container(

        margin: const EdgeInsets.only(
          bottom: 12,
        ),

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
          BorderRadius.circular(18),

          boxShadow:
          AppStyles.sombraCard,
        ),

        child: Row(
          children: [
            // FOTO

            Container(
              width: 65,
              height: 65,

              decoration: BoxDecoration(
                color:
                AppStyles.verdeClaro,

                borderRadius:
                BorderRadius.circular(18),
              ),

              child: const Icon(
                Icons.person,
                size: 38,
                color:
                AppStyles.verdeEscuro,
              ),
            ),

            const SizedBox(width: 13),

            // INFORMAÇÕES

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Text(
                    cuidador['nome']!,

                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight:
                      FontWeight.bold,
                      color:
                      AppStyles.texto,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                        color:
                        Color(0xFFFFA726),
                      ),

                      const SizedBox(width: 3),

                      Text(
                        cuidador[
                        'avaliacao']!,

                        style:
                        const TextStyle(
                          fontSize: 10,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 9),

                      const Icon(
                        Icons
                            .location_on_outlined,
                        size: 14,
                        color: AppStyles
                            .textoSecundario,
                      ),

                      const SizedBox(width: 2),

                      Text(
                        cuidador[
                        'distancia']!,

                        style:
                        const TextStyle(
                          fontSize: 9,
                          color: AppStyles
                              .textoSecundario,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    cuidador['servico']!,

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

            const Icon(
              Icons.chevron_right,
              color:
              AppStyles.textoSecundario,
            ),
          ],
        ),
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
          'Cuidadores',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.tune,
            ),

            onSelected: _abrirFiltro,

            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'Mais próximos',
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 19,
                      ),
                      SizedBox(width: 9),
                      Text(
                        'Mais próximos',
                      ),
                    ],
                  ),
                ),

                const PopupMenuItem(
                  value: 'Melhor avaliados',
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_outline,
                        size: 19,
                      ),
                      SizedBox(width: 9),
                      Text(
                        'Melhor avaliados',
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),

      body: Padding(
        padding:
        const EdgeInsets.fromLTRB(
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
              'Encontre um cuidador',
              style: AppStyles.titulo,
            ),

            const SizedBox(height: 5),

            const Text(
              'Pessoas de confiança perto de você.',
              style: AppStyles.subtitulo,
            ),

            const SizedBox(height: 16),

            // FILTRO ATUAL

            Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 8,
              ),

              decoration: BoxDecoration(
                color:
                AppStyles.verdeClaro,

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: Row(
                mainAxisSize:
                MainAxisSize.min,

                children: [
                  const Icon(
                    Icons.filter_list,
                    size: 15,
                    color:
                    AppStyles.verdeEscuro,
                  ),

                  const SizedBox(width: 6),

                  Text(
                    filtro,
                    style:
                    const TextStyle(
                      fontSize: 9,
                      fontWeight:
                      FontWeight.w600,
                      color: AppStyles
                          .verdeEscuro,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // ==================================================
            // LISTA
            // ==================================================

            Expanded(
              child: ListView.builder(
                itemCount:
                cuidadores.length,

                itemBuilder:
                    (context, index) {
                  return _cardCuidador(
                    cuidadores[index],
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