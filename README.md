# Body Calculator App - Flutter

The **Body Calculator App** is a Flutter-based application designed to help users calculate key body metrics, including:  
- **BMI** (Body Mass Index)  
- **BFP** (Body Fat Percentage)  
- **LBM** (Lean Body Mass)  
- **TEE** (Total Energy Expenditure)  

By providing basic information such as gender, age, weight, height, and activity level, users can gain a better understanding of their body composition and energy needs.  

---

## Features  
1. **Gender Selection**: Users can choose their gender (Male/Female).  
2. **Age Input**: Accepts the user's age in years.  
3. **Weight Input**: Users enter their weight in kilograms (kg).  
4. **Height Input**: Accepts height in centimeters (cm).  
5. **Activity Factor**: Users select their activity level from predefined options (e.g., sedentary, lightly active, moderately active, very active).  
6. **Calculation Results**: Displays calculated values for:  
   - **BMI**: A measure of body weight relative to height.  
   - **BFP**: The estimated percentage of body fat.  
   - **LBM**: The mass of the body minus the fat.  
   - **TEE**: The estimated daily energy expenditure based on activity level.
  
## Screenshots
![body_calculator_poster](https://github.com/user-attachments/assets/5f69a54b-dfae-4436-aac9-55e8769bfd95)


---

## How to Use  
1. Launch the app on your device.  
2. Enter the required details:  
   - Select your gender.  
   - Input your age in years.  
   - Provide your weight in kilograms.  
   - Enter your height in centimeters.  
   - Choose your activity factor.  
3. Tap the **Calculate** button.  
4. View the results, which will include your BMI, BFP, LBM, and TEE.  

---

## Formulas Used  
### 1. **BMI (Body Mass Index)**  
\[ \text{BMI} = \frac{\text{Weight (kg)}}{\left(\text{Height (m)}\right)^2} \]  

### 2. **BFP (Body Fat Percentage)**  
- **Men**:  
  \[ \text{BFP} = 1.20 \times \text{BMI} + 0.23 \times \text{Age} - 16.2 \]  
- **Women**:  
  \[ \text{BFP} = 1.20 \times \text{BMI} + 0.23 \times \text{Age} - 5.4 \]  

### 3. **LBM (Lean Body Mass)**  
- **Men**:  
  \[ \text{LBM} = (0.407 \times \text{Weight}) + (0.267 \times \text{Height}) - 19.2 \]  
- **Women**:  
  \[ \text{LBM} = (0.252 \times \text{Weight}) + (0.473 \times \text{Height}) - 48.3 \]  

### 4. **TEE (Total Energy Expenditure)**  
\[ \text{TEE} = \text{BMR} \times \text{Activity Factor} \]  
- **BMR (Basal Metabolic Rate)** calculated using the **Mifflin-St Jeor Equation**:  
  - **Men**:  
    \[ \text{BMR} = (10 \times \text{Weight}) + (6.25 \times \text{Height}) - (5 \times \text{Age}) + 5 \]  
  - **Women**:  
    \[ \text{BMR} = (10 \times \text{Weight}) + (6.25 \times \text{Height}) - (5 \times \text{Age}) - 161 \]  

#### Activity Factors:  
- **Sedentary**: 1.2  
- **Lightly Active**: 1.375  
- **Moderately Active**: 1.55  
- **Very Active**: 1.725  
- **Extra Active**: 1.9  

---

## Installation  
1. Clone this repository to your local machine:  
   ```bash  
   git clone https://github.com/yourusername/body-calculator-app.git  
   ```  
2. Navigate to the project directory:  
   ```bash  
   cd body-calculator-app  
   ```  
3. Install the dependencies:  
   ```bash  
   flutter pub get  
   ```  
4. Run the app:  
   ```bash  
   flutter run  
   ```  

---

## Screenshots  
Include screenshots of the app's interface (e.g., input form, results page).  

---

## Contribution  
If you'd like to contribute to this project, feel free to fork the repository and submit a pull request.  

---

## License  
This project is licensed under the MIT License.  

---

Let me know if you'd like to refine this or add more sections! 😊
