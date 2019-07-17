const Api = () => {
    const host = "http://localhost:4000";

    const getToken = () => localStorage.getItem("token");

    const request = async (path, method = "get", body = null, options = {}) => {
        const response = await fetch(host + path, {
            method,
            ...options,
            body: body ? JSON.stringify(body) : null,
            headers: {
                Authorization: `Bearer ${getToken()}`,
                "Content-Type": "application/json",
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
