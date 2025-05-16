fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    You are given a 2 dimensional data, as a nested lists,
    which is similar to matrix, however, unlike matrices,
    each row may contain a different number of columns.
    Given lst, and integer x, find integers x in the list,
    and return list of tuples, [(x1, y1), (x2, y2) ...] such that
    each tuple is a coordinate - (row, columns), starting with 0.
    Sort coordinates initially by rows in ascending order.
    Also, sort coordinates of the row by columns in descending order.
    
*/
fn get_row(lst:Vec<Vec<i32>>, x:i32) -> Vec<Vec<i32>>{


    let mut out: Vec<Vec<i32>> = vec![];
    for (indxi, elem1) in lst.iter().enumerate() {
        for (indxj, _) in elem1.iter().rev().enumerate() {
            if lst[indxi][indxj] == x {
                out.push(vec![indxi as i32, indxj as i32]);
            }
        }
    }
    return out;
}
