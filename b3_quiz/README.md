# b3_quiz

This Flutter application is a quiz game designed for Android devices. The app features a home page, a quiz page with true/false questions, feedback dialogs for correct and incorrect answers, and a result page displaying the user's score.

## Project Structure

The project is organized as follows:

```
lib/
├── main.dart
├── pages/
│ ├── home_page.dart
│ ├── quiz_page.dart
│ └── result_page.dart
├── widgets/
│ ├── question_card.dart
│ ├── score_bar.dart
│ └── answer_dialog.dart
└── models/
  ├── question.dart
  └── quiz_data.dart
```

### `main.dart`

The entry point of the application. It initializes the app and sets the `HomePage` as the starting screen.

### `pages/`

Contains the main screens of the app:

- **`home_page.dart`**: Displays the welcome message and a button to start the quiz.
- **`quiz_page.dart`**: Presents the quiz questions, displays the current score, and includes buttons for answering true or false.
- **`result_page.dart`**: Shows the final score with a corresponding message and a button to return to the home page.

### `widgets/`

Houses reusable UI components:

- **`question_card.dart`**: Displays individual quiz questions along with an image and answer options.
- **`score_bar.dart`**: Shows the current score at the top of the quiz page.
- **`answer_dialog.dart`**: Provides feedback dialogs for correct or incorrect answers, each with a message and a button to proceed to the next question.

### `models/`

Defines the data structures:

- **`question.dart`**: Represents a quiz question, including the question text, the correct answer, and any associated image.
- **`quiz_data.dart`**: Contains a list of `Question` objects, serving as the data source for the quiz.

## Usage

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Run the app using your preferred Flutter development environment.
