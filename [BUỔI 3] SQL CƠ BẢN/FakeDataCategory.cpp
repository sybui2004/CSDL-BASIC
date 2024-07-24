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

string generateRandomDescription()
{
    return generateRandomString(rand() % 200 + 50);
}

int main()
{
    ofstream file("insert_category_data.sql");

    srand(time(0));

    for (int i = 1; i <= 1000; ++i)
    {
        string name = generateRandomString(10);
        string description = generateRandomDescription();

        file << "INSERT INTO Category (name, description) VALUES ('"
             << name << "', '"
             << description << "');\n";
    }

    file.close();
}
