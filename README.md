# Automated Testing for Module 13 with Curl

Curl is a command-line tool used to transfer data to and from servers using various protocols, including HTTP, FTP, and SMTP. It is a versatile tool that is widely used by developers and system administrators for testing APIs, debugging, and automation. One of the primary benefits of using curl for API testing is its ability to automate repetitive tasks, making it ideal for integration testing and continuous integration environments. Curl's flexibility also allows developers to easily test and debug various aspects of an API, including request and response headers, cookies, and authentication. With its wide range of features and ease of use, curl is an excellent tool for any developer looking to automate their API testing workflow.

## Getting Started 
1. Open your terminal or command prompt.
2. Navigate to the directory where the shell scripts are located.
3. Use the `chmod` command to make the scripts executable by typing:
    
    ```
    chmod +x categorys.sh tags.sh products.sh 
    ```
    
4. Now that the scripts are executable, you can run them using:
    
    ```
    ./categorys.sh 
    ./tags.sh 
    ./products.sh
    ```
    
Note: The `./` preceding the name of the script is important as it tells the terminal to look for the script in the current directory. If you don't include `./`, the terminal will look for the script in your system's PATH directories, which may not include the current directory.

## Expected Output 
1. When creating a new model, the ID and name should be displayed.
2. Find the newly made model by ID, the models information should be displayed.
3. Update the model, the HTTP status should be displayed.
4. Find updated model, the updated models information should be displayed.
5. Delete the updated model, the deleted category ID should be displayed.
6. Try to find the deleted model using ID, an error should be displayed.
7. Get all instances, for manual verification if needed.





