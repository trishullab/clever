fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
This function takes a list l and returns a list l' such that
    l' is identical to l in the indicies that are not divisible by three, while its values at the indicies that are divisible by three are equal
    to the values of the corresponding indicies of l, but sorted.
    
*/
fn sort_third(l: Vec<i32>) -> Vec<i32> {


    let mut third = vec![];
    let mut out:Vec<i32> = vec![];

    for (indx,elem) in l.iter().enumerate(){
        if indx%3 == 0 && indx != 0{
            third.push(elem)
        }
    }
    third.sort();
    let mut indx_t:usize = 0;

    for i in 0..l.len() {
        if i%3 == 0 && i != 0{
            if indx_t < third.len(){
                out.push(*third[indx_t]);
                indx_t += 1;
        }
        }else{
            out.push(l[i]);
        }
        
    }
    return out;
}
