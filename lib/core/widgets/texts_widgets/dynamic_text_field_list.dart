// lib/components/dynamic_textfield/dynamic_text_field_list.dart

import 'package:flutter/material.dart';
import 'package:shift_sync/core/widgets/toast/app_toast.dart';

import '../../utils/app_colors/app_colors.dart';
import 'custom_text.dart';

class DynamicTextFieldList extends StatefulWidget {
  final String fieldLabel;
  final bool isListData;
  final String titleHintText;
  final String? descriptionHintText;
  final void Function(Map<String, String>) onDataChanged;
  final Map<String, String> initialValues; // Map type
  final TextInputAction textInputAction;
  final int minFields;
  final String? addAnotherLabel;

  final List<int> doubleHeightIndexes;

  const DynamicTextFieldList({
    super.key,

    required this.fieldLabel,
    this.textInputAction = TextInputAction.next,
    this.initialValues = const {},
    this.minFields = 1,
    this.addAnotherLabel,
    this.doubleHeightIndexes = const [],
    required this.titleHintText,
    this.descriptionHintText,
    this.isListData = false,
    required this.onDataChanged,
  });

  @override
  State<DynamicTextFieldList> createState() => _DynamicTextFieldListState();
}

class _DynamicTextFieldListState extends State<DynamicTextFieldList> {
  late List<TextEditingController> titleControllers;
  late List<TextEditingController> descriptionControllers;
  late List<String> fieldKeys; // Store the keys separately to maintain order

  int counter = 0;

  @override
  void initState() {
    super.initState();

    titleControllers = [];
    descriptionControllers = [];
    fieldKeys = [];

    if (widget.initialValues.isNotEmpty) {
      widget.initialValues.forEach((key, value) {
        titleControllers.add(TextEditingController(text: key));
        descriptionControllers.add(TextEditingController(text: value));
        fieldKeys.add(key);
      });
    } else {
      for (int i = 0; i < widget.minFields; i++) {
        _addNewFieldControllers();
      }
    }
  }

  void _updateData() {
    Map<String, String> data = {};
    for (int i = 0; i < titleControllers.length; i++) {
      if (widget.isListData) {
        // For 'Preparation Steps' and similar single-field lists
        data['Step ${i + 1}'] = titleControllers[i].text;
      } else {
        // For 'Ingredients' and 'Nutrition Info'
        data[titleControllers[i].text] = descriptionControllers[i].text;
      }
    }
    widget.onDataChanged(data);
  }

  void _addNewFieldControllers() {
    counter++;
    String newKey = 'Field $counter';
    titleControllers.add(TextEditingController());
    descriptionControllers.add(TextEditingController());
    fieldKeys.add(newKey);
  }

  void _addField() {
    setState(() {
      _addNewFieldControllers();
    });
  }

  void _removeField(int index) {
    if (fieldKeys.length <= widget.minFields) {
      AppToast.show(
        context,

        'Keep at least ${widget.minFields} ${widget.fieldLabel.toLowerCase()}${widget.minFields > 1 ? 's' : ''}.',
        backgroundColor: AppColors.primary,
        textColor: AppColors.white,
        isSuccess: false,
      );
      return;
    }

    setState(() {
      titleControllers[index].dispose();
      descriptionControllers[index].dispose();
      titleControllers.removeAt(index);
      descriptionControllers.removeAt(index);
      fieldKeys.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (var controller in titleControllers) {
      controller.dispose();
    }

    for (var controller in descriptionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        ...List.generate(fieldKeys.length, (index) {
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textAlign: TextAlign.start,
                    text: fieldKeys.length > 1
                        ? '${widget.fieldLabel} ${index + 1}'
                        : widget.fieldLabel,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: titleControllers[index],
                          onChanged: (text) => _updateData(),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter ${widget.fieldLabel.toLowerCase()}';
                            }
                            return null;
                          },
                          textInputAction: widget.textInputAction,
                          decoration: InputDecoration(
                            hintText: widget.titleHintText,
                            hintStyle: TextStyle(
                              color: AppColors.mediumGrey,
                              fontSize: 12,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.mediumGrey,
                              ),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.mediumGrey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: AppColors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColors.red,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      // If not preparation step, show the description field as well
                      if (widget.isListData == false)
                        Expanded(
                          child: TextFormField(
                            controller: descriptionControllers[index],
                            onChanged: (text) => _updateData(),
                            decoration: InputDecoration(
                              hintText: widget.descriptionHintText,
                              hintStyle: TextStyle(
                                color: AppColors.mediumGrey,
                                fontSize: 12,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.mediumGrey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.mediumGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppColors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      SizedBox(width: 8),
                      if (fieldKeys.length > widget.minFields)
                        GestureDetector(
                          onTap: () => _removeField(index),
                          child: Icon(
                            Icons.delete,
                            size: 24,
                            color: AppColors.black,
                          ),
                        ),
                      SizedBox(width: 4),
                      if (index == fieldKeys.length - 1)
                        GestureDetector(
                          onTap: _addField,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.mediumGrey),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }
}
