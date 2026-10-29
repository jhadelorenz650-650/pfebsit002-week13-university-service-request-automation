# PFEBSIT 002: Integrative Programming and Technologies 2
## Week 13: Advanced Automation and Scripting

### Student Information
- **Course & Program:** Bachelor of Science in Information Technology (BSIT) - 3rd Year
- **Institution:** University of La Salette, Inc.

---

### Project Overview
This project implements a bounded workflow automation system featuring a **Flutter Web interface** connected to a secure backend pipeline. It demonstrates advanced automation patterns, local client-side validation, error handling, and robust retry/recovery mechanisms (handling transient vs. permanent failures).

---

### Features & Capabilities
- **Flutter Web Client**: Cross-platform responsive interface built to handle loading, success, validation, and error states.
- **Retry & Recovery Controls**: Implements bounded execution with simulated exponential backoff for transient failures and dead-letter routing for permanent failures.
- **Evidence Trail**: Fully documented lab logs, execution steps, and verification screenshots stored in the `evidence/` directory.

---

### Setup and Execution Instructions

1. **Prerequisites**: Ensure you have the Flutter SDK installed with web support enabled.
2. **Clone / Open Repository**: Open this project folder in Visual Studio Code.
3. **Get Dependencies**: Run the following command in your terminal:
   ```bash
   flutter pub get