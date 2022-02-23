import express, { Application, Request, Response } from 'express';
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var logger = require('morgan');
var cors = require('cors');
const app: Application = express();
import { Pool } from 'pg';

let pool: Pool = new Pool({
  host: "localhost",
  user: "postgres",
  database: "postgres",
  password: '12345',
  port: parseInt("5432")
});
const PORT: number = 8000;
app.use(cors());
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));
app.use(cookieParser());
app.get('/', (req: Request, res: Response) => {
  res.send('Express + TypeScript Server');
});
app.post('/home', async (req: Request, res: Response) => {
  let name = req.body.name
  let desc = req.body.desc
  let price = req.body.price
  let post_code = req.body.post_code
  try {
    const ress = await pool.query(`INSERT INTO tbtest ("name","desc","price","post_code") VALUES('${name}','${desc}','${price}','${post_code}')`);
    res.json(ress ? true : false);
  } catch (error) {
    res.json(false);
  }

});
app.get('/home/', async (req: Request, res: Response) => {
  let skip = req.query.skip
  let take = req.query.take
let limit=''
if (take!='0') {
  limit='LIMIT '+take
}

  try {
    const ress = await pool.query(`SELECT * FROM tbtest ${limit}`);
    const data = { payload: ress.rows, count: ress.rows.length }
    res.json(ress ? data : false);
  } catch (error) {
    res.json(false);
  }

});
app.get('/postCode/', async (req: Request, res: Response) => {
  try {
    const ress = await pool.query(`SELECT post_code FROM tbtest`);
    const data = { payload: ress.rows, count: ress.rows.length }
    res.json(ress ? data : false);
  } catch (error) {
    res.json(false);
  }

});
app.get('/postCode/:id', async (req: Request, res: Response) => {
  try {
    const ress = await pool.query(`SELECT post_code FROM tbtest`);

    let item = ress.rows
    let sum: number = 0
    let med: number[] = []
    for (let index = 0; index < item.length; index++) {
      const element: string = item[index].post_code;
      sum = sum + parseFloat(element)
      med.push(parseFloat(element))

    }
    let ave = sum / item.length
    const mid = Math.floor(med.length / 2),
      nums = [...med].sort((a, b) => a - b);
    let mids = med.length % 2 !== 0 ? nums[mid] : (nums[mid - 1] + nums[mid]) / 2;

    res.json({ payload: { average: ave, median: mids } });
  } catch (error) {
    res.json(error);
  }

});
app.delete('/home/4')

app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`);
});