fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given a grid with N rows and N columns (N >= 2) and a positive integer k, 
    each cell of the grid contains a value. Every integer in the range [1, N * N]
    inclusive appears exactly once on the cells of the grid.

    You have to find the minimum path of length k in the grid. You can start
    from any cell, and in each step you can move to any of the neighbor cells,
    in other words, you can go to cells which share an edge with you current
    cell.
    Please note that a path of length k means visiting exactly k cells (not
    necessarily distinct).
    You CANNOT go off the grid.
    A path A (of length k) is considered less than a path B (of length k) if
    after making the ordered lists of the values on the cells that A and B go
    through (let's call them lst_A and lst_B), lst_A is lexicographically less
    than lst_B, in other words, there exist an integer index i (1 <= i <= k)
    such that lst_A[i] < lst_B[i] and for any j (1 <= j < i) we have
    lst_A[j] = lst_B[j].
    It is guaranteed that the answer is unique.
    Return an ordered list of the values on the cells that the minimum path go through.
    
*/
fn min_path(grid: Vec<Vec<i32>>, k: i32) -> Vec<i32> {


    let mut out: Vec<i32> = vec![];
    let mut x = 0;
    let mut y = 0;
    let mut min: i32 = (grid.len() * grid.len()) as i32;
    for i in 0..grid.len() {
        for j in 0..grid[i].len() {
            if grid[i][j] == 1 {
                x = i;
                y = j;
            }
        }
    }
    if x > 0 && grid[x - 1][y] < min {
        min = grid[x - 1][y];
    }
    if x < grid.len() - 1 && grid[x + 1][y] < min {
        min = grid[x + 1][y];
    }
    if y > 0 && grid[x][y - 1] < min {
        min = grid[x][y - 1];
    }
    if y < grid.len() - 1 && grid[x][y + 1] < min {
        min = grid[x][y + 1];
    }
    let mut out = vec![];
    for i in 0..k {
        if i % 2 == 0 {
            out.push(1);
        } else {
            out.push(min);
        }
    }
    out
}
