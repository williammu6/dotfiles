# print piramid with provided height H
def print_piramid(H):
    for i in range(H):
        print(' ' * (H - i - 1) + '#' * (i + 1))


print(print_piramid(4))
