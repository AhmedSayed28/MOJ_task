# OrangeHRM Robot Framework Automation

Production-ready Robot Framework project using SeleniumLibrary with a Page Object Model structure for the OrangeHRM demo application.

## Application Under Test
- URL: https://opensource-demo.orangehrmlive.com/
- Admin user: `Admin / admin123`

## Project Structure

```
orangehrm-robot/
├── tests/
│   ├── smoke/
│   │   ├── employee.robot
│   │   ├── vacancy.robot
│   │   └── user.robot
│   └── regression/
│       ├── search_employee.robot
│       └── candidate.robot
├── pages/
│   ├── LoginPage.robot
│   ├── PIMPage.robot
│   ├── RecruitmentPage.robot
│   └── AdminPage.robot
├── resources/
│   ├── data/
│   │   ├── testdata.json
│   │   ├── TestData.py
│   │   └── Ahmed-Sayed-Ahmed.pdf
│   ├── keywords/
│   │   ├── BaseActions.robot
│   │   └── Common.robot
│   └── variables/
│       └── Variables.robot
├── results/
└── README.md
```

## Setup Instructions

### Prerequisites
- Python 3.9+
- Google Chrome browser
- ChromeDriver that matches your Chrome version

### Install Dependencies

```bash
pip install robotframework seleniumlibrary
```

## Execution Commands

Run all tests and generate HTML reports in `results/`:

```bash
robot -d results tests/
```

Run only smoke tests:

```bash
robot -d results -i smoke tests/
```

Run only regression tests:

```bash
robot -d results -i regression tests/
```

Run a single test suite:

```bash
robot -d results tests/smoke/employee.robot
```

## Framework Highlights

- **Page Object Model**: All locators and page behaviors live under `pages/`.
- **Reusable keywords**: Shared actions and smart waits are in `resources/keywords/`.
- **Explicit waits only**: `BaseActions.robot` wraps interactions with waits and retry handling.
- **Data-driven**: Test data is loaded from `resources/data/testdata.json` and reused consistently across suites.
- **Tags**: Smoke and regression tagging is enforced per test suite.
- **Screenshots on failure**: Captures automatically to `results/screens/`.
- **HTML reports**: Use `-d results` to generate `report.html` and `log.html`.
