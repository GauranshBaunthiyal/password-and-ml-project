
library(ggplot2)


data <- data.frame(
  StudyHours = c(1,2,3,4,5,6,7,8,9,10),
  Marks = c(35,40,50,55,65,70,75,85,90,95)
)


model <- lm(Marks ~ StudyHours, data = data)

cat("=== Student Performance Predictor ===\n")


study_input <- as.numeric(readline("Enter study hours: "))


predicted_marks <- predict(model, data.frame(StudyHours = study_input))


cat("Predicted Marks:", round(predicted_marks, 2), "\n")


pred_data <- data.frame(
  StudyHours = data$StudyHours,
  PredictedMarks = predict(model, data)
)


par(mfrow = c(1, 2))


plot(data$StudyHours, data$Marks,
     main = "Actual Data",
     xlab = "Study Hours",
     ylab = "Marks",
     pch = 16)

abline(model, col = "blue", lwd = 2)


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
