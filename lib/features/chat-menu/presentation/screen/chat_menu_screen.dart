import 'package:drena_conversa/core/constants/app_colors.dart';
import 'package:drena_conversa/core/constants/app_dimensions.dart';
import 'package:drena_conversa/core/constants/app_fonts.dart';
import 'package:drena_conversa/core/constants/app_strings.dart';
import 'package:drena_conversa/features/auth/presentation/providers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Modelo simples para conversa (ajusta ao teu modelo real)
class ChatPreview {
  final String id;
  final String title;
  final String lastMessage;
  final DateTime updatedAt;

  const ChatPreview({
    required this.id,
    required this.title,
    required this.lastMessage,
    required this.updatedAt,
  });
}

class ChatMenuScreen extends ConsumerWidget {
  const ChatMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    // Substitui por um provider real quando tiveres
    const List<ChatPreview> chats = [];

    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.backgroundGradient,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.screenPaddingMobile),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_buildHeader(), _buildChatList(context, chats)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppDimensions.spacingS),
        Text('Conversas', style: AppFonts.title),
        const SizedBox(height: AppDimensions.spacingM),
      ],
    );
  }

  Widget _buildChatList(BuildContext context, List<ChatPreview> chats) {
    if (chats.isEmpty) {
      return _buildEmptyState(context);
    }

    return Expanded(
      child: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppDimensions.spacingS),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return _buildChatTile(context, chat);
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Nunca conversaste aqui', style: AppFonts.body),
            const SizedBox(height: AppDimensions.spacingXS),
            _buildNewChatButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewChatButton() {
    return ElevatedButton(
      onPressed: null,
      child: const Text(AppStrings.newChatButton),
    );
  }

  Widget _buildChatTile(BuildContext context, ChatPreview chat) {
    return ListTile(
      tileColor: AppColors.badgeText, // ajustar cor
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
      ),
      title: Text(chat.title, style: AppFonts.body),
      subtitle: Text(
        chat.lastMessage,
        style: AppFonts.label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        // Navega para a conversa
        // Navigator.pushNamed(context, '/conversa', arguments: chat.id);
      },
    );
  }
}
