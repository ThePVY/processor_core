#include <string>
#include <iostream>
#include <fstream>
#include "header.h"
#include <algorithm>

using namespace std;

extern Label labels[30];


extern Instruction instruction;

extern int posCmdEnd;
extern int posCmd;
extern int posR1, posR2;
extern int posR1End, posR2End;


extern string cmdStr, R1Str, R2Str;
extern uint8_t cmd, R1, R2;
extern uint16_t addr;

extern uint32_t instrCounter;
extern uint32_t lineCounter;
extern bool labelFlag;
extern bool ppFlag;
extern string s;
extern string s1;
extern string regArr[32];
extern Variable variables[50];
extern string varNames[50];

ofstream outputFile;
ofstream outputCppFile;
ifstream assemblerFile;

bool is_number(const std::string& s)
{
    return !s.empty() && std::find_if(s.begin(),
        s.end(), [](char c) { return !std::isdigit(c); }) == s.end();
}

uint32_t toFigure(string str){
    if(str == "R0" || str == regArr[0])	return 0;
    else if(str == "R1" || str == regArr[1]) return 1;
    else if(str == "R2" || str == regArr[2]) return 2;
    else if(str == "R3" || str == regArr[3]) return 3;
    else if(str == "R4" || str == regArr[4]) return 4;
    else if(str == "R5" || str == regArr[5]) return 5;
    else if(str == "R6" || str == regArr[6]) return 6;
    else if(str == "R7" || str == regArr[7]) return 7;
    else if(str == "R8" || str == regArr[8]) return 8;
    else if(str == "R9" || str == regArr[9]) return 9;
    else if(str == "R10" || str == regArr[10]) return 10;
    else if(str == "R11" || str == regArr[11]) return 11;
    else if(str == "R12" || str == regArr[12]) return 12;
    else if(str == "R13" || str == regArr[13]) return 13;
    else if(str == "R14" || str == regArr[14]) return 14;
    else if(str == "R15" || str == regArr[15]) return 15;
    else if(str == "R16" || str == regArr[16]) return 16;
    else if(str == "R17" || str == regArr[17]) return 17;
    else if(str == "R18" || str == regArr[18]) return 18;
    else if(str == "R19" || str == regArr[19]) return 19;
    else if(str == "R20" || str == regArr[20]) return 20;
    else if(str == "R21" || str == regArr[21]) return 21;
    else if(str == "R22" || str == regArr[22]) return 22; //0b10110
    else if(str == "R23" || str == regArr[23]) return 23;
    else if(str == "R24" || str == regArr[24]) return 24;
    else if(str == "R25" || str == regArr[25]) return 25;
    else if(str == "R26" || str == regArr[26]) return 26;
    else if(str == "R27" || str == regArr[27]) return 27;
    else if(str == "R28" || str == regArr[28]) return 28;
    else if(str == "R29" || str == regArr[29]) return 29;
    else if(str == "R30" || str == regArr[30]) return 30;
    else if(str == "R31" || str == regArr[31]) return 31;
    else if(str == labels[0].name) return labels[0].addr;
    else if(str == labels[1].name) return labels[1].addr;
    else if(str == labels[2].name) return labels[2].addr;
    else if(str == labels[3].name) return labels[3].addr;
    else if(str == labels[4].name) return labels[4].addr;
    else if(str == labels[5].name) return labels[5].addr;
    else if(str == labels[6].name) return labels[6].addr;
    else if(str == labels[7].name) return labels[7].addr;
    else if(str == labels[8].name) return labels[8].addr;
    else if(str == labels[9].name) return labels[9].addr;
    else if(str == labels[10].name) return labels[10].addr;
    else if(str == labels[11].name) return labels[11].addr;
    else if(str == labels[12].name) return labels[12].addr;
    else if(str == labels[13].name) return labels[13].addr;
    else if(str == labels[14].name) return labels[14].addr;
    else {
        //cout<<"Unnown Register or LABEL: "<< str <<" on line: "<< lineCounter <<"  cmd: " << cmdStr << ";" <<"\n";
        return 31;
    }
}


