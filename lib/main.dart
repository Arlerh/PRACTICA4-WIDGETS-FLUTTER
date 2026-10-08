import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Práctica Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int indice = 0;

  final List<Widget> pantallas = const [
    InicioPage(),
    InputsPage(),
    DisplayPage(),
    NavegacionPage(),
    FeedbackPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería de Widgets'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: pantallas[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        onTap: (nuevoIndice) {
          setState(() {
            indice = nuevoIndice;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Inputs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Display',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'Navegación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Feedback',
          ),
        ],
      ),
    );
  }
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.widgets,
                  size: 70,
                  color: Colors.deepPurple,
                ),
                SizedBox(height: 10),
                Text(
                  'Práctica de Widgets en Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Layout, Display, Input, Navegación y Feedback',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Estudiante Flutter',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Desarrollo de Software II'),
                        Text('Práctica 04'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const Positioned(
                  left: 20,
                  top: 20,
                  child: Icon(
                    Icons.layers,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const Positioned(
                  right: 20,
                  bottom: 20,
                  child: Text(
                    'Ejemplo de Stack',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InputsPage extends StatefulWidget {
  const InputsPage({super.key});

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  bool switchActivo = false;
  bool checkboxActivo = false;
  String opcion = 'Opción A';
  double valorSlider = 50;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Nombre',
              hintText: 'Escribe tu nombre',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),

          const SizedBox(height: 20),

          SwitchListTile(
            title: const Text('Activar opción'),
            value: switchActivo,
            onChanged: (valor) {
              setState(() {
                switchActivo = valor;
              });
            },
          ),

          CheckboxListTile(
            title: const Text('Aceptar términos'),
            value: checkboxActivo,
            onChanged: (valor) {
              setState(() {
                checkboxActivo = valor ?? false;
              });
            },
          ),

          const SizedBox(height: 10),

          DropdownButton<String>(
            value: opcion,
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                value: 'Opción A',
                child: Text('Opción A'),
              ),
              DropdownMenuItem(
                value: 'Opción B',
                child: Text('Opción B'),
              ),
              DropdownMenuItem(
                value: 'Opción C',
                child: Text('Opción C'),
              ),
            ],
            onChanged: (valor) {
              setState(() {
                opcion = valor!;
              });
            },
          ),

          const SizedBox(height: 20),

          Text(
            'Valor del Slider: ${valorSlider.round()}',
            style: const TextStyle(fontSize: 18),
          ),

          Slider(
            value: valorSlider,
            min: 0,
            max: 100,
            divisions: 10,
            label: valorSlider.round().toString(),
            onChanged: (valor) {
              setState(() {
                valorSlider = valor;
              });
            },
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {},
            child: const Text('Botón de ejemplo'),
          ),
        ],
      ),
    );
  }
}

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final widgets = [
      'Text',
      'Image',
      'Card',
      'CircleAvatar',
      'ListView',
      'GridView',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Widgets de Display',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          const Icon(
            Icons.image,
            size: 80,
            color: Colors.deepPurple,
          ),

          const SizedBox(height: 10),

          const Text(
            'Ejemplo visual de Image',
            style: TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widgets.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.4,
            ),
            itemBuilder: (context, index) {
              return Card(
                color: Colors.deepPurple.shade50,
                child: Center(
                  child: Text(
                    widgets[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.deepPurple,
            tabs: [
              Tab(text: 'A'),
              Tab(text: 'B'),
              Tab(text: 'C'),
            ],
          ),

          Expanded(
            child: TabBarView(
              children: [
                const Center(
                  child: Text(
                    'Contenido de la pestaña A',
                    style: TextStyle(fontSize: 20),
                  ),
                ),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SegundaPantalla(),
                        ),
                      );
                    },
                    child: const Text('Ir a otra pantalla'),
                  ),
                ),

                const Center(
                  child: Text(
                    'Contenido de la pestaña C',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SegundaPantalla extends StatelessWidget {
  const SegundaPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Pantalla'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          label: const Text('Volver'),
        ),
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  void mostrarSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Este es un SnackBar!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void mostrarDialogo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: const Text('Este es un ejemplo de AlertDialog.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () => mostrarSnackBar(context),
            icon: const Icon(Icons.message),
            label: const Text('Mostrar SnackBar'),
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () => mostrarDialogo(context),
            icon: const Icon(Icons.warning),
            label: const Text('Mostrar AlertDialog'),
          ),

          const SizedBox(height: 30),

          const Chip(
            avatar: CircleAvatar(
              child: Text('F'),
            ),
            label: Text('Flutter'),
          ),

          const SizedBox(height: 30),

          const Text(
            'CircularProgressIndicator',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          const CircularProgressIndicator(),

          const SizedBox(height: 30),

          const Text(
            'LinearProgressIndicator',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          const LinearProgressIndicator(
            value: 0.65,
          ),
        ],
      ),
    );
  }
}