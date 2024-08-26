#!/bin/bash

# Prompt the user for the restaurant name
read -p "Enter the new restaurant name: " restaurant_name

# Initialize arrays for the menu and prices
declare -A menu
declare -A prices

# Initialize item number
item_number=1

# Prompt the user for menu items and prices
while true; do
    read -p "Enter the item name (or type '-1' to finish): " item_name

    # Check if the user is done
    if [[ "$item_name" == "-1" ]]; then
        break
    fi

    read -p "Enter the item price: " item_price

    # Store the item name and price in the arrays
    menu[$item_number]="$item_name"
    prices[$item_number]=$item_price

    # Increment the item number
    ((item_number++))
done

# Get the current date for the file name
current_date=$(date +"%d-%m-%Y")
output_file="${restaurant_name}_bill_${current_date}.sh"

# Generate the bill generator script
cat <<EOF > $output_file
#!/bin/bash

# Pre-defined menu with item numbers
declare -A menu
menu=(
EOF

for i in "${!menu[@]}"; do
    echo "    [$i]=\"${menu[$i]}\"" >> $output_file
done

cat <<EOF >> $output_file
)

declare -A prices
prices=(
EOF

for i in "${!prices[@]}"; do
    echo "    [$i]=${prices[$i]}" >> $output_file
done

cat <<EOF >> $output_file
)

# Restaurant name
restaurant_name="$restaurant_name"

echo "Welcome to \$restaurant_name!"
echo "Here is our menu:"

# Display the menu in ascending order of item numbers
for number in \$(echo \${!menu[@]} | tr " " "\n" | sort -n); do
    echo "\$number. \${menu[\$number]}: ₹\${prices[\$number]}"
done

# Initialize order variables
declare -A order
total=0

# Take orders
while true; do
    read -p "Enter the item number you'd like to order (or type '-1' to finish): " item_number

    # Check if the user is done
    if [[ "\$item_number" == "-1" ]]; then
        break
    fi

    # Check if the item number exists in the menu
    if [[ -v "menu[\$item_number]" ]]; then
        read -p "Enter the quantity: " quantity
        order["\$item_number"]=\$quantity
        total=\$((total + (prices[\$item_number] * quantity)))
    else
        echo "Sorry, we don't have that item on the menu."
    fi
done

# Get current date and time for the bill in 24-hour format
current_date=\$(date +"%d-%m-%Y")
current_time=\$(date +"%H:%M:%S")  # 24-hour time format
order_id=\$(date +"%d%m%y%H%M")  # Format: ddmmyyHHMM

# File names
bill_file="bill_\${order_id}.txt"
pdf_file="bill_\${order_id}.pdf"

# Generate the bill text
echo "Generating your bill..."
echo "-------- \$restaurant_name --------" > \$bill_file
echo "Date: \$current_date" >> \$bill_file
echo "Time: \$current_time" >> \$bill_file  # 24-hour format time
echo "Order ID: \$order_id" >> \$bill_file
echo "---------------------------------" >> \$bill_file
for item_number in "\${!order[@]}"; do
    echo "\${menu[\$item_number]} (x\${order[\$item_number]}): ₹\$((\${order[\$item_number]} * prices[\$item_number]))" >> \$bill_file
done
echo "---------------------------------" >> \$bill_file
echo "Total: ₹\$total" >> \$bill_file
echo "Thank you for dining with us!" >> \$bill_file

# Convert the bill to PDF
libreoffice --headless --convert-to pdf \$bill_file --outdir .

# Rename the PDF to match the required format
mv "\${bill_file%.txt}.pdf" "\$pdf_file"

# Send the PDF to the printer
lp \$pdf_file

echo "Your bill has been generated as \$pdf_file and sent to the printer."
EOF

# Make the generated script executable
chmod +x $output_file

echo "Bill generator script has been created as $output_file."
