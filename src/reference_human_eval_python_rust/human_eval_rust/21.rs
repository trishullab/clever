fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Given list of numbers (of at least two elements), apply a linear transform to that list,
    such that the smallest number will become 0 and the largest will become 1
    
*/
fn rescale_to_unit(numbers:Vec<f32>) -> Vec<f32> {


    let min_number= *numbers.iter().min_by(|a, b| a.partial_cmp(b).unwrap()).unwrap();
    let max_number=  *numbers.iter().max_by(|a, b| a.partial_cmp(b).unwrap()).unwrap();
    return numbers.iter().map(|x:&f32| (x-min_number) / (max_number - min_number)).collect();
}
