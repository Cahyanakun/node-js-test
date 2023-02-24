const axios = require('axios').default;
const getList = async (options) => {
  const base = 'http://dev3.dansmultipro.co.id/api/recruitment/positions.json';
  const response = await axios({
    method: 'GET',
    baseURL: base,
    params: {
      page: options.page,
      description: options.description,
      location: options.location,
    },
  })
    .then((response) => response.data)
    .catch(() => null);

  const data = {
    rows: response,
    page: response ? parseInt(options.page) : null,
    countPerPage: response ? response.length : null,
  };
  return data;
};

const findDetail = async (id) => {
  const base = 'http://dev3.dansmultipro.co.id/api/recruitment/positions/' + id;
  const response = await axios({
    method: 'GET',
    baseURL: base,
  })
    .then((response) => response.data)
    .catch(() => null);
  return response;
};

module.exports = {
  getList,
  findDetail,
};
