#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define SIZE 9

int grid[SIZE][SIZE];

int isSafe(int row, int col, int num) {
    for (int x = 0; x < SIZE; x++)
        if (grid[row][x] == num || grid[x][col] == num)
            return 0;

    int startRow = row - row % 3;
    int startCol = col - col % 3;

    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            if (grid[i + startRow][j + startCol] == num)
                return 0;

    return 1;
}

void shuffle(int *array) {
    for (int i = SIZE - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}

int fillGrid() {
    for (int row = 0; row < SIZE; row++) {
        for (int col = 0; col < SIZE; col++) {
            if (grid[row][col] == 0) {

                int numbers[SIZE];
                for (int i = 0; i < SIZE; i++)
                    numbers[i] = i + 1;

                shuffle(numbers);

                for (int i = 0; i < SIZE; i++) {
                    if (isSafe(row, col, numbers[i])) {
                        grid[row][col] = numbers[i];

                        if (fillGrid())
                            return 1;

                        grid[row][col] = 0;
                    }
                }
                return 0;
            }
        }
    }
    return 1;
}

void removeNumbers(int holes) {
    while (holes > 0) {
        int row = rand() % SIZE;
        int col = rand() % SIZE;

        if (grid[row][col] != 0) {
            grid[row][col] = 0;
            holes--;
        }
    }
}

void printGrid() {
    printf("\nSudoku Puzzle:\n\n");
    for (int i = 0; i < SIZE; i++) {
        if (i % 3 == 0 && i != 0)
            printf("---------------------\n");

        for (int j = 0; j < SIZE; j++) {
            if (j % 3 == 0 && j != 0)
                printf("| ");

            if (grid[i][j] == 0)
                printf(". ");
            else
                printf("%d ", grid[i][j]);
        }
        printf("\n");
    }
}

int main(int argc, char *argv[]) {

    if (argc != 2) {
        printf("Usage: %s [easy|medium|hard|expert|evil]\n", argv[0]);
        return 1;
    }

    srand(time(NULL));

    memset(grid, 0, sizeof(grid));
    fillGrid();

    int holes;

    if (strcmp(argv[1], "easy") == 0)
        holes = 35;
    else if (strcmp(argv[1], "medium") == 0)
        holes = 40;
    else if (strcmp(argv[1], "hard") == 0)
        holes = 45;
    else if (strcmp(argv[1], "expert") == 0)
        holes = 55;
    else if (strcmp(argv[1], "evil") == 0)
        holes = 60;
    else {
        printf("Invalid difficulty.\n");
        return 1;
    }

    removeNumbers(holes);
    printGrid();

    return 0;
}
