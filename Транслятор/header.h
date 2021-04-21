#ifndef HEADER_H
#define HEADER_H

#include <string>
#include <iostream>

using namespace std;

struct Instruction{
    uint32_t cmd :  5;
    uint32_t reg1:  5;
    uint32_t reg2:  5;
    uint32_t x   :  1;
    uint32_t data:  16;
};

class Variable{
public:
    string name;
    uint32_t addr;
    uint32_t elemNumber;
    uint32_t index;
    static uint32_t freeAddr;
    static uint32_t counter;

    uint32_t *dataPtr;
public:
    ~Variable(){
        delete []dataPtr;
    }
    void setVariable(string n, uint32_t en){
        name = n;
        addr = freeAddr;
        elemNumber = en;
        index = counter;
        dataPtr = new uint32_t[en];

        counter++;
        freeAddr += elemNumber;
    }
	void display(){
		cout<<"Variable: "<<name<<endl;
		cout<<"Addr: "<<addr<<endl;
        for(uint32_t i = 0; i < elemNumber; i++){
			cout<<"element "<<i<<": "<<dataPtr[i]<<";\n";
		}
		cout<<"freeAddr: "<<freeAddr<<endl;
	}

};

class Label{
public:
    string name;
    uint32_t addr;
    uint32_t index;
    static uint32_t counter;
public:

    void setLabel(string n, uint32_t a){
        name = n;
        addr = a;
        index = counter;
        counter++;
    }

};


uint32_t toFigure(string s);
uint32_t instructionConverter(Instruction i);

void mainProcedure();
void Reg2N0Data0(); //LD,ST,CPY,ADD,SUBSTR,AND,OR,XOR,BREQ
void Reg1N1Data0(); //ROTR,SHR
void Reg1N0Data1(); //LDIH,LDIL
void Reg1N0Data0(); //NOT,JMP

void romBuilder();
void translator();
void debugInfDisp(Instruction instruction);
string defineHandler();
void varHandler();
void labelHandler();

bool is_number(const std::string& s);
void simulatorBody(uint32_t cmd, string str);
void simulatorHead();
void simulatorEnd();

#endif // HEADER_H
