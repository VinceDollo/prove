import 'package:flutter/material.dart';
import 'package:flutter_starter/core/assets/assetsGen/fonts.gen.dart';
import 'package:flutter_starter/core/values/colors.dart';
import 'package:flutter_starter/core/values/styles.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});
  static const String routeName = 'screen1';

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool _checkbox = true;
  bool _toggle = true;
  int _radio = 0;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Design System')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 48),
        children: [
          // ── Typography ────────────────────────────────────────────────────
          _Section(
            label: 'TYPOGRAPHY',
            children: [
              _TypeRow('displayLarge', tt.displayLarge),
              _TypeRow('headlineLarge', tt.headlineLarge),
              _TypeRow('headlineMedium', tt.headlineMedium),
              _TypeRow('titleLarge', tt.titleLarge),
              _TypeRow('titleMedium', tt.titleMedium),
              _TypeRow('titleSmall', tt.titleSmall),
              _TypeRow('bodyLarge', tt.bodyLarge),
              _TypeRow('bodyMedium', tt.bodyMedium),
              _TypeRow('bodySmall', tt.bodySmall),
              _TypeRow('labelLarge', tt.labelLarge),
              _TypeRow('labelMedium', tt.labelMedium),
              _TypeRow('labelSmall', tt.labelSmall),
              const _TypeRow('errorLabel', AppTextStyles.errorLabel),
            ],
          ),

          // ── Colors ────────────────────────────────────────────────────────
          _Section(
            label: 'COLORS',
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _Swatch('primary', cs.primary, cs.onPrimary),
                  _Swatch('primaryContainer', cs.primaryContainer, cs.onPrimaryContainer),
                  _Swatch('secondary', cs.secondary, cs.onSecondary),
                  _Swatch('surface', cs.surface, cs.onSurface, border: cs.outlineVariant),
                  _Swatch('surfaceVariant', cs.surfaceContainerHighest, cs.onSurfaceVariant),
                  _Swatch('error', cs.error, cs.onError),
                  _Swatch('errorContainer', cs.errorContainer, cs.onErrorContainer),
                  const _Swatch('success', AppColors.success, Colors.white),
                  const _Swatch('warning', AppColors.warning, Colors.black),
                  const _Swatch('info', AppColors.info, Colors.white),
                ],
              ),
            ],
          ),

          // ── Buttons ───────────────────────────────────────────────────────
          _Section(
            label: 'BUTTONS',
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                  const ElevatedButton(onPressed: null, child: Text('Disabled')),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
                  const OutlinedButton(onPressed: null, child: Text('Disabled')),
                ],
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Text')),
                  const TextButton(onPressed: null, child: Text('Disabled')),
                ],
              ),
            ],
          ),

          // ── Input ─────────────────────────────────────────────────────────
          const _Section(
            label: 'INPUT',
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Label',
                  hintText: 'Hint text',
                  helperText: 'Helper text',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Error state',
                  errorText: 'This field is required',
                ),
              ),
            ],
          ),

          // ── Form Controls ─────────────────────────────────────────────────
          _Section(
            label: 'FORM CONTROLS',
            children: [
              CheckboxListTile(
                value: _checkbox,
                onChanged: (v) => setState(() => _checkbox = v!),
                title: const Text('Checkbox'),
                contentPadding: EdgeInsets.zero,
              ),
              RadioGroup<int>(
                groupValue: _radio,
                onChanged: (v) => setState(() { if (v != null) _radio = v; }),
                child: const Column(
                  children: [
                    RadioListTile<int>(
                      value: 0,
                      title: Text('Radio A'),
                      contentPadding: EdgeInsets.zero,
                    ),
                    RadioListTile<int>(
                      value: 1,
                      title: Text('Radio B'),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
              SwitchListTile(
                value: _toggle,
                onChanged: (v) => setState(() => _toggle = v),
                title: const Text('Switch'),
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),

          // ── Card ──────────────────────────────────────────────────────────
          _Section(
            label: 'CARD',
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Card Title', style: tt.titleSmall),
                      const SizedBox(height: 6),
                      Text(
                        'Card body text. Example of bodyMedium inside a card.',
                        style: tt.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Action'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ── Chips ─────────────────────────────────────────────────────────
          const _Section(
            label: 'CHIPS',
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(label: Text('Default')),
                  Chip(label: Text('Design')),
                  Chip(label: Text('System')),
                  Chip(label: Text('Preview')),
                ],
              ),
            ],
          ),

          // ── Shadows ───────────────────────────────────────────────────────
          _Section(
            label: 'SHADOWS',
            children: [
              Row(
                children: [
                  _ShadowBox('cardShadow', AppStyle.cardShadow, cs),
                  const SizedBox(width: 24),
                  _ShadowBox('cardShadowStrong', AppStyle.cardShadowStrong, cs),
                ],
              ),
            ],
          ),

          // ── Feedback ──────────────────────────────────────────────────────
          _Section(
            label: 'FEEDBACK',
            children: [
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('This is a snackbar')),
                      );
                    },
                    child: const Text('Snackbar'),
                  ),
                  OutlinedButton(
                    onPressed: () => _showDialog(context),
                    child: const Text('Dialog'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Dialog Title'),
        content: const Text(
          'This is a dialog. It uses the theme colors and text styles automatically.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}

// ── Section header ────────────────────────────────────────────────────────────

class _Section extends StatelessWidget {

  const _Section({required this.label, required this.children});
  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 36),
        Text(
          label,
          style: tt.labelSmall?.copyWith(
            color: cs.primary,
            letterSpacing: 1.8,
            fontFamily: FontFamily.bold,
          ),
        ),
        const SizedBox(height: 6),
        Divider(color: cs.outlineVariant),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}

// ── Typography row ────────────────────────────────────────────────────────────

class _TypeRow extends StatelessWidget {

  const _TypeRow(this.name, this.style);
  final String name;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 128,
            child: Text(
              name,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Expanded(child: Text(name, style: style)),
        ],
      ),
    );
  }
}

// ── Color swatch ──────────────────────────────────────────────────────────────

class _Swatch extends StatelessWidget {

  const _Swatch(this.name, this.color, this.textColor, {this.border});
  final String name;
  final Color color;
  final Color textColor;
  final Color? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 68,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: border != null ? Border.all(color: border!) : null,
      ),
      padding: const EdgeInsets.all(7),
      child: Text(
        name,
        style: TextStyle(
          color: textColor,
          fontSize: 9,
          fontFamily: FontFamily.bold,
          height: 1.3,
        ),
      ),
    );
  }
}

// ── Shadow preview ────────────────────────────────────────────────────────────

class _ShadowBox extends StatelessWidget {

  const _ShadowBox(this.name, this.shadows, this.cs);
  final String name;
  final List<BoxShadow> shadows;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 56,
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: shadows,
            border: Border.all(color: cs.outlineVariant),
          ),
        ),
        const SizedBox(height: 6),
        Text(name, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
