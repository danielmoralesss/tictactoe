import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/game_mode.dart';
import '../../data/repositories/auth_repository.dart';
import '../../features/auth/auth_controller.dart';
import '../../features/lobby/waiting_room_screen.dart';
import '../../features/ranking/ranking_screen.dart';
import '../../shared/widgets/app_background.dart';
import '../../shared/widgets/brand_widgets.dart';
import '../../shared/widgets/gold_button.dart';
import '../../shared/widgets/obsidian_card.dart';

class ModeSelectionScreen extends StatefulWidget {
  const ModeSelectionScreen({super.key});

  @override
  State<ModeSelectionScreen> createState() => _ModeSelectionScreenState();
}

class _ModeSelectionScreenState extends State<ModeSelectionScreen> {
  GameMode _selectedMode = GameMode.classic;

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthRepository>().currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TicTacToe'),
        actions: [
          IconButton(
            tooltip: 'Ranking',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RankingScreen()),
              );
            },
            icon: const Icon(Icons.leaderboard_outlined),
          ),
          IconButton(
            tooltip: 'Cerrar sesión',
            onPressed: () => context.read<AuthController>().signOut(),
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
          children: [
            const EyebrowText('Sala principal'),
            const SizedBox(height: 8),
            const Text(
              'Juego del gato',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            Text(
              'Hola, ${user?.displayName ?? 'Jugador'}. Elige un modo y entra a una sala para jugar en tiempo real.',
              style:
                  const TextStyle(color: AppColors.textSecondary, height: 1.45),
            ),
            const SizedBox(height: 24),
            ...GameMode.values.map((mode) {
              final selected = _selectedMode == mode;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () => setState(() => _selectedMode = mode),
                  child: ObsidianCard(
                    glow: selected,
                    color:
                        selected ? AppColors.surface : AppColors.surfaceLowest,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: .10),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                mode == GameMode.classic
                                    ? Icons.grid_3x3_rounded
                                    : Icons.groups_rounded,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mode.shortTitle,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    mode.description,
                                    style: const TextStyle(
                                      color: AppColors.textSecondary,
                                      height: 1.35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              selected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color: selected
                                  ? AppColors.primary
                                  : AppColors.textMuted,
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Center(child: _ModePreview(mode: mode)),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 6),
            GoldButton(
              label: 'Continuar',
              icon: Icons.arrow_forward_rounded,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => WaitingRoomScreen(mode: _selectedMode)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ModePreview extends StatelessWidget {
  const _ModePreview({required this.mode});

  final GameMode mode;

  @override
  Widget build(BuildContext context) {
    final cells = mode == GameMode.classic ? 9 : 36;
    final crossAxisCount = mode == GameMode.classic ? 3 : 6;
    final width = mode == GameMode.classic ? 120.0 : 180.0;
    final markers = mode == GameMode.classic
        ? <int, _MiniCell>{
            0: const _MiniCell(symbol: 'X', color: AppColors.xColor),
            4: const _MiniCell(symbol: 'O', color: AppColors.oColor),
          }
        : <int, _MiniCell>{
            0: const _MiniCell(symbol: 'X', color: AppColors.xColor),
            7: const _MiniCell(symbol: 'O', color: AppColors.oColor),
            14: const _MiniCell(symbol: '△', color: AppColors.triangleColor),
            21: const _MiniCell(symbol: '□', color: AppColors.squareColor),
          };

    return SizedBox(
      width: width,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        children: List.generate(
            cells, (index) => markers[index] ?? const _MiniCell()),
      ),
    );
  }
}

class _MiniCell extends StatelessWidget {
  const _MiniCell({this.symbol = '', this.color = AppColors.textPrimary});

  final String symbol;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceHigh,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColors.ghostBorder),
      ),
      child: Center(
        child: Text(
          symbol,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w900, fontSize: 15),
        ),
      ),
    );
  }
}
