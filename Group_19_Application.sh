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

    for (( n = 1; n <= max_terms; n++ )); do
        term=$((a * n * n * n + b * n))
        echo -n "$term "
        ((sum += term))
    done

    echo
    echo "Sum of terms: $sum"
}

echo "Welcome to the Shell Scripting Application!"
read -p "Please enter your name: " username

while true; do
    echo
    echo "Hello, $username! What would you like to do?"
    echo "A or 1: Find triangular numbers within a range"
    echo "B or 2: Find numbers as the product of two even square numbers"
    echo "C or 3: Find terms of a sequence"
    echo "D or 4: Exit"

    read -p "Enter your choice: " choice

    case $choice in
        A|1)
            read -p "Enter the start of the range: " start
            read -p "Enter the end of the range: " end
            echo "You selected: Find triangular numbers within a range"
            calculate_triangular_numbers $start $end
            ;;
        B|2)
            read -p "Enter the number of such numbers to print: " count
            echo "You selected: Find numbers as the product of two even square numbers"
            find_even_square_numbers $count
            ;;
        C|3)
            read -p "Enter the value of 'a': " a
            read -p "Enter the value of 'b': " b
            read -p "Enter the maximum number of terms: " max_terms
            echo "You selected: Find terms of a sequence"
            find_sequence_terms $a $b $max_terms
            ;;
        D|4)
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