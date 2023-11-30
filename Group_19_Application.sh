calculate_triangular_numbers() {
    start=$1
    end=$2
    count=0
    multiple_of_3_count=0

    for (( n = start; n <= end; n++ )); do
        triangular_number=$((n * (n + 1) / 2))
        if (( triangular_number % 3 == 0 )); then
            echo -n "$triangular_number "
            ((multiple_of_3_count++))
        fi
        ((count++))
    done

    echo
    echo "Total triangular numbers within the range: $count"
    echo "Multiples of 3 within the range: $multiple_of_3_count"
}

find_even_square_numbers() {
    count=$1
    num=2

    while (( count > 0 )); do
        square1=$((num * num))
        square2=$((square1 * 2))

        if (( (square1 * square2) % 2 == 0 )); then
            echo "$square1 x $square2 = $((square1 * square2))"
            if (( (square1 * square2) % 2 == 0 )); then
                echo "Even"
            else
                echo "Odd"
            fi
            ((count--))
        fi

        ((num++))
    done
}

find_sequence_terms() {
    a=$1
    b=$2
    max_terms=$3
    sum=0
    
##Start of If Statement for positive int values for sequences
    if [[ $a =~ ^[0-9]+$ ]] && ((b >= 0)); then
        for (( n = 1; n <= max_terms; n++ )); do
            term=$((a * n * n * n + b * n))
            echo -n "$term "
            ((sum += term))
        done
        echo "Sum of terms: $sum"
    else
        echo "Error: Please ensure your inputs are positive values."
        echo      
    fi
    ##End of If statement that checks for Positive Input values for Sequences
}
##Start of Logic for asking for name and verifying continued use
echo "Welcome to the Shell Scripting Application!"
read -p "Please enter your name: " username
while true; do
    read -p "Hello, $username! Would you like to continue using the program? (1/2): " continue_choice

    if [[ $continue_choice == [1] ]]; then
        break  # Exit the loop if user chooses to continue
    elif [[ $continue_choice == [2] ]]; then
        echo "Goodbye, $username!"
        exit 0  # Exit the program if user chooses not to continue
    else
        echo "Invalid input. Please enter Y (yes) or N (no)."
    fi
done
## End of logic for handling name entry and continue verification
while true; do
    echo
    echo "Hello, $username! What would you like to do?"
    echo "A or 1: Find triangular numbers within a range"
    echo "B or 2: Find numbers as the product of two even square numbers"
    echo "C or 3: Find terms of a sequence"
    echo "D or 4: Exit"

    read -p "Enter your choice: " choice

    case $choice in
        A|a|1)

        ## Option 1 as required by assign
            echo "You have chosen menu choice A - Find triangular numbers within a range"
            sleep 2
            read -p "Enter the start of the range: " start
            read -p "Enter the end of the range: " end
            calculate_triangular_numbers $start $end
            ;;
        B|b|2)

        ## Option 2 as required by assign
            echo "You have chosen menu choice B - Find numbers as the product of two even square numbers"
            sleep 2
            read -p "Enter the number of such numbers to print: " count
            find_even_square_numbers $count
            ;;
        C|c|3)

        ## Option 3 as required by assign
            echo "You have chosen menu choice C - Find terms of a sequence"
            sleep 2
            read -p "Enter the value of 'a': " a
            read -p "Enter the value of 'b': " b
            read -p "Enter the maximum number of terms: " max_terms
            find_sequence_terms $a $b $max_terms
            ;;

            ## Option to leave the loop and close the program
        D|d|4)
            echo "You have chosen menu choice D - Exit"
            sleep 2
            echo "Goodbye, $username!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select A, B, C, or D."
            ;;
    esac

    read -p "Do you want to select another task (Y/N)? " continue
    if [ "$continue" != "Y" ] && [ "$continue" != "y" ]; then
        echo "Goodbye, $username!"
        exit 0
    fi
done
