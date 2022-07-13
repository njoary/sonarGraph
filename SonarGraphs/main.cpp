#include <QFontDatabase>
#include <QQuickStyle>
#include <QtQml/QQmlEngine>
#include <QtQuick/QQuickView>
#include <QtWidgets/QApplication>

int main(int argc, char *argv[]) {
  QApplication::setApplicationName("SonarGraphs");
  QApplication::setOrganizationName("QtProject");

  // Qt Charts uses Qt Graphics View Framework for drawing, therefore
  // QApplication must be used.
  QApplication app(argc, argv);

  // Load custom fonts
  QFontDatabase::addApplicationFont(":/fonts/fontello.ttf");

  QQuickView viewer;
  QQuickStyle::setStyle("Material");
  QObject::connect(viewer.engine(), &QQmlEngine::quit, &viewer,
                   &QWindow::close);
  viewer.setTitle(QStringLiteral("Sonar Monitor"));
  viewer.setSource(QUrl("qrc:/SonarGraphs/qml/main.qml"));
  viewer.setResizeMode(QQuickView::SizeRootObjectToView);
  viewer.show();

  return app.exec();
}
