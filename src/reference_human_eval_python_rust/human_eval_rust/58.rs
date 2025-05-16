fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Return sorted unique common elements for two lists.
    
*/
fn common(l1:Vec<i32>, l2:Vec<i32>) -> Vec<i32>{


let mut res:Vec<i32> = l1.into_iter().filter(|n:&i32| l2.contains(n)).collect();
res.sort();
return res;
}