string defineHandler(){
    uint32_t n;
    string tmpStr, str;

    posR1 = s.find_first_not_of(" \t",posCmdEnd);
    posR1End = s.find_first_of(" =\t", posR1);
    str = s.substr(posR1,posR1End-posR1);

    posR2 = s.find_first_not_of(" =\t", posR1End);
    posR2End = s.find_first_not_of(" \t\n",posR1End);
    tmpStr = s.substr(posR2+1,posR2End-posR2); //posR2+1 чтобы получить только номер регистра
    n = stoi(tmpStr);

    regArr[n] = str;
    //cout<<"define register: " << regArr[n] << "; " << endl;

    ppFlag = true;

    return regArr[n];
}

void Reg2N0Data0(){
    posR1 = s.find_first_not_of(" \t",posCmdEnd);
    posR1End = s.find_first_of(" ,", posR1);

    R1Str = s.substr(posR1,posR1End-posR1);
    R1 = toFigure(R1Str);
    posR2 = s.find_first_not_of(" ,",posR1End);
    posR2End = s.find(' ',posR2);
    R2Str = s.substr(posR2,posR2End-posR2);
    if(cmdStr == "BREQ"){
        addr = toFigure(R2Str);
        instruction.cmd = cmd;
        instruction.reg1 = R1;
        instruction.reg2 = 0;
        instruction.x = 0;
        instruction.data = addr;
    }else{
        R2 = toFigure(R2Str);
        instruction.cmd = cmd;
        instruction.reg1 = R1;
        instruction.reg2 = R2;
        instruction.x = 0;
        instruction.data = 0;
    }
}
void Reg1N1Data0(){
    posR1 = s.find_first_not_of(" \t",posCmdEnd);
    posR1End = s.find_first_of(" ,", posR1);
    R1Str = s.substr(posR1,posR1End-posR1);
    R1 = toFigure(R1Str);
    posR2 = s.find_first_not_of(" ,",posR1End);
    posR2End = s.find(' ',posR2);
    R2Str = s.substr(posR2,posR2End-posR2);
    R2 = stoi(R2Str);
    instruction.cmd = cmd;
    instruction.reg1 = R1;
    instruction.reg2 = R2;
    instruction.x = 0;
    instruction.data = 0;
}
void Reg1N0Data1(){
    int pos0,pos1;
    string s0,s1;
    posR1 = s.find_first_not_of(" \t",posCmdEnd);
    posR1End = s.find_first_of(" ,", posR1);
    R1Str = s.substr(posR1,posR1End-posR1);
    R1 = toFigure(R1Str);
    posR2 = s.find_first_not_of(" ,",posR1End);
    posR2End = s.find('\n',posR2);
    R2Str = s.substr(posR2,posR2End-posR2);
	
	uint32_t index;
    uint32_t shift = 0;
	if(cmdStr == "BREQ"){
        pos0 = R2Str.find_first_of(" \t\n",0);
        addr = toFigure(R2Str.substr(0,pos0));
	}else if(R2Str[0] == '0' && R2Str[1] == 'x'){
        //R2Str.erase(0,2);
        addr = stoi(R2Str.substr(2), 0 ,16);
	}else if(is_number(R2Str)){
		addr = stoi(R2Str);	
    }else if(~R2Str.find('+')){
        pos0 = R2Str.find('+');
        s0 = R2Str.substr(0,pos0-1);
        pos1 = s0.find_first_of(" \t");
        s0 = s0.substr(0,pos1-1);//s0 содержит имя переменной
        //cout<<"Variable: "<<s0<<";\n";
        pos1 = R2Str.find_first_of("1234567890", pos0);
        pos0 = R2Str.find_first_of(" \t\n",pos1);
        s1 = R2Str.substr(pos1, pos0 - pos1);//содержит число (номер нужного элемента)
        //cout<<"Number: "<<s1<<";\n";
        for(uint32_t i = 0; i < Variable::counter; i++){
            if(varNames[i] == s0){
                index = i;
            }
        }
        //cout<<"Index: "<<index<<";\n";
        shift = stoi(s1);
        addr = variables[index].addr + shift;
        //cout<<"addr: "<<addr<<";\n";
    }else{
        for(uint32_t i = 0; i < Variable::counter; i++){
			if(varNames[i] == R2Str){
				index = i;
			}
		}
		//нашли нашу переменную
        addr = variables[index].addr;
	}
	
	
	
    instruction.cmd = cmd;
    instruction.reg1 = R1;
    instruction.reg2 = 0;
    instruction.x = 0;
    instruction.data = addr;
}

