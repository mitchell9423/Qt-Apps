#include <QCoreApplication>

#include "userinteractor.h"
#include "qvariant.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    UserInteractor interactor;

    QObject::connect(&interactor, &UserInteractor::phraseTyped, [&](const QString &newPhrase) {
        qInfo() << newPhrase;
    });

    interactor.getInput();

    return a.exec();
}
