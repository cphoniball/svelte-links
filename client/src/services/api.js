const Api = () => {
    const host = "http://localhost:4000";

    const getToken = () => localStorage.getItem("token");

    const request = async (path, method = "get", body = {}, options = {}) => {
        const response = await fetch(host + path, {
            method,
            ...options,
            headers: {
                Authorization: `Bearer ${getToken()}`,
                ...options.headers
            }
        });

        const data = (await response.json()).data;

        return { response, data, status: response.status };
    };

    const buildRequest = (method = "get") => (path, body, options) => request(path, method, body, options);

    const get = buildRequest("get");
    const post = buildRequest("post");
    const put = buildRequest("put");
    const destroy = buildRequest("destroy");

    return { get, post, put, destroy };
};

export default Api();
