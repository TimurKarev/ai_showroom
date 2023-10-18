import 'package:flutter/material.dart';

class ListPicker<T> extends StatefulWidget {
  const ListPicker({
    super.key,
    required this.items,
    required this.onApply,
    required this.itemBuilder,
  });

  final List<T> items;
  final void Function(List<T> item) onApply;
  final Widget Function(T) itemBuilder;

  @override
  State<ListPicker<T>> createState() => _ListPickerState<T>();
}

class _ListPickerState<T> extends State<ListPicker<T>> {
  final selectedItems = <T>{};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: widget.items
              .map(
                (item) => GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        if (selectedItems.contains(item)) {
                          selectedItems.remove(item);
                        } else {
                          selectedItems.add(item);
                        }
                      },
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      widget.itemBuilder(item),
                      if (selectedItems.contains(item))
                        const Align(
                          child: Icon(
                            Icons.check,
                            size: 24.0,
                          ),
                        ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        ElevatedButton(
          onPressed: selectedItems.isNotEmpty
              ? () => widget.onApply(
                    selectedItems.toList(),
                  )
              : null,
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
