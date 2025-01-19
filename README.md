# My UCLA MAE M20 Projects Repository

This repository contains a collection of MATLAB projects that demonstrate various numerical methods and computational techniques.

## Projects

### 1. **Surface Area of an Oblate Spheroid and Perimeter of an Ellipse**
   - **Purpose**: Calculates the surface area of an oblate spheroid and estimates the perimeter of an ellipse using different approximation methods.
   - **Algorithms**:
     - Surface Area Calculation: Uses trigonometric functions and logarithmic terms for accurate surface area computation.
     - Perimeter Approximations: Compares multiple formulas for perimeter estimation, including exact and approximate methods.

### 2. **Lunar Phase Calculator and Neighbor Identification**
   - **Purpose**: Implements a lunar illumination calculator and identifies neighboring cells in a grid-based layout.
   - **Algorithms**:
     - Lunar Illumination Calculation: Determines moon illumination using Julian date computations and sinusoidal relationships.
     - Neighbor Identification: Identifies neighbors in a 2D grid based on the cell's position and categorizes them as edge, corner, or interior.

### 3. **The Three Species Problem and Pocket Change Problem**
   - **Purpose**: Simulates population dynamics of three species and calculates the average number of coins required for change.
   - **Algorithms**:
     - Population Dynamics: Solves differential equations for species interactions using an iterative numerical approach.
     - Change Calculation: Implements a greedy algorithm to minimize the number of coins used to make change.

### 4. **Split-and-Average Problem and Runge-Kutta Radioactivity**
   - **Purpose**: Solves iterative split-and-average calculations and models radioactive decay using Runge-Kutta methods.
   - **Algorithms**:
     - Split-and-Average: Iteratively refines points based on neighboring averages with convergence criteria.
     - Runge-Kutta Methods: Simulates radioactive decay with varying accuracies using RK1, RK2, and RK4 methods.
       
### 5. **The Shared Birthday Problem and Random Walk Collisions**
   - **Purpose**: Simulates the likelihood of shared birthdays and models random walk collisions in a bounded area.
   - **Algorithms**:
     - Shared Birthday Problem: Uses probabilistic simulation to estimate the median number of people required for a shared birthday within 7 days.
     - Random Walk Collisions: Simulates the movement of two entities in a bounded area until they collide using a stochastic random walk approach.

### 6. **The Game of Life and Euler-Bernoulli Beam Bending**
   - **Purpose**: Simulates Conway's Game of Life and models beam deflection under load.
   - **Algorithms**:
     - Game of Life: Applies cellular automaton rules to simulate population dynamics on a grid.
     - Beam Bending: Uses finite difference methods to calculate deflection in an Euler-Bernoulli beam.

### 7. **Robotic Navigation and Mapping Simulation**
   - **Purpose**: This project develops a simulation to optimize the navigation of a robot within a mapped area containing obstacles and an exit point. Using stochastic methods, the simulation identifies the best initial    angle for the robot to reach the exit efficiently.
   - **Key Features**:
     - Simulates robotic movement with constant speed and deflections upon collisions.
     - Implements a stochastic approach to optimize the initial angle between 0° and 90°.
     - Compares results across three distinct map configurations to analyze performance.
   - **Algorithms**:
     - Collision Detection: Evaluates if the robot intersects with boundaries or obstacles.
     - Map Visualization: Dynamically visualizes the map, obstacles, robot, and exit during simulation.
     - Trial Optimization: Uses randomized angles to identify the best trajectory based on time-to-exit.
   - **Findings**:
     - Trial #1 achieves the shortest exit time of ~25.4 seconds with a best angle of ~6.89°.
     - Trial #2 takes longer due to increased map size, with an optimized time of ~41.4 seconds.
     - Trial #3, with the exit placed centrally, highlights the impact of map design, resulting in a significantly longer time of ~122.7 seconds.
     - The simulation demonstrates how small changes in map configuration or initial conditions lead to substantial variations in navigation efficiency, illustrating the complexities of predictive analysis in robotic systems.

## How to Run

Each project is contained in its own MATLAB file. To run a specific project, execute the corresponding `.m` file in MATLAB and follow the prompts or input the required parameters.

## Acknowledgments

These projects are part of coursework for CEE/MAE M20. Special thanks to the instructors and resources that contributed to their development.
