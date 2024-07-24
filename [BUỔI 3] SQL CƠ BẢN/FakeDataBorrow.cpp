#include <bits/stdc++.h>
using namespace std;

string generateRandomDatetime() {
    int year = rand() % 5 + 2020; // Random year from 2020 to 2024
    int month = rand() % 12 + 1;   // Random month from 1 to 12
    int day = rand() % 28 + 1;     // Random day from 1 to 28 to simplify
    int hour = rand() % 24;        // Random hour from 0 to 23
    int minute = rand() % 60;      // Random minute from 0 to 59
    int second = rand() % 60;      // Random second from 0 to 59

    char datetime[20];
    snprintf(datetime, sizeof(datetime), "%04d-%02d-%02d %02d:%02d:%02d", year, month, day, hour, minute, second);
    return string(datetime);
}

int main() {
    ofstream file("insert_borrow_data.sql");

    if (!file.is_open()) {
        cerr << "Failed to open file for writing.\n";
        return 1;
    }

    srand(static_cast<unsigned int>(time(0)));

    int numUsers = 1000;  
    int numBooks = 1000;  

    for (int i = 1; i <= 1000; ++i) {
        int idUser = rand() % numUsers + 1; 
        int idBook = rand() % numBooks + 1; 

        string borrowDate = generateRandomDatetime();
        string expectedPayDate = generateRandomDatetime();
        string realPayDate = (rand() % 2 == 0) ? ("'" + generateRandomDatetime()+ "'") : "NULL"; 
        int price = rand() % 100 + 1; 
        file << "INSERT INTO Borrow (id_user, id_book, borrow_date, expected_pay_date, real_pay_date, price) VALUES ("
             << idUser << ", "
             << idBook << ", '"
             << borrowDate << "', '"
             << expectedPayDate << "', "
             << realPayDate << ", "
             << price << ");\n";
    }

    file.close();
    cout << "Insert statements generated and written to insert_borrow_data.sql\n";
    return 0;
}