void Reg1N0Data0(){
    posR1 = s.find_first_not_of(" \t",posCmdEnd);
    posR1End = s.find_first_of(" \n", posR1);
    R1Str = s.substr(posR1,posR1End-posR1);
    if(cmdStr == "NOT"){
        R1 = toFigure(R1Str);
        instruction.cmd = cmd;
        instruction.reg1 = R1;
        instruction.reg2 = 0;
        instruction.x = 0;
        instruction.data = 0;
    }else if(cmdStr == "JMP"){
        addr = toFigure(R1Str);
        instruction.cmd = cmd;
        instruction.reg1 = 0;
        instruction.reg2 = 0;
        instruction.x = 0;
        instruction.data = addr;
    }
}
void labelHandler(){
    uint32_t tmp, tmp1;
    uint32_t en;
    string name, tmpStr, str;

    posR1 = s.find_first_not_of(" \t",posCmdEnd);
    posR1End = s.find_first_of(" =\t", posR1);
    str = s.substr(posR1,posR1End-posR1);

    tmp = str.find_first_of("[");
    name = str.substr(0, tmp);
    tmp1 = str.find_first_of("]");
    tmpStr = str.substr(tmp+1,tmp1 - tmp - 1);
    en = stoi(tmpStr);

    if((~s.find_first_of(","))){
        instrCounter += 5*en;
    }else{
        instrCounter += 1+2*en;
    }
    ppFlag = true;
}

