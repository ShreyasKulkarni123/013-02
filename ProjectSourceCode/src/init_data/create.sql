CREATE TABLE IF NOT EXISTS Users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  balance INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS Stocks (
  symbol VARCHAR(5) PRIMARY KEY,
  search_keyWord VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Watchlist (
    user_id INT NOT NULL,
    symbol VARCHAR(5) NOT NULL,
    CONSTRAINT Users
        FOREIGN KEY (user_id)
        REFERENCES Users (id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Held_Stocks (
    user_id INT NOT NULL,
    symbol VARCHAR(5) NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT Users
        FOREIGN KEY (user_id)
        REFERENCES Users (id)
        ON DELETE CASCADE,
    CONSTRAINT Stocks
        FOREIGN KEY (symbol)
        REFERENCES Stocks (symbol)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Transactions (
    user_id INT NOT NULL,
    symbol VARCHAR(5) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT Users
        FOREIGN KEY (user_id)
        REFERENCES Users (id)
        ON DELETE CASCADE,
    CONSTRAINT Stocks
        FOREIGN KEY (symbol)
        REFERENCES Stocks (symbol)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Customizations (
    user_id INT NOT NULL,
    theme VARCHAR(100) NOT NULL,
    value VARCHAR(100) NOT NULL,
    CONSTRAINT Users
        FOREIGN KEY (user_id)
        REFERENCES Users (id)
        ON DELETE CASCADE
);
