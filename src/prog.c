#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <string.h>

#define STR_CAPACITY 10000

void input_string(char* str) {
    char c;
    int i = 0;

    while ((c = getchar()) != -1) {
        assert(i + 1 < STR_CAPACITY && "Input string is too long");
        str[i] = c;
        ++i;
    }

    str[i] = '\0';
}

void print_string(const char* str) {
    for (int i = 0; str[i] != '\0'; ++i) {
        putchar(str[i]);
    }
}

bool is_vowel(char c) {
    return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'y';
}

void capitalize_consonants(char* str) {
    for (int i = 0; str[i] != '\0'; ++i) {
        if (str[i] >= 'a' && str[i] <= 'z') {
            if (!is_vowel(str[i])) {
                str[i] -= 32;
            }
        }
    }
}

int main() {
    char str[STR_CAPACITY];

    input_string(str);
    capitalize_consonants(str);
    print_string(str);

    return 0;
}