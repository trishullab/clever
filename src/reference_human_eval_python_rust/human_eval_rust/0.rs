fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Check if in given list of numbers, are any two numbers closer to each other than
    given threshold.
    
*/
fn has_close_elements(numbers:Vec<f32>, threshold: f32) -> bool{

    for i in 0..numbers.len(){
        for j in 1..numbers.len(){

            if i != j {
                let distance:f32 = numbers[i] - numbers[j];

            if distance.abs() < threshold{
                return true;
            }

            }
            
        }
    }

    return false;

}
