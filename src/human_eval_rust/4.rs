fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 For a given list of input numbers, calculate Mean Absolute Deviation
    around the mean of this dataset.
    Mean Absolute Deviation is the average absolute difference between each
    element and a centerpoint (mean in this case):
    MAD = average | x - x_mean |
    
*/
fn mean_absolute_deviation(numbers:Vec<f32>) -> f32{

    let mean:f32 = numbers.iter().fold(0.0,|acc:f32, x:&f32| acc + x) / numbers.len() as f32;
    return numbers.iter().map(|x:&f32| (x - mean).abs()).sum::<f32>() / numbers.len() as f32;
}

