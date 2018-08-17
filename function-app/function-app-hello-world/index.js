module.exports = function (context, req) {
    context.log('JavaScript HTTP trigger function processed a request.');

    context.res = {
        body: {
            message: "Hello world!",
            envName: process.env.NAME,
        },
        headers: {
            'Content-Type': 'application/json'
        }
    };
    context.done();
};
