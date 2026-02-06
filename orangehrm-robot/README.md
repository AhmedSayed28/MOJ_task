# OrangeHRM Robot Framework Tests

## Project Structure

```
orangehrm-robot/
│
├── tests/
│   ├── smoke/
│   │   ├── employee.robot
│   │   ├── vacancy.robot
│   │   └── user.robot
│   │
│   └── regression/
│       ├── search_employee.robot
│       └── candidate.robot
│
├── pages/
│   ├── LoginPage.robot
│   ├── PIMPage.robot
│   ├── RecruitmentPage.robot
│   └── AdminPage.robot
│
├── resources/
│   ├── Common.robot
│   └── Variables.robot
│
├── results/
│
└── README.md
```

## Description

This is a Robot Framework test automation project for OrangeHRM application.

### Directory Details

- **tests/**: Contains all test suites organized by type
  - **smoke/**: Smoke test cases
  - **regression/**: Regression test cases
  
- **pages/**: Page Object Model files for different pages
  
- **resources/**: Reusable keywords and variables
  - **Common.robot**: Common keywords
  - **Variables.robot**: Global variables and constants
  
- **results/**: Test execution results and reports

## Getting Started

### Prerequisites
- Python 3.x
- Robot Framework
- Required libraries (as per your project needs)

### Running Tests

```bash
# Run all tests
robot tests/

# Run smoke tests
robot tests/smoke/

# Run regression tests
robot tests/regression/

# Run specific test file
robot tests/smoke/employee.robot
```

### Generating Reports

Results are generated in the `results/` directory after test execution.

## Contributing

Follow the page object model pattern when creating new tests and keywords.
