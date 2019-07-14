import { writable } from "svelte/store";

const { subscribe, set, update } = writable({
    isAuthenticated: false,
    userData: null
});

const getUserData = async () => {
    const token = localStorage.getItem("token");

    if (!token) return;

    const response = await fetch("http://localhost:4000/me", {
        method: "get",
        headers: {
            Authorization: `Bearer ${token}`
        }
    });

    const body = await response.json();

    console.log(body);

    set({ isAuthenticated: true, userData: body.data });
};

const logout = () => {
    localStorage.removeItem("token");
    set({ isAuthenticated: false, userData: null });
};

export const auth = {
    subscribe,
    logout,
    getUserData
};
