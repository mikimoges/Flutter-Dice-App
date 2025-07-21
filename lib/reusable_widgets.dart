// Modern Flutter Widgets Collection
// A collection of reusable, modern-looking widgets for your Flutter projects

import 'package:flutter/material.dart';

// =============================================================================
// MODERN APP BAR
// =============================================================================
// Usage:
// appbar: ModernAppBar(
//     title: "Dashboard",
//     subtitle: "Welcome back!",
//     actions: [
//       IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
//       IconButton(icon: Icon(Icons.settings), onPressed: () {}),
//     ],
//   ),
//   backgroundColor: Colors.transparent,
//   elevation: 0,
// )

class ModernAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? textColor;

  const ModernAppBar({
    Key? key,
    required this.title,
    this.subtitle,
    this.actions,
    this.leading,
    this.centerTitle = false,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    print(isDark);
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: backgroundColor != null 
            ? [backgroundColor!, backgroundColor!.withOpacity(0.8)]
            : isDark 
              ? [Colors.grey[900]!, Colors.grey[900]!]
              : [Colors.white, Colors.white],
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              if (leading != null) leading!,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: centerTitle 
                    ? CrossAxisAlignment.center 
                    : CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: textColor ?? (isDark ? Colors.white : Colors.black87),
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 14,
                          color: (textColor ?? (isDark ? Colors.white : Colors.black87))
                              .withOpacity(0.7),
                        ),
                      ),
                  ],
                ),
              ),
              if (actions != null) ...actions!,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

// =============================================================================
// MODERN BOTTOM NAVIGATION BAR
// =============================================================================
// Usage:
// bottomNavigationBar: ModernBottomNav(
//   currentIndex: _selectedIndex,
//   onTap: (index) => setState(() => _selectedIndex = index),
//   items: [
//     ModernBottomNavItem(icon: Icons.home, label: 'Home'),
//     ModernBottomNavItem(icon: Icons.search, label: 'Search'),
//     ModernBottomNavItem(icon: Icons.favorite, label: 'Favorites'),
//     ModernBottomNavItem(icon: Icons.person, label: 'Profile'),
//   ],
// )

class ModernBottomNavItem {
  final IconData icon;
  final String label;
  final Color? color;

  ModernBottomNavItem({
    required this.icon,
    required this.label,
    this.color,
  });
}

class ModernBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<ModernBottomNavItem> items;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;

  const ModernBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final defaultSelectedColor = selectedColor ?? theme.primaryColor;
    final defaultUnselectedColor = unselectedColor ?? Colors.grey;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDark ? Colors.grey[900] : Colors.white),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.grey.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isSelected = index == currentIndex;
            final color = isSelected ? defaultSelectedColor : defaultUnselectedColor;

            return GestureDetector(
              onTap: () => onTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        item.icon,
                        color: color,
                        size: isSelected ? 28 : 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// =============================================================================
// MODERN CARD
// =============================================================================
// Usage:
// ModernCard(
//   child: Column(
//     children: [
//       Text('Card Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       SizedBox(height: 8),
//       Text('Card content goes here'),
//     ],
//   ),
//   onTap: () => print('Card tapped'),
// )

class ModernCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double? elevation;
  final BorderRadius? borderRadius;

  const ModernCard({
    Key? key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.color,
    this.elevation,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: margin ?? const EdgeInsets.all(8),
      child: Material(
        color: color ?? (isDark ? Colors.grey[850] : Colors.white),
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        elevation: elevation ?? 4,
        shadowColor: isDark ? Colors.black54 : Colors.grey.withOpacity(0.2),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          child: Container(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// MODERN BUTTON
// =============================================================================
// Usage:
// ModernButton(
//   text: 'Click Me',
//   onPressed: () => print('Button pressed'),
//   style: ModernButtonStyle.primary,
// )

enum ModernButtonStyle { primary, secondary, outline, text }

class ModernButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ModernButtonStyle style;
  final IconData? icon;
  final Color? color;
  final double? width;
  final bool isLoading;

  const ModernButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.style = ModernButtonStyle.primary,
    this.icon,
    this.color,
    this.width,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = color ?? theme.primaryColor;

    Widget buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isLoading)
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
          )
        else if (icon != null)
          Icon(icon!, size: 18),
        if ((icon != null || isLoading) && text.isNotEmpty)
          const SizedBox(width: 8),
        if (text.isNotEmpty)
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
      ],
    );

    Widget button;
    
    switch (style) {
      case ModernButtonStyle.primary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            elevation: 4,
            shadowColor: primaryColor.withOpacity(0.4),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: buttonChild,
        );
        break;
      case ModernButtonStyle.secondary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor.withOpacity(0.1),
            foregroundColor: primaryColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: buttonChild,
        );
        break;
      case ModernButtonStyle.outline:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryColor,
            side: BorderSide(color: primaryColor),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: buttonChild,
        );
        break;
      case ModernButtonStyle.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: buttonChild,
        );
        break;
    }

    return SizedBox(
      width: width,
      child: button,
    );
  }
}

