// Sample input data as an array of arrays
const data = [
    ["Product Code", "Premium Payment Term", "Total First Year Commission (Base + Segment)"],
    ["E9L,E9U", "PPT 7", "42.00%"],
    ["E9L,E9U", "PPT 10", "60.00%"],
    ["PRQ", "PPT 10", "60.00%"]
];

// Extract headers
const headers = data[0];

// Convert to JSON array and handle split Product Codes
const jsonData = data.slice(1).flatMap(row => {
    const productCodes = row[0].split(',').map(code => code.trim());
    return productCodes.map(code => {
        const obj = {};
        headers.forEach((header, index) => {
            if (header === "Product Code") {
                obj[header] = code;
            } else {
                obj[header] = row[index];
            }
        });
        return obj;
    });
});


console.log(JSON.stringify(jsonData, null, 2));
