# Assembly Conditional Instructions Lab

This repository contains assembly language exercises focused on conditional instructions and branching. The tasks demonstrate how to use comparisons and conditional jumps to solve simple problems, written in NASM syntax for x86 architecture.

## Objectives

- Use conditional instructions like `JE`, `JNE`, `JG`, and `JL` to control program flow.
- Implement logic to determine if a number is even or odd.
- Find the largest number among multiple inputs using conditional branching.
- Develop an understanding of assembly-level decision making.

## Files

- `even_numbers.asm` — Program to check if a number is even or odd.
- `largest_finder.asm` — Program to find the largest of five integers.
- 8challenges.md - Challenges through this activity
- Flowchart Assembly-conditional instructions.pdf 

## Usage

1. Assemble and link the program (Linux example):
   ```bash

    nasm -f elf64 even_numbers.asm -o even_numbers.o
   ld even_numbers.o -o even_numbers
   ./even_numbers

   nasm -f elf64 largest_finder.asm -o largest_finder.o
   ld largest_finder.o -o largest_finder
   ./largest_finder

2. Debug with GDB:
    ```
    gdb ./activity
    ```
    
3. Use GDB commands to step through instructions and observe variables/registers.

## Learning Outcomes

- Practice conditional jumps and comparisons in assembly language.
- Understand how to implement basic logic and decision structures.
- Gain familiarity with assembling and running x86 assembly programs.

---
