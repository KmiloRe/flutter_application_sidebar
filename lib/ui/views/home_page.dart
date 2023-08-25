part of ui;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: SideMenu(
              showToggle: true,
              controller: sideMenu,
              style: SideMenuStyle(
                displayMode: SideMenuDisplayMode.auto,
                hoverColor: Colors.lightGreen[100],
                selectedColor: Colors.lightGreen,
                selectedTitleTextStyle: const TextStyle(color: Colors.white),
                selectedIconColor: Colors.white,
              ),
              title: Column(
                children: [
                  Align(
                    alignment: const Alignment(-0.6, 0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 90,
                      ),
                      child: Image.asset(
                        'assets/images/MCElogo.png',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      indent: 8.0,
                      endIndent: 8.0,
                    ),
                  ),
                ],
              ),
              footer: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const SideMenuItem(
                  title: 'Cerrar sesión',
                  icon: Icon(Icons.exit_to_app),
                ),
              ),
              items: [
                SideMenuItem(
                  title: 'Documentación',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.file_copy_rounded),
                  tooltipContent: "This is a tooltip for Documentación item",
                ),
                SideMenuItem(
                  title: 'Tendencia',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.trending_up_outlined),
                  // icon: const Icon(Icons.supervisor_account),
                  trailing: Container(
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 3),
                        child: Text(
                          'Nuevo',
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[800]),
                        ),
                      )),
                ),
                SideMenuItem(
                  title: 'Certificados',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.grading_sharp),
                ),
                SideMenuItem(
                  title: 'Registro fotografico',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
                // SideMenuItem(
                //   title: 'Settings',
                //   onTap: (index, _) {
                //     sideMenu.changePage(index);
                //   },
                //   icon: const Icon(Icons.image_rounded),
                // ),
                // SideMenuItem(
                //   onTap:(index, _){
                //     sideMenu.changePage(index);
                //   },
                //   icon: const Icon(Icons.image_rounded),
                // ),
                // SideMenuItem(
                //   title: 'Only Title',
                //   onTap:(index, _){
                //     sideMenu.changePage(index);
                //   },
                // ),

                // const SideMenuItem(
                //   title: 'Cerrar sesión',
                //   icon: Icon(Icons.exit_to_app),
                // ),
              ],
              alwaysShowFooter: true,
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: const [
                ColoredBox(
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Documentación',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                ColoredBox(
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      'Tendencia',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Certificates(),
                ColoredBox(
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Registro fotografico',
                      style: TextStyle(fontSize: 35),
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
