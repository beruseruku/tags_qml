#include "gamezone.h"
#include <algorithm>
#include <random>


namespace
{
bool isAdjacent(const GameZone::Position first, const GameZone::Position second) {
    if (first == second) {
        return false;

    }

    const auto calcDistance = [](const size_t pos1, size_t pos2) {
        int distance = static_cast<int>(pos1);
        distance -= static_cast<int>(pos2);
        distance = std::abs(distance);
        return distance;
    };
    bool result {false};

    if(first.first == second.first) {
        int distance = calcDistance(first.second, second.second);
        if (distance == 1) {
            result = true;
        }
    } else if (first.second == second.second) {
        int distance = calcDistance(first.first, second.first);
        if (distance == 1) {
            result = true;
        }
    }
    return result;
}
}
GameZone::GameZone(const size_t boardDimension, QObject *parent)
    : QAbstractListModel {parent},
      m_dimension {boardDimension},
      m_boardSize {m_dimension * m_dimension}
{
    m_rawBoard.resize(m_boardSize);
    std::iota(m_rawBoard.begin(), m_rawBoard.end(), 1);
    shuffle();
}

bool GameZone::move(int index)
{
    if (!isPositionValid(static_cast<size_t>(index))) {
    return false;
    }

    const Position elementPosition = {getRowCol(index)};

    auto hiddenElementIterator = std::find(m_rawBoard.begin(), m_rawBoard.end(), boardSize());

    Q_ASSERT(hiddenElementIterator != m_rawBoard.end());
    Position hiddenElementPosition {getRowCol(std::distance(m_rawBoard.begin(),hiddenElementIterator))};

    if (!isAdjacent(elementPosition, hiddenElementPosition)) {

        return false;
}
    std::swap(hiddenElementIterator->value, m_rawBoard[index].value);
    //std::iter_swap(hiddenElementIterator, elementPosition);
    emit dataChanged(createIndex(0, 0), createIndex(m_boardSize, 0));

    return true;
}


int GameZone::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_rawBoard.size();
}

QVariant GameZone::data(const QModelIndex &index, int role) const
{
    if(!index.isValid() || role != Qt::DisplayRole) {
        return {};
    }
    const int rowIndex {index.row()};
    if(!isPositionValid(rowIndex)) {
        return {};
    }

    return QVariant::fromValue(m_rawBoard[rowIndex].value);
}

GameZone::Position GameZone::getRowCol(const size_t index) const
{
    Q_ASSERT(m_dimension > 0);
    size_t row = index / m_dimension;
    size_t column = index % m_dimension;

    return std::make_pair(row, column);

}

void GameZone::shuffle()
{
    auto seed = std::chrono::system_clock::now().time_since_epoch().count();
    static std::mt19937 generator (seed);

   do {
        std::shuffle(m_rawBoard.begin(), m_rawBoard.end(), generator);


        } while (!isBoardValid());
}

bool GameZone::isPositionValid(const size_t position) const
{
    return position < m_boardSize;


}

bool GameZone::isBoardValid() const
{
    int inv {0};
    for (size_t i {0}; i < m_boardSize; ++i ) {
        for (size_t j = 0; j < i; ++j) {
            if (m_rawBoard[j].value > m_rawBoard[i].value) {
                ++inv;
            }
        }
    }

    const size_t start_point = 1;

    for (size_t i = 0; i < m_boardSize; ++i) {
        if (m_rawBoard[i].value == m_boardSize) {
            inv += start_point + i / m_dimension;

        }
    }

    return (inv % 2) == 0;
}

size_t GameZone::boardSize() const
{
    return m_boardSize;
}

size_t GameZone::dimension() const
{
    return m_dimension;
}

