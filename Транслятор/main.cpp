#include <iostream>
#include <string>
#include <fstream>
#include "header.h"
using namespace std;


uint16_t M0, M1, M2, M3;

Instruction instruction;

int posCmdEnd;
int posCmd;
int posR1, posR2;
int posR1End, posR2End;


string cmdStr, R1Str, R2Str;
uint8_t cmd, R1, R2;
uint16_t addr;

uint32_t instrCounter = 0;
uint32_t lineCounter = 0;
bool labelFlag = false;
bool ppFlag = false;
string s;
string s1;
string regArr[32];
Label labels[30];

Variable variables[50];
string varNames[50];

uint32_t Label::counter = 0;
uint32_t Variable::counter = 0;
uint32_t Variable::freeAddr = 0;

int main()
{

    translator();

    //romBuilder();

    return 0;
}





