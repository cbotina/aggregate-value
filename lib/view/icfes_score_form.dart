import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:registro_agregado_cb/model/icfes_score.dart';
import 'package:registro_agregado_cb/model/student.dart';
import 'package:registro_agregado_cb/model/university.dart';

// ignore: must_be_immutable
class IcfesScoreForm extends StatefulWidget {
  const IcfesScoreForm({super.key});

  @override
  State<IcfesScoreForm> createState() => _IcfesScoreFormState();
}

enum IdType {
  cc,
  ti,
}

const List<String> idTypes = ['CC', 'TI'];

class _IcfesScoreFormState extends State<IcfesScoreForm> {
  late University university;
  late TextEditingController _idController;
  late TextEditingController _registryController;
  String? selectedIdType = 'CC';

  double _lecturaScore = 0;
  double _matematicasScore = 0;
  double _sociudadanasScore = 0;
  double _naturalesScore = 0;
  double _inglesScore = 0;

  @override
  void initState() {
    university = University(name: 'Umariana');
    _idController = TextEditingController();
    _registryController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Background(),
          Container(
            width: 720,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: const Color(0xff1B242B),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  spreadRadius: 8,
                  blurRadius: 10,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/umariana.png',
                      height: 50,
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                    ),
                    const Column(
                      children: [
                        Text(
                          "Registro de Puntaje",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.tealAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icfes.png',
                      height: 50,
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Ingresar Datos: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.3),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      alignment: Alignment.center,
                                      child: DropdownButton(
                                        isExpanded: true,
                                        items: idTypes
                                            .map<DropdownMenuItem<String>>(
                                                (value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (element) {
                                          setState(() {
                                            selectedIdType = element ?? "";
                                          });
                                        },
                                        value: selectedIdType,
                                        icon: const Icon(Icons.payment),
                                        iconEnabledColor: Colors.teal,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        dropdownColor:
                                            Colors.black.withOpacity(.3),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 140,
                                      child: TextField(
                                        cursorColor: Colors.tealAccent,
                                        controller: _idController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              Colors.black.withOpacity(.3),
                                          focusColor: Colors.greenAccent,
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.tealAccent,
                                              width: 2,
                                            ),
                                          ),
                                          labelText: 'Identificacion',
                                          labelStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                        ),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  cursorColor: Colors.tealAccent,
                                  controller: _registryController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black.withOpacity(.3),
                                    focusColor: Colors.greenAccent,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.tealAccent,
                                        width: 2,
                                      ),
                                    ),
                                    labelText: 'Numero Registro ICFES',
                                    labelStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                  ),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 120,
                                    child: Text(
                                      "Lectura Critica",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Slider(
                                      value: _lecturaScore,
                                      max: 100,
                                      divisions: 100,
                                      label: _lecturaScore.round().toString(),
                                      onChanged: ((double value) {
                                        setState(() {
                                          _lecturaScore = value;
                                        });
                                      }),
                                      thumbColor: _lecturaScore < 10
                                          ? Colors.red.shade900
                                          : _lecturaScore < 30
                                              ? Colors.redAccent
                                              : _lecturaScore < 50
                                                  ? Colors.orangeAccent
                                                  : _lecturaScore < 70
                                                      ? Colors.amberAccent
                                                      : _lecturaScore < 80
                                                          ? Colors.greenAccent
                                                          : Colors.tealAccent,
                                      activeColor: _lecturaScore < 10
                                          ? Colors.red.shade900
                                          : _lecturaScore < 30
                                              ? Colors.red
                                              : _lecturaScore < 50
                                                  ? Colors.orange
                                                  : _lecturaScore < 70
                                                      ? Colors.amber
                                                      : _lecturaScore < 80
                                                          ? Colors.green
                                                          : Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 120,
                                    child: Text(
                                      "Matemáticas",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Slider(
                                      value: _matematicasScore,
                                      max: 100,
                                      divisions: 100,
                                      label:
                                          _matematicasScore.round().toString(),
                                      onChanged: ((double value) {
                                        setState(() {
                                          _matematicasScore = value;
                                        });
                                      }),
                                      thumbColor: _matematicasScore < 10
                                          ? Colors.red.shade900
                                          : _matematicasScore < 30
                                              ? Colors.redAccent
                                              : _matematicasScore < 50
                                                  ? Colors.orangeAccent
                                                  : _matematicasScore < 70
                                                      ? Colors.amberAccent
                                                      : _matematicasScore < 80
                                                          ? Colors.greenAccent
                                                          : Colors.tealAccent,
                                      activeColor: _matematicasScore < 10
                                          ? Colors.red.shade900
                                          : _matematicasScore < 30
                                              ? Colors.red
                                              : _matematicasScore < 50
                                                  ? Colors.orange
                                                  : _matematicasScore < 70
                                                      ? Colors.amber
                                                      : _matematicasScore < 80
                                                          ? Colors.green
                                                          : Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 120,
                                    child: Text(
                                      "Competencias Ciudadanas",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Slider(
                                      value: _sociudadanasScore,
                                      max: 100,
                                      divisions: 100,
                                      label:
                                          _sociudadanasScore.round().toString(),
                                      onChanged: ((double value) {
                                        setState(() {
                                          _sociudadanasScore = value;
                                        });
                                      }),
                                      thumbColor: _sociudadanasScore < 10
                                          ? Colors.red.shade900
                                          : _sociudadanasScore < 30
                                              ? Colors.redAccent
                                              : _sociudadanasScore < 50
                                                  ? Colors.orangeAccent
                                                  : _sociudadanasScore < 70
                                                      ? Colors.amberAccent
                                                      : _sociudadanasScore < 80
                                                          ? Colors.greenAccent
                                                          : Colors.tealAccent,
                                      activeColor: _sociudadanasScore < 10
                                          ? Colors.red.shade900
                                          : _sociudadanasScore < 30
                                              ? Colors.red
                                              : _sociudadanasScore < 50
                                                  ? Colors.orange
                                                  : _sociudadanasScore < 70
                                                      ? Colors.amber
                                                      : _sociudadanasScore < 80
                                                          ? Colors.green
                                                          : Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 120,
                                    child: Text(
                                      "Ciencias Naturales",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Slider(
                                      value: _naturalesScore,
                                      max: 100,
                                      divisions: 100,
                                      label: _naturalesScore.round().toString(),
                                      onChanged: ((double value) {
                                        setState(() {
                                          _naturalesScore = value;
                                        });
                                      }),
                                      thumbColor: _naturalesScore < 10
                                          ? Colors.red.shade900
                                          : _naturalesScore < 30
                                              ? Colors.redAccent
                                              : _naturalesScore < 50
                                                  ? Colors.orangeAccent
                                                  : _naturalesScore < 70
                                                      ? Colors.amberAccent
                                                      : _naturalesScore < 80
                                                          ? Colors.greenAccent
                                                          : Colors.tealAccent,
                                      activeColor: _naturalesScore < 10
                                          ? Colors.red.shade900
                                          : _naturalesScore < 30
                                              ? Colors.red
                                              : _naturalesScore < 50
                                                  ? Colors.orange
                                                  : _naturalesScore < 70
                                                      ? Colors.amber
                                                      : _naturalesScore < 80
                                                          ? Colors.green
                                                          : Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 120,
                                    child: Text(
                                      "Ingles",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Slider(
                                      value: _inglesScore,
                                      max: 100,
                                      divisions: 100,
                                      label: _inglesScore.round().toString(),
                                      onChanged: ((double value) {
                                        setState(() {
                                          _inglesScore = value;
                                        });
                                      }),
                                      thumbColor: _inglesScore < 10
                                          ? Colors.red.shade900
                                          : _inglesScore < 30
                                              ? Colors.redAccent
                                              : _inglesScore < 50
                                                  ? Colors.orangeAccent
                                                  : _inglesScore < 70
                                                      ? Colors.amberAccent
                                                      : _inglesScore < 80
                                                          ? Colors.greenAccent
                                                          : Colors.tealAccent,
                                      activeColor: _inglesScore < 10
                                          ? Colors.red.shade900
                                          : _inglesScore < 30
                                              ? Colors.red
                                              : _inglesScore < 50
                                                  ? Colors.orange
                                                  : _inglesScore < 70
                                                      ? Colors.amber
                                                      : _inglesScore < 80
                                                          ? Colors.green
                                                          : Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.teal,
                    ),
                    overlayColor: MaterialStatePropertyAll(
                      Colors.tealAccent,
                    ),
                    animationDuration: Duration(milliseconds: 1000),
                  ),
                  child: const Text(
                    "Registrar Datos",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () async {
                    bool allTextAreFilled;
                    allTextAreFilled = _idController.text.isNotEmpty &&
                        _registryController.text.isNotEmpty;

                    if (!allTextAreFilled) {
                      showFailureDialog(
                        'Debes llenar todos los campos para continuar',
                        DialogType.warning,
                      );
                      return;
                    }

                    int? studentId = int.tryParse(_idController.text);

                    if (studentId == null) {
                      showFailureDialog(
                        'Formato de $selectedIdType no válido',
                        DialogType.warning,
                      );
                      return;
                    }

                    IcfesScore score = IcfesScore(
                      id: _registryController.text,
                      lecuraCriticaScore: _lecturaScore.round(),
                      matematicasScore: _matematicasScore.round(),
                      sociudadanasScore: _sociudadanasScore.round(),
                      naturalesScore: _naturalesScore.round(),
                      inglesScore: _inglesScore.round(),
                    );

                    try {
                      Student? student =
                          await university.findStudentById(studentId);

                      if (student == null) {
                        throw Exception(
                          "El estudiante con id: $studentId no se encuentra en la base de datos",
                        );
                      }

                      if (await student.getIcfesScore() != null) {
                        throw Exception(
                          "El estudiante con id: $studentId ya tiene registro ICFES en la base de datos",
                        );
                      }

                      await student.registerIcfesScore(score);

                      showSuccessDialog(
                        'El registro icfes con id: ${score.id} ha sido registrado exitosamente',
                      );
                    } catch (e) {
                      showFailureDialog(e.toString(), DialogType.error);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showSuccessDialog(String message) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      showCloseIcon: false,
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
      barrierColor: Colors.black.withOpacity(.8),
      title: '¡Siuu!',
      desc: message,
      btnOkOnPress: () {},
      btnOkIcon: Icons.check_circle,
      btnOkText: 'Ok',
      buttonsTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      descTextStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      width: 500,
      dialogBackgroundColor: const Color(0xff1B242B),
      btnOkColor: Colors.teal,
    ).show();
  }

  showFailureDialog(String message, DialogType type) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      barrierColor: Colors.black.withOpacity(.8),
      dialogType: type,
      showCloseIcon: false,
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
      title: type == DialogType.error ? 'Ha ocurrido un error...' : 'Espera...',
      desc: message,
      btnOkOnPress: () {},
      btnOkIcon: Icons.check_circle,
      btnOkText: 'Entendido',
      buttonsTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      descTextStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      width: 500,
      dialogBackgroundColor: const Color(0xff1B242B),
      btnOkColor: Colors.teal,
    ).show();
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 31, 33, 41),
            Color(0xff15171C),
          ],
        ),
      ),
    );
  }
}
