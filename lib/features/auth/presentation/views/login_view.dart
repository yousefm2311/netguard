import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/smartnet_ui.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary.withValues(alpha: 0.08),
              theme.scaffoldBackgroundColor,
              theme.colorScheme.tertiary.withValues(alpha: 0.08),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 960;
              final content = wide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: _buildShowcase(context, compact: false)),
                        const SizedBox(width: 28),
                        Expanded(child: _buildFormCard(context)),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildShowcase(context, compact: true),
                          const SizedBox(height: 20),
                          _buildFormCard(context),
                        ],
                      ),
                    );

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1180),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: content,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildShowcase(BuildContext context, {required bool compact}) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final tertiary = theme.colorScheme.tertiary;

    final body = Column(
      mainAxisSize: compact ? MainAxisSize.min : MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            'admin_workspace'.tr,
            style: theme.textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'app_name'.tr,
          style: theme.textTheme.displaySmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'sign_in_subheadline'.tr,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white.withValues(alpha: 0.92),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            SmartNetGlassChip(
              icon: Icons.security_rounded,
              label: 'secure_access'.tr,
            ),
            SmartNetGlassChip(
              icon: Icons.wifi_protected_setup_rounded,
              label: 'trusted_network'.tr,
            ),
            SmartNetGlassChip(
              icon: Icons.graphic_eq_rounded,
              label: 'live_status'.tr,
            ),
          ],
        ),
        SizedBox(height: compact ? 24 : 120),
        _floatingPanel(context),
        const SizedBox(height: 16),
        _miniStatsRow(context),
      ],
    );

    return Container(
      constraints: BoxConstraints(minHeight: compact ? 0 : 560),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        gradient: LinearGradient(
          colors: [primary, const Color(0xFF0A79A8), tertiary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.25),
            blurRadius: 42,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -24,
            right: -12,
            child: _glowBubble(160, Colors.white.withValues(alpha: 0.10)),
          ),
          Positioned(
            bottom: 48,
            left: -20,
            child: _glowBubble(110, Colors.white.withValues(alpha: 0.08)),
          ),
          body,
        ],
      ),
    );
  }

  Widget _buildFormCard(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'welcome_back'.tr,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'login_hint'.tr,
                style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
              ),
              const SizedBox(height: 28),
              TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                  labelText: 'username'.tr,
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                ),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password'.tr,
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                ),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              GetBuilder<AuthController>(
                builder: (_) {
                  return FilledButton(
                    onPressed: controller.isLoading ? null : controller.login,
                    child: controller.isLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text('login'.tr),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _floatingPanel(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.router_rounded, color: Color(0xFF0056C3)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'network_overview'.tr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(child: _MetricTile(label: '24', value: 'Devices')),
              SizedBox(width: 12),
              Expanded(child: _MetricTile(label: '1.2TB', value: 'Traffic')),
              SizedBox(width: 12),
              Expanded(child: _MetricTile(label: '99%', value: 'Uptime')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniStatsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _statusStrip(context, 'Realtime sync', Icons.bolt_rounded)),
        const SizedBox(width: 12),
        Expanded(
          child: _statusStrip(context, 'Quota controls', Icons.pie_chart_rounded),
        ),
      ],
    );
  }

  Widget _statusStrip(BuildContext context, String label, IconData icon) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _glowBubble(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.88),
            ),
          ),
        ],
      ),
    );
  }
}
