// Importing required modules
const express = require("express");

// Creating an Express application
const app = express();
const PORT = 8002; // Port number

// Define a route to handle GET requests to the root URL '/'
app.get("/", (req, res) => {
  const response = {
    message: "Hello!!! Welcome to Kong API Gateway!!!",
  };
  res.status(200).json(response); // Sending 'Hello, World!' as the response
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
