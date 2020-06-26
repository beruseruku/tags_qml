#ifndef GAMEZONE_H
#define GAMEZONE_H

#include <QAbstractListModel>
#include <vector>

class GameZone : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int dimension READ dimension CONSTANT )
    Q_PROPERTY(int hiddenElementValue READ boardSize CONSTANT)
public:
    static constexpr size_t defaultPuzzleDimension {4};
    GameZone(const size_t boardDimension = defaultPuzzleDimension,
            QObject* parent = nullptr);

    struct Brick {
        size_t value {};
        Brick& operator=(const size_t newValue) {
            value = newValue;
            return * this;
            }
        bool operator==(const size_t other) {
            return other == value;
        }
        bool operator==(const Brick &other) const {
            return other.value == value;
        }
    };

    Q_INVOKABLE bool move (int index);



    size_t dimension() const;
    size_t boardSize() const;

    int rowCount(const QModelIndex& parent = QModelIndex {}) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;

    using Position = std::pair<size_t, size_t>;

signals:
    void tileMoved();
    void solved();

public:
    void shuffle();
private:

    bool isPositionValid (const size_t position) const;
    bool isBoardValid() const;
    bool isSolved() const;
    Position getRowCol(size_t index) const;

    std::vector<Brick> m_rawBoard;
    const size_t m_dimension;
    const size_t m_boardSize;

};

#endif // GAMEZONE_H
