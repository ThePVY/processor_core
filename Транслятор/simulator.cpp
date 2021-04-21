#include <string>
#include <iostream>
#include <fstream>
#include "header.h"


using namespace std;

extern string cmdStr, R1Str, R2Str;
extern ofstream outputCppFile;
extern Variable variables[50];
extern string varNames[50];
extern uint32_t instrCounter;
extern uint32_t lineCounter;

void simulatorBody(uint32_t cmd, string str = "00"){
    uint32_t en;
    outputCppFile<<"//line: "<<lineCounter << "   cmd: "<< instrCounter << "\n";
    switch(cmd){
        case 0:		outputCppFile<<"\t"<<R1Str<<" = "<<R2Str<<";\n";
                    break;
        case 1:		outputCppFile<<"\t"<<R1Str<<" = "<<R2Str<<";\n";
                    break;
        case 2:		outputCppFile<<"\t"<<R1Str<<" = ("<<R2Str<<" << 16)"<<";\n";
                    break;
        case 3:		if(is_number(R2Str) || (R2Str[0]=='0' && R2Str[1]=='x')){
                        outputCppFile<<"\t"<<R1Str<<" = "<<R2Str<<";\n";
                    }else{
                        for(uint32_t i = 0; i < Variable::counter; i++){
                            if(R2Str == varNames[i]){
                                en = variables[i].elemNumber;
                            }
                        }
                        if(en == 1){
                            outputCppFile<<"\t"<<R1Str.substr(1)<<" = &"<<R2Str<<";\n";
                        }else{
                            outputCppFile<<"\t"<<R1Str.substr(1)<<" = "<<R2Str<<";\n";
                        }
                    }
                    break;
        case 4:		if(R1Str[0]=='*'){
                        outputCppFile<<"\t"<<R1Str.substr(1)<<" = "<<R2Str.substr(1)<<";\n";
                    }else{
                        outputCppFile<<"\t"<<R1Str<<" = "<<R2Str<<";\n";
                    }
                    break;
        case 5:		if(R1Str[0]=='*'){
                        outputCppFile<<"\t"<<R1Str.substr(1)<<" += "<<R2Str<<";\n";
                    }else{
                        outputCppFile<<"\t"<<R1Str<<" += "<<R2Str<<";\n";
                    }
                    break;
        case 6:		if(R1Str[0]=='*'){
                        outputCppFile<<"\t"<<R1Str.substr(1)<<" -= "<<R2Str<<";\n";
                    }else{
                        outputCppFile<<"\t"<<R1Str<<" -= "<<R2Str<<";\n";
                    }
                    break;
        case 7:		outputCppFile<<"\t"<<R1Str<<" &= "<<R2Str<<";\n";
                    break;
        case 8:		outputCppFile<<"\t"<<R1Str<<" |= "<<R2Str<<";\n";
                    break;
        case 9:		outputCppFile<<"\t"<<R1Str<<" ^= "<<R2Str<<";\n";
                    break;
        case 10:	outputCppFile<<"\t"<<R1Str<<" = rotr("<<R1Str<<","<<R2Str<<");\n";
                    break;
        case 11:	outputCppFile<<"\t"<<R1Str<<" = "<<R1Str<<" >> "<<R2Str<<";\n";
                    break;
        case 12:	outputCppFile<<"\t"<<R1Str<<" = ~"<<R1Str<<";\n";
                    break;
        case 13:	outputCppFile<<"\t"<<"goto "<<R1Str<<";\n";
                    break;
        case 14:	outputCppFile<<"\t"<<"if("<<R1Str<<"== 0){\n\t\t goto "<<R2Str<<";\n\t}\n";
                    break;
        case 102:	outputCppFile<< "\t"<<cmdStr <<"\n";
                    break;
        case 100:	outputCppFile<< "uint32_t " << str <<";\n";
                    break;

    }
}

void simulatorHead(){
    outputCppFile<<"#include <iostream>\n"<< "using namespace std;\n"<<"\n";
    outputCppFile<<"uint32_t rotr(uint32_t i, uint32_t n){\n\t"<<"return( (i>>n)|(i<<(32-n)) );"<<"\n}\n\n";
    outputCppFile<<"void simulator(){"<<"\n";
}

void simulatorEnd(){
    outputCppFile<<"cout.unsetf(ios::dec);\n"<<"cout.setf(ios::hex);"<<"\n";
    outputCppFile<<"cout<< \"hash:\" << endl;"<<"\n";
    outputCppFile<<"cout<<"<< "\"0: \" << h0 << endl;"<<"\n";
    outputCppFile<<"cout<<"<< "\"1: \" << h1 << endl;"<<"\n";
    outputCppFile<<"cout<<"<< "\"2: \" << h2 << endl;"<<"\n";
    outputCppFile<<"cout<<"<< "\"3: \" << h3 << endl;"<<"\n";
    outputCppFile<<"cout<<"<< "\"4: \" << h4 << endl;"<<"\n";
    outputCppFile<<"cout<<"<< "\"5: \" << h5 << endl;"<<"\n";
    outputCppFile<<"cout<<"<< "\"6: \" << h6 << endl;"<<"\n";
    outputCppFile<<"cout<<"<< "\"7: \" << h7 << endl;"<<"\n";
    outputCppFile<<"cout<<"<< "endl;"<<"\n";
    outputCppFile<<"cout<<"<< "\"total: \" << h0<<h1<<h2<<h3<<h4<<h5<<h6<<h7<<endl;"<<"\n";
    outputCppFile<<"\n"<< "}"<<"\n";
}