// =============================================================================
// MODERN TEXT FIELD
// =============================================================================
// Usage:
// ModernTextField(
//   label: 'Email',
//   hint: 'Enter your email',
//   prefixIcon: Icons.email,
//   validator: (value) => value?.isEmpty ?? true ? 'Email is required' : null,
//   onChanged: (value) => print('Email: $value'),
// )

class ModernTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final int maxLines;
  final bool enabled;

  const ModernTextField({
    Key? key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.controller,
    this.maxLines = 1,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<ModernTextField> createState() => _ModernTextFieldState();
}

class _ModernTextFieldState extends State<ModernTextField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.label!,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
        Focus(
          onFocusChange: (focused) => setState(() => _isFocused = focused),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            enabled: widget.enabled,
            validator: widget.validator,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon!, 
                      color: _isFocused ? theme.primaryColor : Colors.grey)
                  : null,
              suffixIcon: widget.suffixIcon != null
                  ? IconButton(
                      icon: Icon(widget.suffixIcon!),
                      onPressed: widget.onSuffixTap,
                    )
                  : null,
              filled: true,
              fillColor: isDark ? Colors.grey[800] : Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.primaryColor,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// MODERN LOADING INDICATOR
// =============================================================================
// Usage:
// ModernLoading(message: 'Loading data...')

class ModernLoading extends StatelessWidget {
  final String? message;
  final Color? color;
  final double size;

  const ModernLoading({
    Key? key,
    this.message,
    this.color,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: color ?? theme.primaryColor,
            ),
          ),
          if (message != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                message!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// =============================================================================
// MODERN CHIP
// =============================================================================
// Usage:
// ModernChip(
//   label: 'Technology',
//   selected: true,
//   onTap: () => print('Chip tapped'),
// )

class ModernChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? color;
  final VoidCallback? onDelete;

  const ModernChip({
    Key? key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.icon,
    this.color,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chipColor = color ?? theme.primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? chipColor : chipColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? chipColor : chipColor.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon!,
                size: 16,
                color: selected ? Colors.white : chipColor,
              ),
            if (icon != null) const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : chipColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (onDelete != null) ...[
              const SizedBox(width: 4),
              GestureDetector(
                onTap: onDelete,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: selected ? Colors.white : chipColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// MODERN FLOATING ACTION BUTTON
// =============================================================================
// Usage:
// floatingActionButton: ModernFAB(
//   icon: Icons.add,
//   onPressed: () => print('FAB pressed'),
//   extended: true,
//   label: 'Add Item',
// )

class ModernFAB extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? label;
  final bool extended;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const ModernFAB({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.label,
    this.extended = false,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (extended && label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: backgroundColor ?? theme.primaryColor,
        foregroundColor: foregroundColor ?? Colors.white,
        elevation: 8,
        icon: Icon(icon),
        label: Text(
          label!,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      );
    }

    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? theme.primaryColor,
      foregroundColor: foregroundColor ?? Colors.white,
      elevation: 8,
      child: Icon(icon),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

// =============================================================================
// EXAMPLE USAGE SCREEN
// =============================================================================
// This shows how to use all the widgets together

class ModernWidgetsDemo extends StatefulWidget {
  @override
  State<ModernWidgetsDemo> createState() => _ModernWidgetsDemoState();
}

class _ModernWidgetsDemoState extends State<ModernWidgetsDemo> {
  int _currentIndex = 0;
  bool _isLoading = false;
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ModernAppBar(
          title: "Modern Widgets",
          subtitle: "Flutter UI Components",
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Modern Cards
            ModernCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Modern Card Example',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('This is a modern-looking card with shadow and rounded corners.'),
                ],
              ),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Card tapped!')),
              ),
            ),

            // Modern Text Field
            ModernTextField(
              controller: _emailController,
              label: 'Email',
              hint: 'Enter your email address',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => 
                value?.isEmpty ?? true ? 'Email is required' : null,
            ),
            const SizedBox(height: 16),

            // Modern Buttons
            Row(
              children: [
                Expanded(
                  child: ModernButton(
                    text: 'Primary',
                    style: ModernButtonStyle.primary,
                    icon: Icons.star,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ModernButton(
                    text: 'Secondary',
                    style: ModernButtonStyle.secondary,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Modern Chips
            Wrap(
              spacing: 8,
              children: [
                ModernChip(label: 'Flutter', selected: true),
                ModernChip(label: 'Dart'),
                ModernChip(label: 'Mobile', icon: Icons.phone_android),
                ModernChip(
                  label: 'Removable',
                  onDelete: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Loading indicator
            if (_isLoading)
              const ModernLoading(message: 'Loading...'),
          ],
        ),
      ),
      bottomNavigationBar: ModernBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          ModernBottomNavItem(icon: Icons.home, label: 'Home'),
          ModernBottomNavItem(icon: Icons.search, label: 'Search'),
          ModernBottomNavItem(icon: Icons.favorite, label: 'Favorites'),
          ModernBottomNavItem(icon: Icons.person, label: 'Profile'),
        ],
      ),
      floatingActionButton: ModernFAB(
        icon: Icons.add,
        extended: true,
        label: 'Add Item',
        onPressed: () => setState(() => _isLoading = !_isLoading),
      ),
    );
  }
}