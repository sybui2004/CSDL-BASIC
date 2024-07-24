#include <bits/stdc++.h>
using namespace std;

string generateRandomString(int length)
{
    string characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    string randomString;
    for (int i = 0; i < length; ++i)
    {
        randomString += characters[rand() % characters.length()];
    }
    return randomString;
}

string generateRandomEmail()
{
    string email = generateRandomString(8) + "@example.com";
    return email;
}

string generateRandomDatetime()
{
    int year = 2017;
    int month = 9;
    int day = rand() % 30 + 1;
    int hour = rand() % 24;
    int minute = rand() % 60;
    int second = rand() % 60;

    char datetime[20];
    snprintf(datetime, sizeof(datetime), "%04d-%02d-%02d %02d:%02d:%02d", year, month, day, hour, minute, second);
    return string(datetime);
}

int main()
{
    ofstream file("insert_user_data.sql");

    srand(time(0));

    for (int i = 1; i <= 1000; ++i)
    {
        string name = generateRandomString(10);
        string password = generateRandomString(10);
        string email = generateRandomEmail();
        string createdAt = generateRandomDatetime();

        file << "INSERT INTO [User] (name, password, email, created_at) VALUES ('"
             << name << "', '"
             << password << "', '"
             << email << "', '"
             << createdAt << "');\n";
    }

    file.close();
}