void varHandler(){
    uint32_t tmp, tmp1;
    uint32_t en;
    string name, tmpStr, str;
    Variable var;
    Instruction instr;
    uint32_t i = 0;
	
    posR1 = s.find_first_not_of(" \t",posCmdEnd);
    posR1End = s.find_first_of(" =\t", posR1);
    str = s.substr(posR1,posR1End-posR1);

    tmp = str.find_first_of("[");
    name = str.substr(0, tmp);
    tmp1 = str.find_first_of("]");
    tmpStr = str.substr(tmp+1,tmp1 - tmp - 1);
    en = stoi(tmpStr);
	
    var.setVariable(name,en);
    tmp = s.find_first_of("{");
    tmpStr = s.substr(tmp + 1);
    //cout<<"tmpStr: "<<tmpStr<<";"<<endl;

    if(en == 1){
        if(cmd == 101){
            outputCppFile<<"uint32_t "<< name << " = ";
        }
    }

    bool breakFlag = false;
    if(en!=1 && (~tmpStr.find("}")) && !(~tmpStr.find(",")) ){
        tmp = tmpStr.find_first_not_of(" \t");
        tmp1 = tmpStr.find_first_of("}");
        str = tmpStr.substr(tmp, tmp1 - tmp - 1);
        if(str[0] == '0' && str[1] == 'x'){
            str.erase(0,2);
            tmp1 = stoll(str, 0 ,16);
        }else{
            tmp1 = stoll(str);
        }


        //LDIL
        instr.cmd = 3;
        instr.reg1 = 1;
        instr.reg2 = 0;
        instr.x = 0;
        instr.data = (uint16_t)(tmp1 & 0xFFFF);
        tmp = instructionConverter(instr);
        debugInfDisp(instr);
        outputFile << tmp << "\n";
        instrCounter++;
        for(uint32_t i = 0; i < en; i++){
            var.dataPtr[i] = tmp1;
            //LDIL
            instr.cmd = 3;
            instr.reg1 = 2;
            instr.reg2 = 0;
            instr.x = 0;
            instr.data = var.addr + i;
            tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
            //ST
            instr.cmd = 1;
            instr.reg1 = 1;
            instr.reg2 = 2;
            instr.x = 0;
            instr.data = 0;
            tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
        }
        breakFlag = true;
        outputCppFile<<"uint32_t "<< name <<"["<< en <<"]"<<" = {"  << tmpStr << ";\n";
    }

    if(!breakFlag && (en != 1)){
        outputCppFile<<"uint32_t "<< name <<"["<< en <<"]"<<" = {"  << tmpStr << "\n";
    }

    i = 0;
	while(true){
        if(breakFlag) break;
		if(~tmpStr.find_first_of(",")){
            //cout<<"In IF"<<endl;
			tmp = tmpStr.find_first_not_of(" \t");
            tmp1 = tmpStr.find_first_of(",");
            str = tmpStr.substr(tmp, tmp1 - tmp);
            tmp = str.find_first_not_of(" \t",0);
            tmp1 = str.find_first_of(" \t\n",tmp);
            str = str.substr(tmp,tmp1 - tmp);
            //cout<<"str: "<<str<<";"<<endl;
			if(str[0] == '0' && str[1] == 'x'){
                str.erase(0,2);
                var.dataPtr[i] = stoll(str, 0 ,16);
			}else{
                var.dataPtr[i] = stoll(str);
			}
            tmp = tmpStr.find_first_of(",");
            tmpStr.erase(0,tmp+1);
            //cout<<"tmpStr: " << tmpStr << ";\n";
			//LDIL
			instr.cmd = 3;
			instr.reg1 = 1;
			instr.reg2 = 0;
			instr.x = 0;
			instr.data = (uint16_t)(var.dataPtr[i] & 0xFFFF);
            //cout<<(uint16_t)(var.dataPtr[i] & 0xFFFF)<<endl;

			tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
			//LDIH
			instr.cmd = 2;
			instr.reg1 = 2;
			instr.reg2 = 0;
			instr.x = 0;
			instr.data = (uint16_t)(var.dataPtr[i] >> 16);

			tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
			//OR
			instr.cmd = 8;
			instr.reg1 = 1;
			instr.reg2 = 2;
			instr.x = 0;
			instr.data = 0;

			tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
			//LDIL
			instr.cmd = 3;
			instr.reg1 = 2;
			instr.reg2 = 0;
			instr.x = 0;
			instr.data = var.addr + i;

			tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
			//ST
			instr.cmd = 1;
			instr.reg1 = 1;
			instr.reg2 = 2;
			instr.x = 0;
			instr.data = 0;

			tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
            i++;
		}else if(~tmpStr.find_first_of("}")){
            //cout<<"In ELSE IF"<<endl;
            if(en == 1){
                outputCppFile<<tmpStr.substr(0,tmpStr.length()-2)<<";\n";
            }else{
                outputCppFile<<";\n";
            }
            str = tmpStr.substr(0, tmpStr.length()-1 );
            tmp = str.find_first_not_of(" \t",0);
            tmp1 = str.find_first_of(" \t\n",tmp);
            str = str.substr(tmp,tmp1 - tmp);
            //cout<<"str: "<<str<<";"<<endl;
			if(str[0] == '0' && str[1] == 'x'){
				str.erase(0,2);
                var.dataPtr[i] = stoll(str, 0 ,16);
			}else{
                var.dataPtr[i] = stoll(str);
			}
			//LDIL
			instr.cmd = 3;
			instr.reg1 = 1;
			instr.reg2 = 0;
			instr.x = 0;
			instr.data = (uint16_t)(var.dataPtr[i] & 0xFFFF);
            //cout<<(uint16_t)(var.dataPtr[i] & 0xFFFF)<<endl;
			tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
			//LDIH
			instr.cmd = 2;
			instr.reg1 = 2;
			instr.reg2 = 0;
			instr.x = 0;
			instr.data = (uint16_t)(var.dataPtr[i] >> 16);

			tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
			//OR
			instr.cmd = 8;
			instr.reg1 = 1;
			instr.reg2 = 2;
			instr.x = 0;
			instr.data = 0;

			tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
			//LDIL
			instr.cmd = 3;
			instr.reg1 = 2;
			instr.reg2 = 0;
			instr.x = 0;
			instr.data = var.addr + i;

            //cout<<"instr.data: "<<instr.data<<endl;
			tmp = instructionConverter(instr);
            //cout<<"tmp: "<<tmp<<endl;
            //cout<<"i: "<<i<<endl;
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
			//ST
			instr.cmd = 1;
			instr.reg1 = 1;
			instr.reg2 = 2;
			instr.x = 0;
			instr.data = 0;

			tmp = instructionConverter(instr);
            debugInfDisp(instr);
            outputFile << tmp << "\n";
            instrCounter++;
            i++;
			break;
		}else{
            //cout<<"In ELSE"<<endl;
			getline(assemblerFile,tmpStr);
            lineCounter++;
            if( !(~tmpStr.find_first_of("}")) ){
                outputCppFile<<tmpStr<<"\n";
            }else{
                outputCppFile<<tmpStr;
            }

            //cout<<"tmpStr: " << tmpStr << ";\n";
        }
    }
    variables[Variable::counter - 1] = var;
	varNames[Variable::counter - 1] = var.name;

    //variables[Variable::counter - 1].display();
    ppFlag = true;

}



