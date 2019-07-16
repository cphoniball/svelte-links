import { writable } from "svelte/store";

const { subscribe, set, update } = writable({
    hasFetched: false,
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

    set({ hasFetched: true, isAuthenticated: true, userData: body.data });
};

const logout = () => {
    localStorage.removeItem("token");
    set({ hasFetched: true, isAuthenticated: false, userData: null });
};

export const auth = {
    subscribe,
    logout,
    getUserData
};
