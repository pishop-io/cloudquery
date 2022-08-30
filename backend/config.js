module.exports = {
  rateLimit: {
    windowMs: 60 * 1000, // 1 minute
    max: 5, // limit each IP to 5 requests per windowMs
  },
};

