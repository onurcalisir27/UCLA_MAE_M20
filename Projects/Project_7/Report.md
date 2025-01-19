# Final Project: Robotic Navigation and Mapping Simulation

## Overview

The goal of this project is to simulate a robotic mapping model where the robot must navigate from an initial position to an exit while avoiding obstacles. The robot travels in straight lines, deflecting upon collisions, and the initial angle of departure is optimized using stochastic simulations.

## Model and Theory

The project consists of a main script and six functions:

1. **Draw Circle (`draw_cir`)**: Plots a solid circle representing the robot.
2. **Draw Rectangle (`draw_rec`)**: Plots empty rectangles representing the map boundaries, obstacles, and exit box.
3. **Plot Map (`plot_map`)**: Combines `draw_cir` and `draw_rec` to visualize the map, including the robot, obstacles, and exit.
4. **Collision Detection (`check_collisions`)**: Checks if the robot has collided with boundaries or obstacles and identifies the type of collision.
5. **Update Map (`update_map`)**: Updates the robot's position or velocity based on collision conditions.
6. **Run Trial (`run_trial`)**: Simulates one trial of the robot's movement and returns the time to reach the exit.

### Simulation Details
- **Parameters**:
  - Robot: Circular with a fixed radius and speed.
  - Map: Configurations vary in size and obstacle placement across three trials.
  - Exit: Positioned at specific locations for each trial.
- **Stochastic Process**:
  - Initial angles are randomized between 0° and 90°.
  - Each trial iterates through 10 bins with 10,000 runs per bin to optimize the angle.

### Trials
1. **Trial 1**:
   - Map Size: 1000 x 300
   - Exit Position: Top-right corner
   - Findings:
     - Best Angle: ~6.89°
     - Time to Exit: ~25.4 seconds

2. **Trial 2**:
   - Map Size: 1000 x 500
   - Exit Position: Top-right corner
   - Findings:
     - Best Angle: ~7.12°
     - Time to Exit: ~41.4 seconds

3. **Trial 3**:
   - Map Size: 1000 x 500
   - Exit Position: Center of the right boundary
   - Findings:
     - Best Angle: ~35.73°
     - Time to Exit: ~122.7 seconds

### Observations
- Narrower maps (Trial 1) enable faster exits compared to wider configurations (Trial 2 and Trial 3).
- Exit placement significantly impacts efficiency, with corner exits yielding better results.
- Increased velocity reduces exit time for Trial 3 but complicates navigation for Trials 1 and 2.

## Conclusions

The simulation highlights the complexities of robotic navigation in constrained environments. Key takeaways include:
- Map geometry and exit placement are critical factors affecting navigation efficiency.
- Stochastic methods provide robust solutions for optimizing initial conditions.
- Even slight variations in parameters result in significant changes in performance, emphasizing the challenges of predictive analysis in robotics.

## Acknowledgments

This project was developed as part of the CEE/MAE M20 coursework. Special thanks to the instructors and peers for their guidance and support.