void mainProcedure(){
    string tmpStr;
    if(cmdStr == "LD"){
        cmd = 0;
        Reg2N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "ST"){
        cmd = 1;
        Reg2N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "LDIH"){
        cmd = 2;
        Reg1N0Data1();
        simulatorBody(cmd,"");
    }else if(cmdStr == "LDIL"){
        cmd = 3;
        Reg1N0Data1();
        simulatorBody(cmd,"");
    }else if(cmdStr == "CPY"){
        cmd = 4;
        Reg2N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "ADD"){
        cmd = 5;
        Reg2N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "SUBSTR"){
        cmd = 6;
        Reg2N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "AND"){
        cmd = 7;
        Reg2N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "OR"){
        cmd = 8;
        Reg2N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "XOR"){
        cmd = 9;
        Reg2N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "ROTR"){
        cmd = 10;
        Reg1N1Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "SHR"){
        cmd = 11;
        Reg1N1Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "NOT"){
        cmd = 12;
        Reg1N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "JMP"){
        cmd = 13;
        Reg1N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == "BREQ"){
        cmd = 14;
        Reg2N0Data0();
        simulatorBody(cmd,"");
    }else if(cmdStr == ".define"){
        cmd = 100;
        tmpStr = defineHandler();
        simulatorBody(cmd, tmpStr);
    }else if(cmdStr == ".var"){
        cmd = 101;
        varHandler();
    }else if(cmdStr[cmdStr.length()-1] == ':'){
        cmd = 102;
		labelFlag = true;
        simulatorBody(cmd,"");
    }
}

uint32_t instructionConverter(Instruction i){
    uint32_t s = 0;
    //cout<<"instructionConverter START"<<endl;
    if(cmdStr == "ST"){
        s |= i.cmd;
        s |= i.reg2 << 5;
        s |= i.reg1 << 10;
        s |= i.data << 16;
        //cout<<"instructionConverter END"<<endl;
        return s;
    }else{
        s |= i.cmd;
        //cout<<"s |= i.cmd;        => "<< s <<endl;
        s |= i.reg1 << 5;
        //cout<<"s |= i.reg1 << 5;  => "<< s <<endl;
        s |= i.reg2 << 10;
        //cout<<"s |= i.reg2 << 10; => "<< s <<endl;
        s |= i.data << 16;
        //cout<<"s |= i.data << 16; => "<< s <<endl;
        //cout<<"instructionConverter END"<<endl;
        return s;
    }
}



void romBuilder(){
    uint32_t lineCounter = 0;
    string s;

    ifstream instructions("D:\\WorkDir\\Processor\\tst_Instructions.txt");
    ofstream outputFile1;

    outputFile1.open("D:\\Documents\\quartus\\MainPrj\\ROM.sv");
    outputFile1.close();//чтобы файл предварительно очистился

    outputFile1.open("D:\\Documents\\quartus\\MainPrj\\ROM.sv",ios_base::app);

    outputFile1 << "module ROM(input logic [10:0]adr," << "\n";
    outputFile1 << "            output logic[31:0]dout);" << "\n\n";
    outputFile1 << "always_comb begin" << "\n";
    outputFile1 << "    case(adr)" << "\n";

    while(getline(instructions,s)){

            outputFile1 << "        11'd" << lineCounter << ":    dout <= 32'd" << s << ";" << "\n";
            lineCounter++;
        }
        outputFile1 << "        default:    dout <= 32'h1F;" << "\n";
        outputFile1 << "    endcase" << "\n";
        outputFile1 << "end " << "\n";
        outputFile1 << "endmodule " << "\n";

    instructions.close();
    outputFile1.close();
}





