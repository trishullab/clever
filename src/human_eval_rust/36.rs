fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Return the number of times the digit 7 appears in integers less than n which are divisible by 11 or 13.
    
*/
fn fizz_buzz(n:i32) -> i32{


    let mut ns:Vec<i32> = vec![];

    for i in 0..n{
        if i % 11 == 0 || i % 13 == 0{
            ns.push(i);
        }
    }

    let s:String = ns.into_iter().fold(String::new(),|s:String, n:i32| {s + &n.to_string()});
    let mut ans:i32 = 0;

    for c in s.chars(){
        if c == '7'{
        ans += 1;
        }
    }
    return ans;
}
