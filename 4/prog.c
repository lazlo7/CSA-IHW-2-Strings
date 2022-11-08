#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define STR_CAPACIY 10000

int input_string(char* str) {
    char c;
    int i = 0;

    while ((c = getchar()) != '\n') {
        str[i] = c;
        ++i;
    }

    return i;
}

void print_string(const char* str, int size) {
    for (int i = 0; i < size; ++i) {
        printf("%c", str[i]);
    }
    printf("\n");
}

bool is_vowel(char c) {
    return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'y';
}

void capitalize_consonants(char* str, int size) {
    for (int i = 0; i < size; ++i) {
        if (str[i] >= 'a' && str[i] <= 'z') {
            if (!is_vowel(str[i])) {
                str[i] -= 32;
            }
        }
    }
}

int main() {
    char str[STR_CAPACIY];
    
    int size = input_string(str);
    capitalize_consonants(str, size);
    print_string(str, size);

    return 0;
}