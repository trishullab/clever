fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    In this Kata, you have to sort an array of non-negative integers according to
    number of ones in their binary representation in ascending order.
    For similar number of ones, sort based on decimal value.
    
*/
fn sort_array_1(arr:Vec<i32>) -> Vec<i32>{


    let mut arr_cp = arr.clone();
    let mut bin = vec![];
    let mut m;

    for i in 0..arr_cp.len() {
        let mut b = 0;
        let mut n = arr_cp[i].abs();
        while n > 0 {
            b += n % 2;
            n = n / 2;
        }
        bin.push(b);
    }
    for i in 0..arr_cp.len() {
        for j in 1..arr_cp.len() {
            if bin[j] < bin[j - 1] || (bin[j] == bin[j - 1] && arr_cp[j] < arr_cp[j - 1]) {
                m = arr_cp[j];
                arr_cp[j] = arr_cp[j - 1];
                arr_cp[j - 1] = m;
                m = bin[j];
                bin[j] = bin[j - 1];
                bin[j - 1] = m;
            }
        }
    }
    return arr_cp;
}
