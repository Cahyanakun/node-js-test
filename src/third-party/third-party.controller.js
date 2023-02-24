const httpStatus = require('http-status');
const catchAsync = require('../common/helper/catchAsync');
const apiResponse = require('../common/helper/apiResponse');
const ApiError = require('../common/helper/ApiError');
const thirdPartyService = require('./third-party.service');

const list = catchAsync(async (req, res) => {
  const { query } = req;

  const result = await thirdPartyService.getList(query);
  if (!result.rows) throw new ApiError(httpStatus.BAD_REQUEST, 'Data Not Found');

  apiResponse(res, 'Success get list Positions', result);
});

const show = catchAsync(async (req, res) => {
  const { id } = req.params;
  const result = await thirdPartyService.findDetail(id);
  if (Object.keys(result).length === 0)
    throw new ApiError(httpStatus.BAD_REQUEST, 'Data Not Found');
  apiResponse(res, 'Success get Position', result);
});

module.exports = {
  list,
  show,
};
