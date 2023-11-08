#include "userinteractor.h"
#include <QTextStream>
#include <QDebug>

UserInteractor::UserInteractor(QObject *parent)
    : QObject{parent}
{

}

void UserInteractor::getInput()
{
    qDebug() << "\nType in your searchphrase:\n";

    QTextStream s(stdin);
    QString phrase = s.readLine();

    if (!phrase.isEmpty())
    {
        setPhrase(phrase);
    }

}

QString UserInteractor::phrase() const
{
    return m_phrase;
}

void UserInteractor::setPhrase(const QString &newPhrase)
{
    if (m_phrase == newPhrase)
        return;
    m_phrase = newPhrase;
    emit phraseTyped(m_phrase);
}
