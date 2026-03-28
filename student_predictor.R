# Install if not already installed
# install.packages("ggplot2")

# Load library
library(ggplot2)

# Create dataset
data <- data.frame(
  StudyHours = c(1,2,3,4,5,6,7,8,9,10),
  Marks = c(35,40,50,55,65,70,75,85,90,95)
)

# Train linear regression model
model <- lm(Marks ~ StudyHours, data = data)

cat("=== Student Performance Predictor ===\n")

# Take input from user
study_input <- as.numeric(readline("Enter study hours: "))

# Predict marks
predicted_marks <- predict(model, data.frame(StudyHours = study_input))

# Display result
cat("Predicted Marks:", round(predicted_marks, 2), "\n")

# 🔥 Create predicted data
pred_data <- data.frame(
  StudyHours = data$StudyHours,
  PredictedMarks = predict(model, data)
)

# 🔥 Side-by-side layout
par(mfrow = c(1, 2))

# 🔹 Graph 1: Actual Data
plot(data$StudyHours, data$Marks,
     main = "Actual Data",
     xlab = "Study Hours",
     ylab = "Marks",
     pch = 16)

abline(model, col = "blue", lwd = 2)

# 🔹 Graph 2: Predicted Data
plot(pred_data$StudyHours, pred_data$PredictedMarks,
     main = "Predicted Data",
     xlab = "Study Hours",
     ylab = "Predicted Marks",
     pch = 16,
     col = "red")

lines(pred_data$StudyHours, pred_data$PredictedMarks,
      col = "red", lwd = 2)

# Reset layout
par(mfrow = c(1,1))