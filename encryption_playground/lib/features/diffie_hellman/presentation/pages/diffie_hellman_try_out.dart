import 'package:encryption_playground/features/diffie_hellman/presentation/pages/diffie_hellman_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../diffie_hellman_controller.dart';

class DiffieHellmanTryOut extends StatefulWidget {
  const DiffieHellmanTryOut({super.key});

  @override
  State<DiffieHellmanTryOut> createState() => _DiffieHellmanTryOutState();
}

class _DiffieHellmanTryOutState extends State<DiffieHellmanTryOut> {
  final TextEditingController gController = TextEditingController();
  final TextEditingController pController = TextEditingController();

  final TextEditingController userAPrivateKeyController = TextEditingController();
  final TextEditingController userBPrivateKeyController = TextEditingController();

  final TextEditingController userAPublicKeyController = TextEditingController();
  final TextEditingController userBPublicKeyController = TextEditingController();

  final TextEditingController sharedSecretAController = TextEditingController();
  final TextEditingController sharedSecretBController = TextEditingController();

  late DiffieHellmanController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller = Provider.of<DiffieHellmanController>(context, listen: false);
      _controller.addListener(_onControllerChanged);
      
      // Initial values
      if (_controller.g != null) gController.text = _controller.g.toString();
      if (_controller.p != null) pController.text = _controller.p.toString();
      _onControllerChanged();
    });
  }

  void _onControllerChanged() {
    if (!mounted) return;
    
    _updateTextIfChanged(userAPrivateKeyController, _controller.userAPrivateKey);
    _updateTextIfChanged(userBPrivateKeyController, _controller.userBPrivateKey);
    _updateTextIfChanged(userAPublicKeyController, _controller.userAPublicKey);
    _updateTextIfChanged(userBPublicKeyController, _controller.userBPublicKey);
    _updateTextIfChanged(sharedSecretAController, _controller.sharedSecretA);
    _updateTextIfChanged(sharedSecretBController, _controller.sharedSecretB);
  }

  void _updateTextIfChanged(TextEditingController textController, int? value) {
    final newText = value?.toString() ?? "";
    if (textController.text != newText) {
      textController.text = newText;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    gController.dispose();
    pController.dispose();
    userAPrivateKeyController.dispose();
    userBPrivateKeyController.dispose();
    userAPublicKeyController.dispose();
    userBPublicKeyController.dispose();
    sharedSecretAController.dispose();
    sharedSecretBController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DiffieHellmanController>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diffie Hellman try out'),
        actions: [
          IconButton(
              onPressed: (){
                DiffieHellmanNavigationService.instance.navigatorKey.currentState!.pushNamed('about');
              },
              icon: const Icon(Icons.info_outline)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _userSection(
                      "User A",
                      [
                        _field(
                          userAPrivateKeyController,
                          null,
                          enabled: false,
                          hint: "Private Key (a)",
                          icon: Icons.vpn_key_outlined,
                          theme: theme,
                        ),
                        _field(
                          userAPublicKeyController,
                          null,
                          enabled: false,
                          hint: "Public Key (A)",
                          icon: Icons.public,
                          theme: theme,
                        ),
                        _field(
                          sharedSecretAController,
                          null,
                          enabled: false,
                          hint: "Shared Secret",
                          icon: Icons.lock_outline,
                          theme: theme,
                          isSecret: true,
                        ),
                      ],
                      theme,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _userSection(
                      "User B",
                      [
                        _field(
                          userBPrivateKeyController,
                          null,
                          enabled: false,
                          hint: "Private Key (b)",
                          icon: Icons.vpn_key_outlined,
                          theme: theme,
                        ),
                        _field(
                          userBPublicKeyController,
                          null,
                          enabled: false,
                          hint: "Public Key (B)",
                          icon: Icons.public,
                          theme: theme,
                        ),
                        _field(
                          sharedSecretBController,
                          null,
                          enabled: false,
                          hint: "Shared Secret",
                          icon: Icons.lock_outline,
                          theme: theme,
                          isSecret: true,
                        ),
                      ],
                      theme,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "Global Parameters",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  _field(
                    gController,
                    (value) => controller.g = int.tryParse(value),
                    hint: "G (Base / Generator)",
                    icon: Icons.settings_input_component,
                    theme: theme,
                    isPrimary: true,
                  ),
                  const SizedBox(height: 16),
                  _field(
                    pController,
                    (value) => controller.p = int.tryParse(value),
                    hint: "P (Modulus / Prime)",
                    icon: Icons.numbers,
                    theme: theme,
                    isPrimary: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userSection(String title, List<Widget> children, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withAlpha(10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outline.withAlpha(40),
        ),
      ),
      child: Column(
        children: [
          _title(title, theme),
          const SizedBox(height: 16),
          ...children.map((child) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: child,
              )),
        ],
      ),
    );
  }

  Widget _title(String text, ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.person, size: 48, color: theme.colorScheme.primary),
        const SizedBox(height: 8),
        Text(
          text,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _field(
    TextEditingController controller,
    void Function(String)? onChanged, {
    bool enabled = true,
    required String hint,
    required IconData icon,
    required ThemeData theme,
    bool isPrimary = false,
    bool isSecret = false,
  }) {
    final color = isPrimary 
      ? theme.colorScheme.primary 
      : (isSecret ? theme.colorScheme.tertiary : theme.colorScheme.secondary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 4),
          child: Text(
            hint.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          style: TextStyle(
            fontSize: isPrimary ? null : 14.0,
            fontWeight: isPrimary || isSecret ? FontWeight.bold : FontWeight.normal,
            color: enabled ? theme.colorScheme.onSurface : theme.colorScheme.onSurface.withAlpha(70),
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: color, size: 20),
            filled: !enabled,
            fillColor: color.withAlpha(5),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: color.withAlpha(50)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: color.withAlpha(30)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: color, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: color.withAlpha(10)),
            ),
          ),
        ),
      ],
    );
  }
}