void translator(){
    uint32_t tmp;
    instrCounter = 0;

    assemblerFile.open("D:\\WorkDir\\Processor\\tst_Code.txt");


    outputFile.open("D:\\WorkDir\\Processor\\debugInstruction.txt");
    outputFile.close();//чтобы файл предварительно очистился
    outputFile.open("D:\\WorkDir\\Processor\\debugInstruction.txt",ios_base::app);

    outputCppFile.open("D:\\Documents\\QT\\SimulatorVerify\\tst_simulator.cpp");
    outputCppFile.close();//чтобы файл предварительно очистился
    outputCppFile.open("D:\\Documents\\QT\\SimulatorVerify\\tst_simulator.cpp",ios_base::app);


    while(getline(assemblerFile,s)){
        lineCounter++;
        if(s == "") continue;
        if(s[0]=='/') continue;
        posCmd = s.find_first_not_of(" \t");
        posCmdEnd = s.find_first_of(" \t\n",posCmd);
        cmdStr = s.substr(posCmd,posCmdEnd-posCmd);
        if(cmdStr == ".define"){
            continue;
        }
        if(cmdStr == ".var"){
            labelHandler();
        }
        if(ppFlag){
            ppFlag = false;
            continue;
        }
        if( cmdStr[cmdStr.length()-1] == ':' ){
            labelFlag = true;
            labels[Label::counter].setLabel(cmdStr.substr(0,cmdStr.length()-1), instrCounter);
        }else instrCounter++; 
        if(labelFlag){
            labelFlag = false;
            cout<<"Skip LABEL "<< s <<";  Label points at instruction " << labels[Label::counter-1].addr << "\n";
            continue;
        }

    }
    instrCounter = 0;
    lineCounter = 0;
    assemblerFile.clear();
    assemblerFile.seekg(0,ios_base::beg);

    simulatorHead();

    while(getline(assemblerFile,s)){
        lineCounter++;
        if(s == "") continue;
        if(s[0]=='/') continue;
        posCmd = s.find_first_not_of(" \t");
        posCmdEnd = s.find_first_of(" \t\n",posCmd);
        cmdStr = s.substr(posCmd,posCmdEnd-posCmd);

        mainProcedure();
        if(ppFlag){
            ppFlag = false;
            continue;
        }
        if(labelFlag){
            labelFlag = false;
            continue;
        }

        tmp = instructionConverter(instruction);
        //отладочная информация
        debugInfDisp(instruction);
        outputFile << tmp << "\n";

        instrCounter++;
    }
    cout << "loop ended" << "\n";

    simulatorEnd();

    assemblerFile.close();
    outputFile.close();
    outputCppFile.close();
}

void debugInfDisp(Instruction instruction){
    string cmdStr;
    switch(instruction.cmd){
        case 0:     cmdStr = "LD";
                    break;
        case 1:     cmdStr = "ST";
                    break;
        case 2:     cmdStr = "LDIH";
                    break;
        case 3:     cmdStr = "LDIL";
                    break;
        case 4:     cmdStr = "CPY";
                    break;
        case 5:     cmdStr = "ADD";
                    break;
        case 6:     cmdStr = "SUBSTR";
                    break;
        case 7:     cmdStr = "AND";
                    break;
        case 8:     cmdStr = "OR";
                    break;
        case 9:     cmdStr = "XOR";
                    break;
        case 10:    cmdStr = "ROTR";
                    break;
        case 11:    cmdStr = "SHR";
                    break;
        case 12:    cmdStr = "NOT";
                    break;
        case 13:    cmdStr = "JMP";
                    break;
        case 14:    cmdStr = "BREQ";
                    break;

    }
    outputFile << "Command: " << instrCounter << ": " << cmdStr << "; line: " << lineCounter << "\n";
    outputFile << "cmd: " << instruction.cmd <<"; Reg1: " << instruction.reg1;
    outputFile << "; Reg2: " << instruction.reg2 << "; data: " << instruction.data << "\n";
}

