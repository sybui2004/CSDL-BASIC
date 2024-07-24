#include <bits/stdc++.h>
using namespace std;

int main() {
    ofstream file("insert_belongto_data.sql");

    if (!file.is_open()) {
        cerr << "Failed to open file for writing.\n";
        return 1;
    }

    srand(static_cast<unsigned int>(time(0)));

    int numBooks = 1000; 
    int numCategories = 1000; 

    for (int i = 1; i <= 1000; ++i) {
        int idBook = rand() % numBooks + 1;
        int idCategory = rand() % numCategories + 1; 

        file << "INSERT INTO BelongTo (id_book, id_category) VALUES ("
             << idBook << ", "
             << idCategory << ");\n";
    }

    file.close();
    cout << "Insert statements generated and written to insert_belongto_data.sql\n";
    return 0;
}
