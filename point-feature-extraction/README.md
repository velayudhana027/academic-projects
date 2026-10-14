# Analogy of Point Feature Extraction Techniques

Vivek A, Velayudhan A, Neeraj S, Nandakishore R Nair, Vishnu S. Presented at the International Conference on
Artificial Intelligence, Robots and Mechanical Engineering (ICAIRME), Thiruvananthapuram, 16 May 2021.

Detecting and matching the same feature points across images is the first step of visual odometry, SLAM and
marker tracking. This study compares eight detectors in MATLAB (Computer Vision Toolbox) on one reference image
and transformed copies of it: rotated, scaled and corrupted with noise. For each detector, the 500 strongest
points of the reference and the transformed image are matched, and the measured time and the number of matched
points are recorded.

## Results

Matched points (of the 500 strongest), from [`results.csv`](results.csv):

| Detector | Rot. 45° | Rot. 90° | Scale 120% | Scale 150% | Scale 170% | Scale 190% | Median noise | Gaussian noise | Dust & scratch |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| BRISK | 35 | 47 | 35 | 23 | 19 | 7 | 15 | 103 | 13 |
| FAST | 25 | 118 | 45 | 50 | 14 | 6 | 0 | 20 | 1 |
| Harris | 3 | 31 | 25 | 8 | 2 | 0 | 4 | 9 | 2 |
| KAZE | 44 | 41 | 76 | 23 | 7 | 13 | 28 | 162 | 49 |
| MinEigen | 3 | 46 | 28 | 5 | 4 | 4 | 2 | 3 | 3 |
| MSER | 140 | 193 | 67 | 29 | 41 | 28 | 18 | 12 | 14 |
| ORB | 41 | 41 | 61 | 42 | 71 | 25 | 34 | 8 | 34 |
| **SURF** | **142** | **327** | **200** | **228** | **177** | **172** | **94** | **259** | **94** |

- **SURF** kept the most matches under every transformation (188 on average across the nine cases; MSER came close only at 45° rotation).
- **MSER** was second under rotation; **KAZE** and **BRISK** held up best after SURF under Gaussian noise.
- Corner detectors (**Harris**, **MinEigen**) lost almost all matches under rotation, scaling and noise.
- Measured times were about 0.025–0.070 s for all detectors; KAZE (about 0.027 s on average) and MSER
  (about 0.034 s) were the fastest in these measurements.

## Files

| File | Contents |
| --- | --- |
| `results.csv` | Time and matched points for every detector and transformation, including the untransformed reference |
| `matlab/match_min_eigen.m` | Detection, feature extraction and matching script (shown with the MinEigen detector; the detector call is swapped per experiment) |
| `matlab/match_mser.m` | The same pipeline with MSER regions |
