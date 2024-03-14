This repository contains a Bash script designed to divide a large text file into smaller files with equal lines. It's particularly useful for processing large datasets in a more manageable form or distributing the content for parallel processing.

Example:

When you have thousands of subdomains to scan with nuclei or any other tool, sometimes, these tools do not work properly. I have created this script to overcome this issue and achieve more parallelism.

## Features

- Dynamically split a file based on the number of desired output files.
- Automatically calculates the required lines per file to ensure an even distribution.
- Renames output files based on the original file name, appending a sequence number for easy identification.


## Installation

1. Clone this repository to your local machine using the following command:

   ```bash
   git clone https://github.com/unstabl3/splitter.git
   ```

2. Navigate to the directory where the script is located:

   ```bash
   cd splitter
   ```

3. Make the script executable:

   ```bash
   chmod +x splitter.sh
   ```

## Usage

To use the script, specify the input file and the number of files you wish to split it into. The syntax is as follows:

```bash
./splitter.sh -f <input_file> -d <number_of_files>
```

### Parameters

- `-f`: Specifies the path to the input file you want to divide.
- `-d`: Specifies the number of files into which the input file should be split.

### Example

Suppose you have a file named `data.txt` that you want to split into 5 smaller files. You can achieve this by running:

```bash
./splitter.sh -f data.txt -d 5
```

This will split `data.txt` into 5 smaller files named `data_1.txt`, `data_2.txt`, ..., `data_5.txt`, each containing an equal number of lines.

<img width="672" alt="Screenshot 2024-03-15 at 12 30 39 AM" src="https://github.com/unstabl3/splitter/assets/48474764/dd3a4afb-27fb-4fc8-83a4-5204ddc28f54">


## Contributing

Contributions to improve the script or its documentation are welcome. Please feel free to fork the repository, make changes, and submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
