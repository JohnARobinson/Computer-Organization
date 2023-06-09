#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "validateInstruction.h"

#define NUM_INSTR ( sizeof(instrs) / sizeof(instr_t))

typedef enum {
    FMT_RTYPE, FMT_ITYPE, FMT_JTYPE
} encode_type_t;

typedef enum {
    PARSE_RTYPE, PARSE_ITYPE, PARSE_JTYPE, PARSE_JRTYPE, MEMTYPE, SHIFTY
} instr_type_t;

typedef struct instr_t {
    char *mnemonic;
    instr_type_t type;
    encode_type_t etype;
    int opcode;
    int function;
} *instr_t_pointer;

typedef struct {
    int last_state;
    struct instr_t instr;
    char *opcode;
    char *regs[3];
    char *immediate;
    char *shamt;
} parsed_t;

int find_opcode(const char *str, struct instr_t *instr)
{
    int i;
    for (i = 0; i < NUM_INSTR; i++) {
        if (strcmp(instrs[i].mnemonic, str) == 0) {
            *instr = instrs[i];
            return 0;
        }
    }
}

typedef struct r_type {
    unsigned int opcode = 0b000000;
    unsigned int rs:5;
    unsigned int rt:5;
    unsigned int rd:5;
    unsigned int shamt:5;
    unsigned int funct:6;
} r_type_instruction;

typedef struct i_type {
    unsigned int opcode:6;
    unsigned int rs:6;
    unsigned int rt:6;
    unsigned int imm:16;
} i_type_instruction;

typedef struct j_type {
    unsigned int opcode:6;
    unsigned int address:26;
} j_type_instruction;