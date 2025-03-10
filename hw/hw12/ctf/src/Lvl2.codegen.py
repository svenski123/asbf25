#!/usr/bin/env python3
X = ''.join(chr(ord('a')+i) for i in range(10))

for i, a in enumerate(X):
    for b in X[i+1:]:
        #print(f'\tif ({b}<{a}) ({a},{b})=({b},{a});')
        print(f'\t\t\tif lt({b},{a}){{let t:={a} {a}:={b} {b}:=t}}')
