#include <bits/stdc++.h>
using namespace std;

string generateRandomString(int length)
{
    const string characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    string randomString;
    for (int i = 0; i < length; ++i)
    {
        randomString += characters[rand() % characters.length()];
    }
    return randomString;
}

string generateRandomBiography()
{
    return generateRandomString(rand() % 200 + 100);
}

string generateRandomNationality()
{
    vector<string> nationalities;
    nationalities.push_back("American");
    nationalities.push_back("British");
    nationalities.push_back("Canadian");
    nationalities.push_back("French");
    nationalities.push_back("German");
    nationalities.push_back("Italian");
    nationalities.push_back("Japanese");
    nationalities.push_back("Chinese");
    nationalities.push_back("Indian");
    nationalities.push_back("Russian");
    nationalities.push_back("Spanish");
    nationalities.push_back("Australian");
    nationalities.push_back("Brazilian");
    nationalities.push_back("South African");
    nationalities.push_back("Mexican");

    return nationalities[rand() % nationalities.size()];
}

string generateRandomDateOfBirth()
{
    int year = rand() % 60 + 1940;
    int month = rand() % 12 + 1;
    int day = rand() % 28 + 1;

    char date[11];
    snprintf(date, sizeof(date), "%04d-%02d-%02d", year, month, day);
    return string(date);
}

int main()
{
    ofstream file("insert_author_data.sql");

    srand(time(0));

    for (int i = 1; i <= 1000; ++i)
    {
        string name = generateRandomString(20);
        string dateOfBirth = generateRandomDateOfBirth();
        string biography = generateRandomBiography();
        string nationality = generateRandomNationality();

        file << "INSERT INTO Author (name, date_of_birth, biography, nationality) VALUES ('"
             << name << "', '"
             << dateOfBirth << "', '"
             << biography << "', '"
             << nationality << "');\n";
    }

    file.close();
}
