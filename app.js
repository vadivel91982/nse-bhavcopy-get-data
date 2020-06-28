const BhavCopy = require("./index");
var mysql = require('mysql');

var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'technicalkeeda',
  debug: false,
});

connection.connect();

console.log("Connected to Mysql");

const options = {
  type: 'json'  // optional. if not specified, zip file will be downloaded valid TYPES: ['json', 'csv', 'zip']
  //dir: "./" // optional. if not specified, files will be downloaded under NSE folder
};
const request = new BhavCopy(options);

request
  .download({
    month: "FEB", // required (values acn be anything given below under Month CODES)
    year: 2019, // required (values acn be anything given below under YEAR CODES)
    day: 15 // optional (values can be anything in range: 1 - 31)
  })
  .then(data => {
    console.log(data); // Wait! Files are downloading...
    let arrData = data[0].map(item => {
      const date = item.TIMESTAMP;
      const monthes = { "JAN": "01", "FEB": "02", "MAR": "03", "APR": "04", "MAY": "05", "JUN": "06", "JUL": "07", "AUG": "08", "SEP": "09", "OCT": "10", "NOV": "11", "DEC": "12" }

      const date_ar = date.split("-")
      const day = date_ar[0]
      const year = date_ar[2]
      const month = monthes[date_ar[1]]
      const new_date = [year, month, day].join("-")
      return [item.SYMBOL, item.SERIES, item.OPEN, item.HIGH, item.LOW, item.CLOSE, item.LAST, item.PREVCLOSE, item.TOTTRDQTY, item.TOTTRDVAL, new_date, item.TOTALTRADES, item.ISIN]
    }
    )

    connection.query(
      'INSERT INTO `nse_bhavcopy` (`symbol`, `series`, `open`, `high`, `low`, `close`, `last`, `prevclose`, `tottrdqty`, `tottrdval`, `timestamp`, `totaltrades`,`isin`) VALUES ?',
      [arrData],
      (error, results) => {
        console.log("Insert sucessfully")
      }
    );

    connection.end();

  })
  .catch(err => {
    console.log(err);
  });
