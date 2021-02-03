// Test program to verify my circuit for ECE 582
#include "stdio.h"
#define TEST_CYCLES 8 * 6

_Bool JKFF(_Bool J,_Bool K, _Bool Q);
int circuit(int input);
int circuit_modified(int input);

int main() {
    int S1[TEST_CYCLES] = {};   //Store each state, array
    int S2[TEST_CYCLES] = {};   //Store each state, array

    for (int i = 0; i < TEST_CYCLES; i++){
        printf("Input Bits: %x", (i & (1<<2)));
        printf(" %x", (i & (1<<1)));
        printf(" %x :: ", (i & 1));

        S1[i] = circuit(i);
        printf("S1 Bits: %x", S1[i] & (1<<1));
        printf(" %x\n", (S1[i] & 1));
        
    }
    printf("\n");   //Newline for clarity

    for (int i = 0; i < TEST_CYCLES; i++){
        printf("Input Bits: %x", (i & (1<<2)));
        printf(" %x", (i & (1<<1)));
        printf(" %x :: ", (i & 1));

        S2[i] = circuit_modified(i);
        printf("S2 Bits: %x", S2[i] & (1<<1));
        printf(" %x\n", (S2[i] & 1));
    }
    printf("\n");   //Newline for clarity 

    //Do an equivalence simulation for S1 and S2 at each state on the output
    for (int i = 0; i < TEST_CYCLES; i++){
        printf("Equivalence Simulation for S1 ^ S2: %x\n", S1[i] ^ S2[i]);
    }

    printf("\n");

    // P = S1 x S2
    printf("There are %d * %d number of sets of the cartesian product of S1 x S2 \nWith a focus on S1(x) as bit 1 S2(y) as bit 0\n", TEST_CYCLES, TEST_CYCLES);
    for (int i = 0; i < TEST_CYCLES; i++){
        printf("\nGrouping %d\n", i);   //Seperate each clump of inputs
        for (int j = 0; j < TEST_CYCLES; j++){
            printf("P = S1 x S2: %x %x\n", S1[i] & (1<<1), S2[j] & 1);
        }
    }

    printf("\nThere are %d * %d number of sets of the cartesian product of S1 x S2 \nWith a focus on S2(x) as bit 1 S1(y) as bit 0\n", TEST_CYCLES, TEST_CYCLES);
    for (int i = 0; i < TEST_CYCLES; i++){
        printf("\nGrouping %d\n", i);   //Seperate each clump of inputs
        for (int j = 0; j < TEST_CYCLES; j++){
            printf("P = S1 x S2: %x %x\n", S2[i] & (1<<1), S2[j] & 1);
        }
    }
    return 0;
}

//JK FF function
_Bool JKFF(_Bool J, _Bool K, _Bool Q){

    if (J == 0 && K == 0){
        return Q;
    } else if (J == 1 && K == 0){
        return 1;
    } else if (J == 0 && K == 1){
        return 0;
    } else if (J == 1 && K == 1) {
        return !Q;
    }

    return Q;
}

//Simple circuit for project design problem
int circuit(int input) {
    _Bool A = input & 1;        //0th Bit
    _Bool B = (input & (1<<1)); //1st bit
    _Bool C = (input & (1<<2)); //2nd bit

    // From original design we want to swap NAND1 and XOR1
    _Bool XOR1 = !(A ^ B);
    _Bool NAND2 = !(B & C);

    //Moment 1
    _Bool moment1_Q = JKFF(XOR1, NAND2, 0); //JK output will be in reset mode on each pass of inputs
    _Bool NAND1 = !(moment1_Q & XOR1);
    _Bool XOR2 = (!moment1_Q ^ NAND2);

    //Moment 2
    _Bool moment2_Q = (NAND1, XOR2, 0);     // JK FF will be on reset mode for each input Q = 0
    _Bool NOR1 = !(moment2_Q | NAND1);
    _Bool AND1 = (!moment2_Q & XOR2);

    //Moment 3
    int output = NOR1 << 1;
    output = output | AND1;

    return output;
}

//Simple circuit for project design problem
int circuit_modified(int input) {
    _Bool A = input & 1;        //0th Bit
    _Bool B = (input & (1<<1)); //1st bit
    _Bool C = (input & (1<<2)); //2nd bit

    // From original design we want to swap NAND1 and XOR1
    _Bool XOR1 = !(A ^ B);
    _Bool NAND2 = !(B & C);

    //Moment 1
    _Bool moment1_Q = JKFF(XOR1, NAND2, 1); //JK output will be in reset mode on each pass of inputs
    _Bool NAND1 = !(moment1_Q & XOR1);
    _Bool XOR2 = (!moment1_Q ^ NAND2);

    //Moment 2
    _Bool moment2_Q = (NAND1, XOR2, 1);     // JK FF will be on reset mode for each input Q = 0
    _Bool NOR1 = !(moment2_Q | NAND1);
    _Bool AND1 = !(!moment2_Q | XOR2);

    //Moment 3
    int output = NOR1 << 1;
    output = output | AND1;

    return output;
}