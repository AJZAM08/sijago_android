import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_pilih.dart';
import 'package:sijago_android/data/controllers/dropdown_controller.dart';

import '../../../core/components/custom_textfield.dart';
import '../../../data/controllers/data_controller.dart';

class FormDetails extends StatelessWidget {
  const FormDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final detC = Get.find<UserData>();
    final dropCtrl = Get.find<DropdownController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => Form(
          onChanged: () => detC.handleUserData(detC.formKeyDetails),
          key: detC.formKeyDetails,
          child: Column(
            children: [
              CustomTextField(
                initialValue: detC.nikTeks.value,
                // controller: detC.nikController.value,
                // label: 'NIK',
                focusNode: detC.nikFocusNode,
                autocorrect: true,
                onFieldSubmitted: (_) {
                  if (detC.formKeyDetails.currentState!.validate()) {
                    return;
                  } else {
                    detC.nameFocusNode.requestFocus();
                  }
                },
                validator: (value) {
                  if (value!.length == 0) {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
                onChanged: (value) {
                  detC.nikController.value.text = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: detC.nameController.value,
                label: 'Nama Lengkap',
                focusNode: detC.nameFocusNode,
                autocorrect: true,
                onFieldSubmitted: (_) {
                  if (detC.formKeyDetails.currentState!.validate()) {
                    return;
                  } else {
                    detC.tempatFocusNode.requestFocus();
                  }
                },
                validator: (value) {
                  if (value!.length == 0) {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
                onChanged: (value) {
                  detC.nameController.value.text = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: detC.tempatLahirController.value,
                label: 'Tempat Lahir',
                focusNode: detC.tempatFocusNode,
                autocorrect: true,
                onFieldSubmitted: (_) {
                  if (detC.formKeyDetails.currentState!.validate()) {
                    return;
                  } else {
                    detC.tanggalFocusNode.requestFocus();
                  }
                },
                validator: (value) {
                  if (value!.length == 0) {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
                onChanged: (value) {
                  detC.tempatLahirController.value.text = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                readOnly: true,
                controller: detC.tanggalLahirController.value,
                label: 'Tanggal Lahir',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    final formattedDate =
                        "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                    detC.tanggalLahirController.value.text = formattedDate;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDropdown(
                label: 'Pilih Jenis Kelamin',
                items: ['Pilih Jenis Kelamin', 'Pria', 'Wanita'],
                value: dropCtrl.selectedJenisKelamin?.value ??
                    'Pilih Jenis Kelamin', // Atur nilai default
                onChanged: (value) {
                  if (value != 'Pilih Jenis Kelamin') {
                    dropCtrl.selectedJenisKelamin?.value = value!;
                    // detC.jenisKelaminController.value.text = value;
                  }
                },
                validator: (value) {
                  if (value == 'Pilih Jenis Kelamin') {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: detC.alamatController.value,
                label: 'Alamat',
                focusNode: detC.alamatFocusNode,
                autocorrect: true,
                onFieldSubmitted: (_) {
                  if (detC.formKeyDetails.currentState!.validate()) {
                    return;
                  } else {
                    detC.provinsiFocusNode.requestFocus();
                  }
                },
                validator: (value) {
                  if (value!.length == 0) {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
                onChanged: (value) {
                  detC.alamatController.value.text = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDropdown(
                label: 'Pilih Provinsi',
                items: dropCtrl.provinsiList.map((e) => e.provinsi).toList(),
                value: dropCtrl.selectedProvinsi.value?.provinsi ?? '',
                onChanged: (value) {
                  if (value != null && value.isNotEmpty) {
                    var region = dropCtrl.provinsiList.isEmpty
                        ? null
                        : dropCtrl.provinsiList.firstWhere(
                            (element) => element.provinsi == value,
                          );

                    if (region != null) {
                      dropCtrl.selectProvinsi(region);
                      detC.provinsiController.value.text = value;
                    } else {
                      print("Provinsi tidak ditemukan.");
                    }
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDropdown(
                label: 'Pilih Kabupaten',
                items: dropCtrl.kabupatenList
                    .map((e) => e.kabupatenkota ?? '')
                    .toList(),
                value:
                    dropCtrl.selectedKabupatenKota.value?.kabupatenkota ?? '',
                onChanged: (value) {
                  dropCtrl.selectKabupaten(value);
                  detC.kabupatenController.value.text = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * .44,
                    child: CustomTextField(
                      controller: detC.kecamatanController.value,
                      label: 'Kecamatan',
                      focusNode: detC.kecFocusNode,
                      autocorrect: true,
                      onFieldSubmitted: (_) {
                        if (detC.formKeyDetails.currentState!.validate()) {
                          return;
                        } else {
                          detC.kelFocusNode.requestFocus();
                        }
                      },
                      validator: (value) {
                        if (value!.length == 0) {
                          return "Field harus diisi!!";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        detC.kecamatanController.value.text = value;
                      },
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .44,
                    child: CustomTextField(
                      controller: detC.kelurahanController.value,
                      label: 'Kelurahan',
                      focusNode: detC.kelFocusNode,
                      autocorrect: true,
                      onFieldSubmitted: (_) {
                        if (detC.formKeyDetails.currentState!.validate()) {
                          return;
                        } else {
                          detC.rtFocusNode.requestFocus();
                        }
                      },
                      validator: (value) {
                        if (value!.length == 0) {
                          return "Field harus diisi!!";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        detC.kelurahanController.value.text = value;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * .44,
                    child: CustomTextField(
                      controller: detC.rtController.value,
                      label: 'RT',
                      focusNode: detC.rtFocusNode,
                      autocorrect: true,
                      onFieldSubmitted: (_) {
                        if (detC.formKeyDetails.currentState!.validate()) {
                          return;
                        } else {
                          detC.rwFocusNode.requestFocus();
                        }
                      },
                      validator: (value) {
                        if (value!.length == 0) {
                          return "Field harus diisi!!";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        detC.rtController.value.text = value;
                      },
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .44,
                    child: CustomTextField(
                      controller: detC.rwController.value,
                      label: 'RW',
                      focusNode: detC.rwFocusNode,
                      autocorrect: true,
                      onFieldSubmitted: (_) {
                        if (detC.formKeyDetails.currentState!.validate()) {
                          return;
                        } else {
                          detC.posFocusNode.requestFocus();
                        }
                      },
                      validator: (value) {
                        if (value!.length == 0) {
                          return "Field harus diisi!!";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        detC.rwController.value.text = value;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: detC.kodePosController.value,
                label: 'Kode Pos',
                focusNode: detC.posFocusNode,
                autocorrect: true,
                onFieldSubmitted: (_) {
                  if (detC.formKeyDetails.currentState!.validate()) {
                    return;
                  } else {
                    detC.agamaFocusNode.requestFocus();
                  }
                },
                validator: (value) {
                  if (value!.length == 0) {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
                onChanged: (value) {
                  detC.kodePosController.value.text = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomDropdown(
                label: 'Agama',
                items: ['Agama', 'Islam', 'Kristen', 'Hindu', 'Budha', 'Konghucu'],
                value: dropCtrl.selectedAgama?.value ??
                    'Agama', // Atur nilai default
                onChanged: (value) {
                  if (value != 'Agama') {
                    dropCtrl.selectedAgama?.value = value!;
                    detC.agamaController.value.text = value!;
                  }
                },
                validator: (value) {
                  if (value == 'Agama') {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
              ),
              
              const SizedBox(
                height: 15,
              ),
              CustomDropdown(
                label: 'Status Pernikahan',
                items: ['Status Pernikahan', 'Belum Menikah', 'Sudah Menikah', 'Janda/Duda'],
                value: dropCtrl.selectedStatus?.value ??
                    'Pilih Jenis Kelamin', // Atur nilai default
                onChanged: (value) {
                  if (value != 'Status Pernikahan') {
                    dropCtrl.selectedStatus?.value = value!;
                    detC.statusController.value.text = value!;
                  }
                },
                validator: (value) {
                  if (value == 'Status Pernikahan') {
                    return "Field harus diisi!!";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
