const { Client } = require("pg");

const config = {
    host: process.env.DB_HOST ?? "localhost",
    port: process.env.DB_PORT ?? 5432,
    user: process.env.DB_USER ?? "root",
    password: process.env.DB_PASSWORD ?? "root",
    database: process.env.DB_NAME ?? "todoapp",
};

const client = new Client(config);

client.connect();

exports.query = async (query, values) => {
    const { rows } = await client.query(query, values);
    return rows;
};
