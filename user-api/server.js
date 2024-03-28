const express = require('express');
const mysql = require('mysql');
const app = express();

app.use(express.json());

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'IKFashionHub'
});

connection.connect(err => {
    if (err) throw err;
    console.log('Connected to MySQL database');
});


// This assumes you have a `sub_category` field in your `product` table.
app.get('/api/subcategories/:category', (req, res) => {
    const { category } = req.params;
    const sql = 'SELECT DISTINCT sub_category FROM product WHERE category = ?';
    connection.query(sql, [category], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error', details: error });
        }
        const subCategories = results.map(row => row.sub_category);
        res.json(subCategories);
    });
});



// Endpoint to get product variants by product ID
app.get('/api/productVariants/:productId', (req, res) => {
    const { productId } = req.params;
    const sql = 'SELECT * FROM ProductVariants WHERE product_id = ?';
    connection.query(sql, [productId], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error', details: error });
        }
        res.json(results);
    });
});





// Endpoint to get all distinct categories
app.get('/api/categories', (req, res) => {
    const sql = 'SELECT DISTINCT category FROM product';
    connection.query(sql, (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error' });
        }
        // Extract categories from the results
        const categories = results.map(row => row.category);
        res.json(categories);
    });
});






// Endpoint to get products by category
app.get('/api/products/:category', (req, res) => {
    const { category } = req.params;
    const sql = 'SELECT * FROM product WHERE category = ?';
    connection.query(sql, [category], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error' });
        }
        res.json(results);
    });
});



// Register user
app.post('/api/users/register', (req, res) => {
    const { email, password } = req.body;
    const query = 'INSERT INTO users (email, password) VALUES (?, ?)';
    connection.query(query, [email, password], (err, result) => {
        if (err) {
            res.status(500).json({ message: 'Error registering new user', error: err });
            return;
        }
        res.status(201).json({ message: 'User registered successfully', userId: result.insertId });
    });
});

// Authenticate user
app.post('/api/users/login', (req, res) => {
    const { email, password } = req.body;
    const query = 'SELECT * FROM users WHERE email = ? AND password = ?';
    connection.query(query, [email, password], (err, results) => {
        if (err) {
            res.status(500).json({ message: 'Error retrieving user details', error: err });
            return;
        }
        if (results.length > 0) {
            res.status(200).json({ message: 'Login successful', userId: results[0].id });
        } else {
            res.status(401).json({ message: 'Invalid credentials' });
        }
    });
});

app.post('/api/cart', (req, res) => {
    const { userId, items } = req.body;
    // Start a transaction to ensure all inserts are treated as a single operation
    connection.beginTransaction((transactionError) => {
        if (transactionError) {
            return res.status(500).json({ message: 'Transaction start error', error: transactionError });
        }
        const queries = items.map(item => {
            return new Promise((resolve, reject) => {
                const query = 'REPLACE INTO cart (userId, productId, quantity, imageUrl) VALUES (?, ?, ?, ?)';
                connection.query(query, [userId, item.product.id, item.quantity, item.product.image], (err, result) => {
                    if (err) reject(err);
                    resolve(result);
                });
            });
        });
        Promise.all(queries)
            .then(() => {
                connection.commit(commitError => {
                    if (commitError) {
                        return connection.rollback(() => {
                            res.status(500).json({ message: 'Transaction commit error', error: commitError });
                        });
                    }
                    res.status(201).json({ message: 'Cart saved successfully' });
                });
            })
            .catch(queryError => {
                connection.rollback(() => {
                    res.status(500).json({ message: 'Transaction error', error: queryError });
                });
            });
    });
});



const PORT = process.env.PORT || 3030;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});