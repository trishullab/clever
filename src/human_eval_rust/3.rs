fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 You're given a list of deposit and withdrawal operations on a bank account that starts with
    zero balance. Your task is to detect if at any point the balance of account fallls below zero, and
    at that point function should return True. Otherwise it should return False.
    
*/
fn below_zero(operations:Vec<i32>) -> bool{


let mut balance:i32 = 0;
for op in operations {
    balance = balance + op;
    if balance < 0 {
        return true;
        }
    }
    return false;
}
