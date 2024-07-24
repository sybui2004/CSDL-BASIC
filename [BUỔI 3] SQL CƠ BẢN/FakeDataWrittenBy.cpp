#include <bits/stdc++.h>
using namespace std;

int main() {
    ofstream file("insert_written_by_data.sql");

    if (!file.is_open()) {
        cerr << "Failed to open file for writing.\n";
        return 1;
    }

    srand(static_cast<unsigned int>(time(0)));

    int numBooks = 1000; 
    int numAuthors = 1000; 

    for (int i = 1; i <= 1000; ++i) {
        int idBook = rand() % numBooks + 1;
        int idAuthor = rand() % numAuthors + 1;

        file << "INSERT INTO Written_By (id_book, id_author) VALUES ("
             << idBook << ", "
             << idAuthor << ");\n";
    }

    file.close();
    cout << "Insert statements generated and written to insert_written_by_data.sql\n";
    return 0;
}
