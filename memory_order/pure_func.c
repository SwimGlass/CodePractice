#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const char *lookup(int val) __attribute__((const)); 

const struct {
    const char *str;
    int val;
} strings[] = {
    { "foo", 31 },
    { "bar", 34 },
    { "baz", -24 }
};

static const char *lookup(int val) {
    int i;
    for(i = 0; i < sizeof(strings)/sizeof(*strings); i++) {
        if ( strings[i].val == val ) {
            return strings[i].str;
        }
    }
    return NULL;
}

void testfunction(int val, const char **str, unsigned long *len) {
    if ( lookup(val) ) {
	    *str = lookup(val);
	    *len = strlen(lookup(val));
    }
}
