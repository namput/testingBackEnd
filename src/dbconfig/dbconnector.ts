import { Pool } from 'pg';

export default new Pool({
    host: "localhost",
    user: "postgres",
    database: "postgres.bdtest",
    password: '12345',
    port: parseInt("5432")
  });