import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String name;
  final double price;
  final int qty;
  final bool isActive;
  final VoidCallback onTap;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onEdit;

  const ItemTile({
    super.key,
    required this.name,
    required this.price,
    required this.qty,
    required this.isActive,
    required this.onTap,
    required this.onIncrease,
    required this.onDecrease,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? const Color(0xFF2ECC71) : const Color(0xFF282828),
            width: isActive ? 2 : 1,
          ),
        ),

        child: Column(
          children: [
            // ───────────────────────── ROW: Main Info ─────────────────────────
            Row(
              children: [
                // Left side info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Rp ${price.toStringAsFixed(0)} x $qty",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Subtotal
                Text(
                  "Rp ${(price * qty).toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // ───────────────────────── Expanded Controls ─────────────────────────
            if (isActive) ...[
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onDecrease,
                    icon: const Icon(Icons.remove, color: Colors.white),
                  ),
                  Text(
                    "$qty",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  IconButton(
                    onPressed: onIncrease,
                    icon: const Icon(Icons.add, color: Color(0xFF2ECC71)),
                  ),
                ],
              )
            ],
          ],
        ),
      ),
    );
  }
}
