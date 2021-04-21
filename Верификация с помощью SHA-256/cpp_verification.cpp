#include "stdint.h"
#include "iostream"
#include "simulator.h"
#include <fstream>

using namespace std;

// Функция циклического сдвига вправо
uint32_t rotr(uint32_t data, int n)
{
    return (data >> n) | (data << (32 - n));
}


void CPP_verification()
{
    ofstream outputFile;
    outputFile.open("D:\\WorkDir\\Processor\\hash.txt");
    outputFile.close();//чтобы файл предварительно очистился
    outputFile.open("D:\\WorkDir\\Processor\\hash.txt",ios_base::app);

    //Инициализация констант
    uint32_t h0 = 0x6A09E667, h1 = 0xBB67AE85, h2 = 0x3C6EF372, h3 = 0xA54FF53A,
             h4 = 0x510E527F, h5 = 0x9B05688C, h6 = 0x1F83D9AB, h7 = 0x5BE0CD19;

    uint32_t k[64] = { 0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1, 0x923F82A4, 0xAB1C5ED5,
                       0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3, 0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174,
                       0xE49B69C1, 0xEFBE4786, 0x0FC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA,
                       0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147, 0x06CA6351, 0x14292967,
                       0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13, 0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85,
                       0xA2BFE8A1, 0xA81A664B, 0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070,
                       0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A, 0x5B9CCA4F, 0x682E6FF3,
                       0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208, 0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2 };

    //Ввод сообщения (до 31 бита) (до 2147483647)
    uint32_t message = 1;
    cout << "input message" << endl << message << endl;

    //Преобразование исходного сообщения
    uint32_t w[64] = { 0 };
    w[15] = 1;
    w[0] = 0xC0000000;




    //Генерация дополнительных 48-ми слов
    uint32_t s0, s1;
    for (int i = 16; i <= 63; i++)
    {
        s0 = rotr(w[i - 15], 7) ^ rotr(w[i - 15], 18) ^ (w[i - 15] >> 3);
        s1 = rotr(w[i - 2], 17) ^ rotr(w[i - 2], 19) ^ (w[i - 2] >> 10);
        w[i] = w[i - 16] + s0 + w[i - 7] + s1;
    }

    //Инициализация вспомогательных переменных
    uint32_t a = h0, b = h1, c = h2, d = h3, e = h4, f = h5, g = h6, h = h7;

    //Основной цикл
    uint32_t sigma0, sigma1, Ma, t1, t2, Ch;
    for (int i = 0; i <= 63; i++)
    {
        sigma0 = rotr(a, 2) ^ rotr(a, 13) ^ rotr(a, 22);
        Ma = (a&b) ^ (a&c) ^ (b&c);
        t2 = sigma0 + Ma;
        sigma1 = rotr(e, 6) ^ rotr(e, 11) ^ rotr(e, 25);
        Ch = (e&f) ^ ((~e)&g);
        t1 = h + sigma1 + Ch + k[i] + w[i];
        h = g; g = f; f = e; e = d + t1; d = c; c = b; b = a; a = t1 + t2;
    }

    //Определяем хеш
    h0 = h0 + a; h1 = h1 + b; h2 = h2 + c; h3 = h3 + d;
    h4 = h4 + e; h5 = h5 + f; h6 = h6 + g; h7 = h7 + h;
    cout << "output hash" << endl << hex << h0 << " " << h1 << " " << h2 << " "
         << h3 << " " << h4 << " " << h5 << " " << h6 << " " << h7 << " " << endl;
    outputFile << "output hash" << endl << hex << h0 << " " << h1 << " " << h2 << " "
         << h3 << " " << h4 << " " << h5 << " " << h6 << " " << h7 << " " << endl;

    outputFile.close();
}
