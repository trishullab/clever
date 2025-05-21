fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
    You are given a rectangular grid of wells. Each row represents a single well,
    and each 1 in a row represents a single unit of water.
    Each well has a corresponding bucket that can be used to extract water from it, 
    and all buckets have the same capacity.
    Your task is to use the buckets to empty the wells.
    Output the number of times you need to lower the buckets.
*/
fn max_fill(grid:Vec<Vec<i32>>, capacity:i32) -> i32{


    let mut out: i32 = 0;

    for i in 0..grid.len() {
        let mut sum: i32 = 0;

        for j in 0..grid[i].len() {
            sum += grid[i][j];
        }
        if sum > 0 {
            out += (sum - 1) / capacity + 1;
        }
    }
    return out;
}
