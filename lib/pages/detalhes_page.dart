import 'package:flutter/material.dart';

import '../style/app_styles.dart';
import 'agendamentos_page.dart';
import 'cuidadores_page.dart';
import 'inicio_page.dart';
import 'perfil_page.dart';

class DetalhesCuidadorPage extends StatefulWidget {
  final String nome;
  final String descricao;
  final String avaliacao;
  final String distancia;

  const DetalhesCuidadorPage({
    super.key,
    this.nome = 'Ana Luiza',
    this.descricao =
    'Cuidadora apaixonada por animais e com experiência em passeios e hospedagem.',
    this.avaliacao = '4,9',
    this.distancia = '0,8 km',
  });

  @override
  State<DetalhesCuidadorPage> createState() =>
      _DetalhesCuidadorPageState();
}

class _DetalhesCuidadorPageState
    extends State<DetalhesCuidadorPage> {
  String servicoSelecionado = 'Passeio';

  bool agendamentoAtivo = true;

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

                    padding:
                    const EdgeInsets.all(7),

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
                      fontWeight:
                      FontWeight.bold,
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
                  fontWeight:
                  FontWeight.w600,
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
                  fontWeight:
                  FontWeight.w600,
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
                  fontWeight:
                  FontWeight.w600,
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
                  fontWeight:
                  FontWeight.w600,
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
                  fontWeight:
                  FontWeight.w600,
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
              padding:
              const EdgeInsets.only(
                bottom: 20,
              ),

              child: Text(
                'AmigoPet • 2026',

                style: TextStyle(
                  fontSize: 10,
                  color:
                  Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // CANCELAR AGENDAMENTO
  // ==========================================================

  void _cancelarAgendamento() {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Cancelar agendamento?',
          ),

          content: const Text(
            'Tem certeza que deseja cancelar este agendamento? Essa ação não poderá ser desfeita.',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Não',
                style: TextStyle(
                  color:
                  AppStyles.verdeEscuro,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  agendamentoAtivo = false;
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Agendamento cancelado.',
                    ),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor:
                Colors.red.shade600,

                foregroundColor:
                Colors.white,
              ),

              child: const Text(
                'Cancelar',
              ),
            ),
          ],
        );
      },
    );
  }

  // ==========================================================
  // SIMPLE DIALOG - TIPO DE SERVIÇO
  // ==========================================================

  void _selecionarServico() {
    showDialog(
      context: context,

      builder: (context) {
        return SimpleDialog(
          title: const Text(
            'Tipo de serviço',
          ),

          children: [
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  servicoSelecionado =
                  'Passeio';
                });

                Navigator.pop(context);
              },

              child: const Row(
                children: [
                  Icon(
                    Icons.directions_walk,
                    color:
                    AppStyles.verdeEscuro,
                  ),

                  SizedBox(width: 12),

                  Text('Passeio'),
                ],
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  servicoSelecionado =
                  'Hospedagem';
                });

                Navigator.pop(context);
              },

              child: const Row(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color:
                    AppStyles.verdeEscuro,
                  ),

                  SizedBox(width: 12),

                  Text('Hospedagem'),
                ],
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  servicoSelecionado =
                  'Banho e tosa';
                });

                Navigator.pop(context);
              },

              child: const Row(
                children: [
                  Icon(
                    Icons.content_cut,
                    color:
                    AppStyles.verdeEscuro,
                  ),

                  SizedBox(width: 12),

                  Text('Banho e tosa'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // ==========================================================
  // MAIS OPÇÕES
  // ==========================================================

  void _maisOpcoes() {
    showModalBottomSheet(
      context: context,

      backgroundColor: Colors.white,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),

      builder: (context) {
        return SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.fromLTRB(
              20,
              15,
              20,
              20,
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Container(
                  width: 45,
                  height: 5,

                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,

                    borderRadius:
                    BorderRadius.circular(
                      10,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Mais opções',

                  style: TextStyle(
                    fontSize: 17,
                    fontWeight:
                    FontWeight.bold,
                    color:
                    AppStyles.texto,
                  ),
                ),

                const SizedBox(height: 15),

                // ==================================================
                // COMPARTILHAR PERFIL
                // ==================================================

                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,

                    decoration: BoxDecoration(
                      color:
                      AppStyles.verdeClaro,

                      borderRadius:
                      BorderRadius.circular(
                        12,
                      ),
                    ),

                    child: const Icon(
                      Icons.share_outlined,
                      color:
                      AppStyles.verdeEscuro,
                    ),
                  ),

                  title: const Text(
                    'Compartilhar perfil',

                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),

                  subtitle: const Text(
                    'Compartilhe este cuidador com alguém',

                    style: TextStyle(
                      fontSize: 9,
                    ),
                  ),

                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Perfil de ${widget.nome} pronto para compartilhar.',
                        ),
                      ),
                    );
                  },
                ),

                // ==================================================
                // DENUNCIAR
                // ==================================================

                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,

                    decoration: BoxDecoration(
                      color:
                      Colors.red.shade50,

                      borderRadius:
                      BorderRadius.circular(
                        12,
                      ),
                    ),

                    child: Icon(
                      Icons.flag_outlined,
                      color:
                      Colors.red.shade600,
                    ),
                  ),

                  title: const Text(
                    'Denunciar',

                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),

                  subtitle: const Text(
                    'Informar um problema com este perfil',

                    style: TextStyle(
                      fontSize: 9,
                    ),
                  ),

                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Denúncia registrada.',
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 5),
              ],
            ),
          ),
        );
      },
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
          'Detalhes do cuidador',

          style: TextStyle(
            fontSize: 17,
            fontWeight:
            FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
            ),

            onPressed: _maisOpcoes,
          ),
        ],
      ),

      // ========================================================
      // CORPO
      // ========================================================

      body: SingleChildScrollView(
        padding:
        const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            // ==================================================
            // PERFIL
            // ==================================================

            Container(
              width: double.infinity,

              padding:
              const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(
                  20,
                ),
              ),

              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,

                    decoration:
                    BoxDecoration(
                      color:
                      AppStyles.verdeClaro,

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.person,
                      size: 55,
                      color:
                      AppStyles.verdeEscuro,
                    ),
                  ),

                  const SizedBox(height: 13),

                  Text(
                    widget.nome,

                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight:
                      FontWeight.bold,
                      color:
                      AppStyles.texto,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [
                      const Icon(
                        Icons.star,
                        size: 17,
                        color:
                        Color(0xFFFFA726),
                      ),

                      const SizedBox(width: 4),

                      Text(
                        widget.avaliacao,

                        style:
                        const TextStyle(
                          fontSize: 11,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppStyles
                            .textoSecundario,
                      ),

                      const SizedBox(width: 3),

                      Text(
                        widget.distancia,

                        style:
                        const TextStyle(
                          fontSize: 10,
                          color: AppStyles
                              .textoSecundario,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Text(
                    widget.descricao,

                    textAlign:
                    TextAlign.center,

                    style:
                    const TextStyle(
                      fontSize: 10,
                      color: AppStyles
                          .textoSecundario,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ==================================================
            // TIPO DE SERVIÇO
            // ==================================================

            const Text(
              'Serviço',

              style: AppStyles.titulo,
            ),

            const SizedBox(height: 10),

            GestureDetector(
              onTap: _selecionarServico,

              child: Container(
                width: double.infinity,

                padding:
                const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),

                decoration:
                BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(
                    16,
                  ),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,

                      decoration:
                      BoxDecoration(
                        color:
                        AppStyles
                            .verdeClaro,

                        borderRadius:
                        BorderRadius
                            .circular(
                          12,
                        ),
                      ),

                      child: const Icon(
                        Icons.pets_outlined,
                        color: AppStyles
                            .verdeEscuro,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [
                          const Text(
                            'Tipo de serviço',

                            style:
                            TextStyle(
                              fontSize: 8,
                              color: AppStyles
                                  .textoSecundario,
                            ),
                          ),

                          const SizedBox(height: 3),

                          Text(
                            servicoSelecionado,

                            style:
                            const TextStyle(
                              fontSize: 12,
                              fontWeight:
                              FontWeight
                                  .w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons
                          .keyboard_arrow_down,
                      color: AppStyles
                          .textoSecundario,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ==================================================
            // AGENDAMENTO
            // ==================================================

            const Text(
              'Agendamento',

              style: AppStyles.titulo,
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,

              padding:
              const EdgeInsets.all(16),

              decoration:
              BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(
                  18,
                ),
              ),

              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _info(
                          Icons
                              .calendar_today_outlined,
                          'Data',
                          '20/09/2026',
                        ),
                      ),

                      Expanded(
                        child: _info(
                          Icons
                              .access_time_outlined,
                          'Horário',
                          '14:00',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  _info(
                    Icons.pets_outlined,
                    'Pet',
                    'Meu pet',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // CANCELAR AGENDAMENTO
            // ==================================================

            if (agendamentoAtivo)
              SizedBox(
                width: double.infinity,
                height: 48,

                child: OutlinedButton.icon(
                  onPressed:
                  _cancelarAgendamento,

                  icon: const Icon(
                    Icons
                        .event_busy_outlined,
                    size: 18,
                  ),

                  label: const Text(
                    'Cancelar agendamento',
                  ),

                  style:
                  OutlinedButton.styleFrom(
                    foregroundColor:
                    Colors.red.shade600,

                    side: BorderSide(
                      color:
                      Colors.red.shade300,
                    ),

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                        25,
                      ),
                    ),
                  ),
                ),
              ),

            if (!agendamentoAtivo)
              Container(
                width: double.infinity,

                padding:
                const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.red.shade50,

                  borderRadius:
                  BorderRadius.circular(
                    16,
                  ),
                ),

                child: Row(
                  children: [
                    Icon(
                      Icons
                          .cancel_outlined,
                      color:
                      Colors.red.shade600,
                    ),

                    const SizedBox(width: 10),

                    const Expanded(
                      child: Text(
                        'Este agendamento foi cancelado.',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 15),

            // ==================================================
            // MAIS OPÇÕES
            // ==================================================

            SizedBox(
              width: double.infinity,
              height: 48,

              child: ElevatedButton.icon(
                onPressed: _maisOpcoes,

                icon: const Icon(
                  Icons.more_horiz,
                  size: 19,
                ),

                label: const Text(
                  'Mais opções',
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
                    BorderRadius.circular(
                      25,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // INFORMAÇÃO
  // ==========================================================

  Widget _info(
      IconData icon,
      String titulo,
      String valor,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppStyles.verdeEscuro,
        ),

        const SizedBox(width: 8),

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

            const SizedBox(height: 2),

            Text(
              valor,

              style: const TextStyle(
                fontSize: 11,
                fontWeight:
                FontWeight.w600,
                color: AppStyles.texto,
              ),
            ),
          ],
        ),
      ],
    );
  }
}