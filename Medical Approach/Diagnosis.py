def get_user_input(question, options=None):
    """Prompts the user for input and returns the response."""
    print("\n" + question)
    if options:
        for idx, option in enumerate(options):
            print(f"{idx}: {option}")
        response = input("Select the appropriate number for your choice: ")
        while not response.isdigit() or int(response) not in range(len(options)):
            print("Invalid input. Please select a valid option.")
            response = input("Select the appropriate number for your choice: ")
        return int(response)
    else:
        # For numeric inputs outside options (ISI questions)
        response = input("Enter the appropriate number for your choice: ")
        while not response.isdigit() or int(response) < 0 or int(response) > 4:
            print("Invalid input. Please enter a valid number (0-4).")
            response = input("Enter the appropriate number for your choice: ")
        return int(response)

def calculate_phq_score(phq_responses):
    return sum(phq_responses)

def calculate_isi_score(isi_responses):
    return sum(isi_responses)

def interpret_phq_score(score):
    if score < 5:
        return "Absent or minimal depressive disorder"
    elif 5 <= score <= 14:
        return "Mild or subthreshold depressive disorder"
    elif 10 <= score <= 14:
        return "Moderate depressive disorder"
    elif 15 <= score <= 19:
        return "Markedly severe depressive disorder"
    else:
        return "Severe Depressive Disorder"

def interpret_isi_score(score):
    if score <= 7:
        return "Absence of insomnia"
    elif 8 <= score <= 14:
        return "Subclinical insomnia"
    elif 15 <= score <= 21:
        return "Moderate clinical insomnia"
    else:
        return "Severe clinical insomnia"

def collect_and_process_responses():
    # Define questionnaire
    phq_questions = [
        "Did you feel little interest or pleasure in doing things?",
        "Did you feel sad, depressed, or hopeless?",
        "Do you have trouble falling asleep or staying asleep or sleeping too much?",
        "Do you feel tired or low on energy?",
        "Do you have a change in appetite?",
        "Do you have a low opinion of yourself, or the feeling of being a loser, or that you have disappointed your family or that you are disappointed in yourself?",
        "Do you have difficulty concentrating, e.g., reading a newspaper, or watching television?",
        "Are you moving or speaking so slowly that other people may have noticed? Or so restless, that you're moving a lot more than usual?",
        "You thought you'd be better off dead or thought about hurting yourself in some way.",
    ]
    phq_options = ["Never (0)", "Sometimes (1)", "More than every other day (2)", "Almost every day (3)"]
    
    isi_questions = [
        "Do you have trouble falling asleep?",
        "Do you have any alarm clocks in the middle of the night?",
        "Do you have early awakenings?",
        "How DISSATISFIED/SATISFIED are you with your current sleep pattern?",
        "To what extent do you consider your sleep difficulties to be INTERFERING with your daily functioning?",
        "To what extent do you consider your sleep difficulties to be NOTICEABLE to others?",
        "How WORRIED/DISTRESSED are you about your current sleep difficulties?",
    ]
    isi_options = ["No (0)", "Light (1)", "Medium (2)", "Very (3)", "Extremely (4)"]

    # Collect responses
    phq_responses = [get_user_input(q, phq_options) for q in phq_questions]
    isi_responses = [get_user_input(q, isi_options) for q in isi_questions]

    # Calculate scores
    phq_score = calculate_phq_score(phq_responses)
    isi_score = calculate_isi_score(isi_responses)

    # Interpret scores
    print("\nResults:")
    print(f"PHQ Score: {phq_score} - {interpret_phq_score(phq_score)}")
    print(f"ISI Score: {isi_score} - {interpret_isi_score(isi_score)}")

if __name__ == "__main__":
    collect_and_process_responses()
