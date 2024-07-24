#include <bits/stdc++.h>
using namespace std;

int main() {
    ofstream file("insert_favourite_data.sql");

    if (!file.is_open()) {
        cerr << "Failed to open file for writing.\n";
        return 1;
    }

    srand(static_cast<unsigned int>(time(0)));

    int numUsers = 1000; 
    int numAuthors = 1000;

    for (int i = 1; i <= 1000; ++i) {
        int idUser = rand() % numUsers + 1;
        int idAuthor = rand() % numAuthors + 1;
        int likeForAuthor = rand() % 2;

        file << "INSERT INTO Favourite (id_user, id_author, like_for_author) VALUES ("
             << idUser << ", "
             << idAuthor << ", "
             << likeForAuthor << ");\n";
    }

    file.close();
    cout << "Insert statements generated and written to insert_favourite_data.sql\n";
    return 0;
}
