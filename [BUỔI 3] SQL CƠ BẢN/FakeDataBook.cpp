#include <bits/stdc++.h>
using namespace std;

string generateRandomString(int length) {
    const string characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    string randomString;
    for (int i = 0; i < length; ++i) {
        randomString += characters[rand() % characters.length()];
    }
    return randomString;
}

string generateRandomSummary() {
    return generateRandomString(rand() % 200 + 50);
}

string generateRandomISBN() {
    string isbn;
    for (int i = 0; i < 13; ++i) {
        if (i == 3 || i == 5 || i == 8) {
            isbn += '-';
        } else {
            isbn += '0' + (rand() % 10);
        }
    }
    return isbn;
}

string generateRandomDate() {
    int year = rand() % 50 + 1970;
    int month = rand() % 12 + 1;  
    int day = rand() % 28 + 1;    

    char date[11];
    snprintf(date, sizeof(date), "%04d-%02d-%02d", year, month, day);
    return string(date);
}

int main() {
    ofstream file("insert_book_data.sql");

    srand(time(0));

    for (int i = 1; i <= 1000; ++i) {
        string title = generateRandomString(20); 
        string summary = generateRandomSummary();
        string publicDate = generateRandomDate();
        string isbn = generateRandomISBN();

        file << "INSERT INTO Book (title, summary, public_date, isbn) VALUES ('"
             << title << "', '"
             << summary << "', '"
             << publicDate << "', '"
             << isbn << "');\n";
    }

    file.close();
}
