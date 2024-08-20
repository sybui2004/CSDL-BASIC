### Overview:
#### This project involves creating a database for a healthcare system. It will manage patient records, appointments, doctor information, and treatment history. You will use SQL to handle complex queries involving patient treatment histories, scheduling, and doctor-patient assignments.

#### Database Structure:
##### Patients: PatientID, Name, DOB, Gender, Address, ContactInfo
##### Doctors: DoctorID, Name, Specialty, ContactInfo
##### Appointments: AppointmentID, PatientID, DoctorID, Date, Time, Reason
##### Treatments: TreatmentID, AppointmentID, Description, Outcome
##### Prescriptions: PrescriptionID, PatientID, DrugName, Dosage, Duration

#### Basic Data Manipulation
**`Task 1. Retrieve a complete list of all registered patient.`**

**`Task 2. A patient has moved to a new address and updated their contact information. Reflect this change in the database.`**

**`Task 3. Delete a Doctor.`**


#### Intermediate Querying

**`Task 4. For a new brochure, list all doctors along with their specialties in alphabetical order.`**

**`Task 5. Analyze the patient demographic by counting the number of patients of each gender.`**

**`Task 6. Review the scheduling load by finding all appointments scheduled in a specific year.`**

#### Advanced Data Manipulation

**`Task 7. Classify older appointments as 'Old Appointment' and recent ones as 'Recent Appointment'.`**

**`Task 8. Remove appointments from the database that have not led to any treatments.`**

**`Task 9. To better categorize treatments, add a new column 'Treatment Type' to the Treatments table. `**

#### Advanced SQL Concepts and Joins

**`Task 10. Generate a report that shows each patient's name along with their appointment dates.`**

**`Task 11. Identify patients who have not made any appointments yet.`**

**`Task 12. Determine the most frequently prescribed drugs.`**

#### Set Operations and Complex Queries

**`Task 13. Create a complete contact list that includes both healthcare personnel (doctors in this case) and patients, including all entries even if some personnel are also patients.`**

**`Task 14. Identify doctors who are busier than average, based on the number of appointments.`**

**`Task 15. For a detailed treatment report, list all appointments along with their corresponding treatment outcomes.`**

#### Analyze Advanced

**`Task 16. Find the treatment history for a specific patient.`**

**`Task 17. List all treatments and their frequencies.`**

**`Task 18. Find upcoming appointments for each doctor. (Eg: 2023-1-1).`**

**`Task 19. Identify days with the highest number of appointments.`**

**`Task 20. Analyze the distribution of patients among doctors.`**

**`Task 21. Calculate the success rate of treatments for each doctor.`**

**`Task 22. Identify patients who have switched doctors more than twice within the last year.`**

**`Task 23. List doctors who have a success rate of over 75% in their treatments.`**

**`Task 24. Find the most common treatment description for patients who have received a specific drug more than or equal to one (Eg: Drug-897).`**

**`Task 25. Find the month with the highest average number of treatments per appointment across all doctors. `**